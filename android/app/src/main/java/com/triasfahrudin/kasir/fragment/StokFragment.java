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
import com.triasfahrudin.kasir.model.StokModel;
import com.triasfahrudin.kasir.model_list.StokModelList;
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

public class StokFragment extends Fragment {

	ListAdapter adapter;
	private ArrayList<HashMap<String, String>> stokList;

	Session session;
	ProgressDialog loading;
	BaseApiService mBaseApiService;
	Context mContext;

	@BindView(R.id.stok_listview)
	ListView listview;

	@Override
	public void onAttach(Context context) {
		super.onAttach(context);
		mContext = context;
	}

	public View onCreateView(@NonNull LayoutInflater inflater,
							 ViewGroup container, Bundle savedInstanceState) {

		View root = inflater.inflate(R.layout.fragment_stok_list, container, false);
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

		stokList = new ArrayList<>();
		new getStok().execute();

	}


	@SuppressLint("StaticFieldLeak")
	private class getStok extends AsyncTask<Void, Void, Void> {
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

			mBaseApiService.getStok(headers).enqueue(new Callback<StokModelList>() {
				@Override
				public void onResponse(@NonNull Call<StokModelList> call, @NonNull Response<StokModelList> response) {
					if (response.isSuccessful()) {
						getActivity().runOnUiThread(new Runnable() {
							@Override
							public void run() {
								if (loading.isShowing())
									loading.dismiss();
							}
						});


						ArrayList<StokModel> modelList = Objects.requireNonNull(response.body()).getArrayList();

						for (StokModel sm : modelList) {
							HashMap<String, String> stok = new HashMap<>();

							stok.put("nama_barang", sm.getNama_barang());
							stok.put("satuan", sm.getSatuan());
							stok.put("qty", String.valueOf(sm.getQty()));


							stokList.add(stok);
						}

						adapter = new SimpleAdapter(
								mContext, stokList,
								R.layout.gridlist_stok, new String[]{"nama_barang", "satuan", "qty"},
								new int[]{R.id.stok_tvNamaBarang, R.id.stok_tvSatuan, R.id.stok_tvQty});
						listview.setAdapter(adapter);

						Log.i("onResponse", String.valueOf(stokList.size()));

					} else {
						getActivity().runOnUiThread(() -> {
							if (loading.isShowing())
								loading.dismiss();

							Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
							session.saveBoolean(Session.LOGIN_STATUS, false);
							Intent intent = new Intent(getActivity(), LoginActivity.class);
							startActivity(intent);

						});

					}
				}

				@Override
				public void onFailure(Call<StokModelList> call, Throwable t) {

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
