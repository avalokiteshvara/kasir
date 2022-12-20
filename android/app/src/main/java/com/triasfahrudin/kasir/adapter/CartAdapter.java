package com.triasfahrudin.kasir.adapter;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
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

import com.squareup.picasso.Picasso;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.fragment.CartFragment;
import com.triasfahrudin.kasir.model.CartModel;
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

public class CartAdapter extends RecyclerView.Adapter<CartAdapter.CartViewHolder> {

	private final ArrayList<CartModel> cartModelArrayList;

	Session session;
	BaseApiService mBaseApiService;
	Context mContext;

	public CartAdapter(Context mContext, Session session, BaseApiService mBaseApiService, ArrayList<CartModel> cartModelArrayList) {
		this.cartModelArrayList = cartModelArrayList;
		this.mContext = mContext;
		this.session = session;
		this.mBaseApiService = mBaseApiService;
	}

	@NonNull
	@Override
	public CartViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
		LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
		View view = layoutInflater.inflate(R.layout.recycler_cart_barang, parent, false);
		return new CartAdapter.CartViewHolder(view);
	}

	@Override
	public void onBindViewHolder(@NonNull CartViewHolder holder, int position) {
		Double harga = cartModelArrayList.get(position).getHarga_jual();
		int qty = cartModelArrayList.get(position).getQty();
		double subTotal = harga * qty;
		holder.tvNama.setText(cartModelArrayList.get(position).getNama_barang());
		holder.tvSatuan.setText(cartModelArrayList.get(position).getSatuan());
		holder.tvHarga.setText(UtilsApi.formatRupiah(harga));
		holder.tvQty.setText(String.valueOf(qty));
		holder.tvSubTotal.setText(UtilsApi.formatRupiah(subTotal));

		holder.imgDetail.setOnClickListener(view -> {

			AlertDialog.Builder dialog = new AlertDialog.Builder(mContext);
			LayoutInflater inflater = LayoutInflater.from(mContext);
			View dialogView = inflater.inflate(R.layout.fragment_cart_barang, null);
			dialog.setView(dialogView);

			dialog.setCancelable(true);
//			dialog.setIcon(R.mipmap.ic_launcher);
//			dialog.setTitle("Detail Barang");

			ImageView imgViewfoto = dialogView.findViewById(R.id.fcb_foto);
			TextView tvNama = dialogView.findViewById(R.id.fcb_tvNama);
			TextView tvSatuan = dialogView.findViewById(R.id.fcb_tvSatuan);
			TextView tvHarga = dialogView.findViewById(R.id.fcb_tvHarga);
			EditText etQty = dialogView.findViewById(R.id.fcb_etQty);
			TextView tvSubTotal = dialogView.findViewById(R.id.fcb_tvSubTotal);
			Button btnHapus = dialogView.findViewById(R.id.fcb_btnHapus);
			Button btnUpdate = dialogView.findViewById(R.id.fcb_btnUpdate);
			ImageView imgClose = dialogView.findViewById(R.id.fcb_imgClose);

			Picasso.get().invalidate(UtilsApi.BASE_URL + "uploads/" + cartModelArrayList.get(position).getFoto());
			Picasso.get().load(UtilsApi.BASE_URL + "uploads/" + cartModelArrayList.get(position).getFoto()).into(imgViewfoto);

			tvNama.setText(cartModelArrayList.get(position).getNama_barang());
			tvSatuan.setText(cartModelArrayList.get(position).getSatuan());
			tvHarga.setText(UtilsApi.formatRupiah(harga));
			etQty.setText(String.valueOf(qty));

			tvSubTotal.setText(UtilsApi.formatRupiah(subTotal));

			//dialog.show();

			final AlertDialog ad = dialog.create();
			ad.requestWindowFeature(Window.FEATURE_NO_TITLE);
			ad.show();

			etQty.addTextChangedListener(new TextWatcher() {
				@Override
				public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

				}

				@Override
				public void onTextChanged(CharSequence charSequence, int start, int befora, int count) {
					//if(charSequence.length() != 0){
					int qty = 0;
					if (!etQty.getText().toString().equals("")) {
						//etQty.setText("0");
						qty = Integer.parseInt(etQty.getText().toString());
					}

					Double harga = cartModelArrayList.get(position).getHarga_jual();
					double subTotal = harga * qty;
					tvSubTotal.setText(String.format("%s", UtilsApi.formatRupiah(subTotal)));
					//}
				}

				@Override
				public void afterTextChanged(Editable editable) {

				}
			});

			etQty.setOnFocusChangeListener(new View.OnFocusChangeListener() {

				@Override
				public void onFocusChange(View view, boolean has_focus) {
					if (!has_focus) {
						int qty = 0;
						if (!etQty.getText().toString().equals("")) {
							//etQty.setText("0");
							qty = Integer.parseInt(etQty.getText().toString());
						}

						Double harga = cartModelArrayList.get(position).getHarga_jual();
						double subTotal = harga * qty;
						tvSubTotal.setText(String.format("%s", UtilsApi.formatRupiah(subTotal)));
					}
				}
			});

			imgClose.setOnClickListener(new View.OnClickListener() {
				@Override
				public void onClick(View view) {
					ad.dismiss();
				}
			});

			btnHapus.setOnClickListener(new View.OnClickListener() {
				@Override
				public void onClick(View view) {

					new androidx.appcompat.app.AlertDialog.Builder(mContext)
							.setTitle("Hapus item ?")
							.setMessage("Apakah anda yakin ingin menghapus item ini ?")
							.setPositiveButton("Hapus !", (dialog, which) -> {

								ProgressDialog loading = ProgressDialog.show(mContext, null, "Menghapus item...", true, false);

								HashMap<String, String> headers = new HashMap<String, String>();
								headers.put("Authorization", session.getAccessToken());
								headers.put("Accept", "application/json");

								mBaseApiService.deleteCartItem(headers, cartModelArrayList.get(position).getId()).enqueue(new Callback<ResponseBody>() {
									@Override
									public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
										if (response.isSuccessful()) {
											loading.dismiss();
											try {
												ad.dismiss();
												JSONObject jsonObject = new JSONObject(response.body().string());

												if (jsonObject.getString("status").equals("true")) {
													String error_message = jsonObject.getString("error_msg");
													Toasty.success(mContext, error_message, Toasty.LENGTH_LONG).show();

													CartFragment fragment = new CartFragment();
													AppCompatActivity activity = (AppCompatActivity) view.getContext();
													activity.getSupportFragmentManager()
															.beginTransaction()
															.replace(R.id.nav_host_fragment, fragment, CartFragment.class.getSimpleName())
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


							}).setNegativeButton("Batal", null).show();
				}
			});

			btnUpdate.setOnClickListener(new View.OnClickListener() {
				@Override
				public void onClick(View view) {

					ProgressDialog loading = ProgressDialog.show(mContext, null, "Update item...", true, false);

					HashMap<String, String> headers = new HashMap<String, String>();
					headers.put("Authorization", session.getAccessToken());
					headers.put("Accept", "application/json");

					mBaseApiService.updateCartItem(
							headers,
							cartModelArrayList.get(position).getId(),
							Integer.parseInt(etQty.getText().toString())
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

										CartFragment fragment = new CartFragment();
										AppCompatActivity activity = (AppCompatActivity) view.getContext();
										activity.getSupportFragmentManager()
												.beginTransaction()
												.replace(R.id.nav_host_fragment, fragment, CartFragment.class.getSimpleName())
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

			dialog.setNegativeButton("TUTUP", new DialogInterface.OnClickListener() {

				@Override
				public void onClick(DialogInterface dialog, int i) {
					dialog.dismiss();

				}
			});

			ad.setOnCancelListener(new DialogInterface.OnCancelListener() {
				@Override
				public void onCancel(DialogInterface dialogInterface) {
					CartFragment fragment = new CartFragment();
					AppCompatActivity activity = (AppCompatActivity) view.getContext();
					activity.getSupportFragmentManager()
							.beginTransaction()
							.replace(R.id.nav_host_fragment, fragment, CartFragment.class.getSimpleName())
							.addToBackStack(null)
							.commit();
				}
			});


		});
	}

//	@Override
//	public void onAttachedToRecyclerView(RecyclerView recyclerView) {
//		super.onAttachedToRecyclerView(recyclerView);
//		mContext = recyclerView.getContext();
//	}

	@Override
	public int getItemCount() {
		return cartModelArrayList.size();
	}

	public class CartViewHolder extends RecyclerView.ViewHolder {

		TextView tvNama;
		TextView tvSatuan;
		TextView tvHarga;
		TextView tvQty;
		TextView tvSubTotal;

		ImageView imgDetail;

		public CartViewHolder(@NonNull View itemView) {
			super(itemView);
			tvNama = itemView.findViewById(R.id.rcb_tvNama);
			tvSatuan = itemView.findViewById(R.id.rcb_tvSatuan);
			tvHarga = itemView.findViewById(R.id.rcb_tvHarga);
			tvQty = itemView.findViewById(R.id.rcb_tvQty);
			tvSubTotal = itemView.findViewById(R.id.rcb_tvSubtotal);
			imgDetail = itemView.findViewById(R.id.rcb_imgDetail);

		}
	}
}
