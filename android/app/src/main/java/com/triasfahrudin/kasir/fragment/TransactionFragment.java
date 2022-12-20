package com.triasfahrudin.kasir.fragment;

import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.triasfahrudin.kasir.LoginActivity;
import com.triasfahrudin.kasir.MainActivity;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.model.TransactionModel;
import com.triasfahrudin.kasir.model_list.TransactionModelList;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import butterknife.BindView;
import butterknife.ButterKnife;
import es.dmoral.toasty.Toasty;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class TransactionFragment extends Fragment {

	ListAdapter adapter;
	private ArrayList<HashMap<String, String>> transactionList;

	Session session;
	ProgressDialog loading;
	BaseApiService mBaseApiService;
	Context mContext;

	@BindView(R.id.trans_listview)
	ListView listview;

	@Override
	public void onAttach(Context context) {
		super.onAttach(context);
		mContext = context;
	}

	public View onCreateView(@NonNull LayoutInflater inflater,
							 ViewGroup container, Bundle savedInstanceState) {

		View root = inflater.inflate(R.layout.fragment_transaction_list, container, false);
		ButterKnife.bind(this, root);

		mBaseApiService = UtilsApi.getAPIService();
		session = new Session(mContext);


		loadData();

		FloatingActionButton floatingActionButton = ((MainActivity) getActivity()).getFloatingActionButton();
		if (floatingActionButton != null) {
			floatingActionButton.hide();
			floatingActionButton.setOnClickListener(view -> {
			});
		}


		return root;
	}

	private void loadData() {

		transactionList = new ArrayList<>();
		new getTransaction().execute();

	}


	@SuppressLint("StaticFieldLeak")
	private class getTransaction extends AsyncTask<Void, Void, Void> {
		@Override
		protected void onPreExecute() {
			super.onPreExecute();
			loading = new ProgressDialog(mContext);
			loading.setMessage("Mengambil data...");
			loading.setCancelable(false);
			loading.show();
		}

		@Override
		protected Void doInBackground(Void... voids) {

			HashMap<String, String> headers = new HashMap<String, String>();
			headers.put("Authorization", session.getAccessToken());
			headers.put("Accept", "application/json");

			mBaseApiService.getTransaction(headers).enqueue(new Callback<TransactionModelList>() {
				@Override
				public void onResponse(@NonNull Call<TransactionModelList> call, @NonNull Response<TransactionModelList> response) {
					if (response.isSuccessful()) {
						getActivity().runOnUiThread(new Runnable() {
							@Override
							public void run() {
								if (loading.isShowing())
									loading.dismiss();
							}
						});


						ArrayList<TransactionModel> modelList = Objects.requireNonNull(response.body()).getArrayList();

						for (TransactionModel sm : modelList) {
							HashMap<String, String> trans = new HashMap<>();

							trans.put("tgl", sm.getTgl());
							trans.put("jml_transaksi", Integer.toString(sm.getJml_transaksi()));
							trans.put("total_harga_jual", UtilsApi.formatRupiah(sm.getTotal_harga_jual()));
							trans.put("keuntungan", UtilsApi.formatRupiah(sm.getKeuntungan()));

							transactionList.add(trans);
						}

						adapter = new SimpleAdapter(
								mContext, transactionList,
								R.layout.gridlist_transaction, new String[]{"tgl", "jml_transaksi", "total_harga_jual", "keuntungan"},
								new int[]{R.id.trans_tvTanggal, R.id.trans_tvJmlTrans, R.id.trans_tvTotalHargaJual, R.id.trans_tvTotalKeuntungan});
						listview.setAdapter(adapter);

						Log.i("onResponse", String.valueOf(transactionList.size()));

					} else {
						getActivity().runOnUiThread(() -> {
							if (loading.isShowing())
								loading.dismiss();

							Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
							session.saveBoolean(Session.LOGIN_STATUS, false);
							Intent intent = new Intent(getActivity(), LoginActivity.class);
							startActivity(intent);


//								Toasty.error(mContext, "Ada kesalahan! :: ", Toasty.LENGTH_LONG, true).show();
//							loading.dismiss();
						});

					}
				}

				@Override
				public void onFailure(Call<TransactionModelList> call, Throwable t) {

					getActivity().runOnUiThread(() -> {
						if (loading.isShowing())
							Toasty.error(mContext, "Ada kesalahan! :: " + t.getMessage(), Toasty.LENGTH_LONG, true).show();
						loading.dismiss();
					});

				}
			});


			return null;
		}

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			if (loading.isShowing()) {
				loading.dismiss();
			}

//			Log.i("onPostExecute",String.valueOf(stokList.size()));
//
//			adapter = new SimpleAdapter(
//					mContext, stokList,
//					R.layout.grid_stok, new String[]{"nama_barang", "satuan", "qty"},
//					new int[]{R.id.stok_tvNamaBarang, R.id.stok_tvSatuan, R.id.stok_tvQty});
//			listview.setAdapter(adapter);
		}
	}
}
