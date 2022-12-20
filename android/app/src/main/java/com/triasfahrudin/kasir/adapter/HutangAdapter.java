package com.triasfahrudin.kasir.adapter;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.fragment.CartFragment;
import com.triasfahrudin.kasir.fragment.HutangFragment;
import com.triasfahrudin.kasir.model.CartModel;
import com.triasfahrudin.kasir.model.HutangModel;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import es.dmoral.toasty.Toasty;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class HutangAdapter extends RecyclerView.Adapter<HutangAdapter.HutangViewHolder> {

	private final ArrayList<HutangModel> hutangModelArrayList;
	Session session;
	BaseApiService mBaseApiService;
	Context mContext;

	public HutangAdapter(Context mContext, Session session, BaseApiService mBaseApiService, ArrayList<HutangModel> hutangModelArrayList) {
		this.hutangModelArrayList = hutangModelArrayList;
		this.mContext = mContext;
		this.session = session;
		this.mBaseApiService = mBaseApiService;
	}

	@NonNull
	@Override
	public HutangViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
		LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
		View view = layoutInflater.inflate(R.layout.recycler_hutang, parent, false);
		return new HutangAdapter.HutangViewHolder(view);
	}

	@Override
	public void onBindViewHolder(@NonNull HutangViewHolder holder, int position) {
		double total = hutangModelArrayList.get(position).getTotal_harga_jual();
		double kurang_bayar = hutangModelArrayList.get(position).getKurang_bayar();

		holder.tvTanggal.setText(hutangModelArrayList.get(position).getTanggal());
		holder.tvPembeli.setText(hutangModelArrayList.get(position).getNama_pembeli());
		holder.tvTotalHarga.setText(UtilsApi.formatRupiah(total));
		holder.tvKurangBayar.setText(UtilsApi.formatRupiah(kurang_bayar));

		holder.btnBayar.setOnClickListener(view -> {
			AlertDialog.Builder dialog = new AlertDialog.Builder(mContext);
			LayoutInflater inflater = LayoutInflater.from(mContext);
			View dialogView = inflater.inflate(R.layout.fragment_bayar_hutang, null);
			dialog.setView(dialogView);

			dialog.setCancelable(true);

			TextView tvTotal = dialogView.findViewById(R.id.hutang_tvTotal);
			TextView tvKurangBayar = dialogView.findViewById(R.id.hutang_tvKurangBayar);
			EditText etBayarTunai = dialogView.findViewById(R.id.hutang_etTunai);
			TextView tvKembali = dialogView.findViewById(R.id.hutang_tvKembali);
			Button btnBatal = dialogView.findViewById(R.id.hutang_btnBatal);
			Button btnBayar = dialogView.findViewById(R.id.hutang_btnBayar);

			final AlertDialog ad = dialog.create();
			ad.requestWindowFeature(Window.FEATURE_NO_TITLE);
			ad.show();

			btnBatal.setOnClickListener(new View.OnClickListener() {
				@Override
				public void onClick(View view) {
					ad.dismiss();
				}
			});

			btnBayar.setOnClickListener(new View.OnClickListener() {
				@Override
				public void onClick(View view) {

					ProgressDialog loading = ProgressDialog.show(mContext, null, "Menyimpan data pembayaran...", true, false);

					HashMap<String, String> headers = new HashMap<String, String>();
					headers.put("Authorization", session.getAccessToken());
					headers.put("Accept", "application/json");

					mBaseApiService.bayarHutang(
							headers,
							hutangModelArrayList.get(position).getId(),
							Double.parseDouble(etBayarTunai.getText().toString())
					).enqueue(new Callback<ResponseBody>() {
						@Override
						public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
							if (response.isSuccessful()) {
								loading.dismiss();
								try {

									JSONObject jsonObject = new JSONObject(response.body().string());

									if (jsonObject.getString("status").equals("true")) {

										ad.dismiss();

										String error_message = jsonObject.getString("error_msg");
										Toasty.success(mContext, error_message, Toasty.LENGTH_LONG).show();

										HutangFragment fragment = new HutangFragment();
										AppCompatActivity activity = (AppCompatActivity) view.getContext();
										activity.getSupportFragmentManager()
												.beginTransaction()
												.replace(R.id.nav_host_fragment, fragment, HutangFragment.class.getSimpleName())
												.addToBackStack(null)
												.commit();

									} else {
										String error_message = jsonObject.getString("error_msg");
										Toasty.error(mContext, error_message, Toasty.LENGTH_LONG).show();

									}

								} catch (IOException | JSONException e) {
									//Log.i("LOGIN", "Login GAGAL " + e.getMessage());
								}

							} else {
								loading.dismiss();
							}
						}

						@Override
						public void onFailure(Call<ResponseBody> call, Throwable t) {
							Toasty.error(mContext, "ERROR:" + t.getMessage(), Toasty.LENGTH_LONG).show();
							Log.e("debug", "onFailure: ERROR > " + t.toString());
							loading.dismiss();
						}
					});

				}
			});


			tvTotal.setText(UtilsApi.formatRupiah(total));
			tvKurangBayar.setText(UtilsApi.formatRupiah(kurang_bayar));

			etBayarTunai.addTextChangedListener(new TextWatcher() {
				@Override
				public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

				}

				@Override
				public void onTextChanged(CharSequence charSequence, int start, int befora, int count) {
					//if(charSequence.length() != 0){
					double tunai = 0.0;
					if (!etBayarTunai.getText().toString().equals("")) {
						tunai = Double.parseDouble(etBayarTunai.getText().toString());
					}

					//tunai = Double.parseDouble(etTunai.getText().toString());
					double kembalian = tunai - kurang_bayar;

					tvKembali.setText(String.format("%s", UtilsApi.formatRupiah(kembalian)));
				}

				@Override
				public void afterTextChanged(Editable editable) {

				}
			});

			etBayarTunai.setOnFocusChangeListener(new View.OnFocusChangeListener() {
				@Override
				public void onFocusChange(View view, boolean has_focus) {
					if (!has_focus) {
						double tunai = 0.0;
						if (!etBayarTunai.getText().toString().equals("")) {
							//etTunai.setText("0");
							tunai = Double.parseDouble(etBayarTunai.getText().toString());
						}


						double kembalian = tunai - kurang_bayar;
						tvKembali.setText(String.format("%s", UtilsApi.formatRupiah(kembalian)));
					}
				}
			});


		});

		holder.imgDetail.setOnClickListener(view -> {

		});
	}

	@Override
	public int getItemCount() {
		return hutangModelArrayList.size();
	}

	public class HutangViewHolder extends RecyclerView.ViewHolder {
		TextView tvTanggal;
		TextView tvPembeli;
		TextView tvTotalHarga;
		TextView tvKurangBayar;
		Button btnBayar;

		ImageView imgDetail;


		public HutangViewHolder(@NonNull View itemView) {
			super(itemView);
			tvTanggal = itemView.findViewById(R.id.rh_tvTanggal);
			tvPembeli = itemView.findViewById(R.id.rh_tvPembeli);
			tvTotalHarga = itemView.findViewById(R.id.rh_tvTotal);
			tvKurangBayar = itemView.findViewById(R.id.rh_tvKurangBayar);
			btnBayar = itemView.findViewById(R.id.rh_btnBayar);
			imgDetail = itemView.findViewById(R.id.rh_imgDetail);
		}
	}
}
