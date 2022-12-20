package com.triasfahrudin.kasir.fragment;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.navigation.NavigationView;
import com.triasfahrudin.kasir.LoginActivity;
import com.triasfahrudin.kasir.MainActivity;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.adapter.CartAdapter;
import com.triasfahrudin.kasir.model.CartModel;
import com.triasfahrudin.kasir.model_list.CartModelList;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Objects;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import es.dmoral.toasty.Toasty;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CartFragment extends Fragment {

	Context mContext;
	BaseApiService mBaseApiService;

	Session session;
	ProgressDialog loading;
	AlertDialog mAlertDialog;

	@BindView(R.id.cart_recyclerView)
	RecyclerView cartRecyclerView;
	@BindView(R.id.cart_swipeContainer)
	SwipeRefreshLayout cartswipeContainer;
	@BindView(R.id.cart_tvTotal)
	TextView tvTotal;
	@BindView(R.id.cart_etTunai)
	EditText etTunai;
	@BindView(R.id.cart_tvKembali)
	TextView tvKembali;
	@BindView(R.id.cart_btnBatal)
	Button btnBatal;
	@BindView(R.id.cart_btnBayar)
	Button btnBayar;

	private double total_harga_jual = 0.0;
	private double total_harga_beli = 0.0;


	private CartAdapter adapter;
	//private RecyclerView recyclerView;
	//private SwipeRefreshLayout swipeRefreshLayout;

	@Override
	public void onAttach(Context context) {
		super.onAttach(context);
		mContext = context;
	}

	@OnClick(R.id.cart_btnBatal)
	public void onBtnBatalOnClick() {
		new androidx.appcompat.app.AlertDialog.Builder(mContext)
				.setTitle("Hapus item ?")
				.setMessage("Apakah anda yakin ingin membatalkan transaksi ini ?")
				.setPositiveButton("Ya", (dialog, which) -> {

					ProgressDialog loading = ProgressDialog.show(mContext, null, "Menghapus item...", true, false);

					HashMap<String, String> headers = new HashMap<String, String>();
					headers.put("Authorization", session.getAccessToken());
					headers.put("Accept", "application/json");

					mBaseApiService.deleteCart(headers).enqueue(new Callback<ResponseBody>() {
						@Override
						public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
							if (response.isSuccessful()) {
								loading.dismiss();
								try {

									JSONObject jsonObject = new JSONObject(response.body().string());

									if (jsonObject.getString("status").equals("true")) {
										String error_message = jsonObject.getString("error_msg");
										Toasty.success(mContext, error_message, Toasty.LENGTH_LONG).show();

										NavigationView navigationView = ((MainActivity) getActivity()).getNavigationView();
										navigationView.getMenu().getItem(0).setChecked(true);

										BarangFragment fragment = new BarangFragment();
										getActivity().getSupportFragmentManager()
												.beginTransaction()
												.replace(R.id.nav_host_fragment, fragment, BarangFragment.class.getSimpleName())
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

								Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
								session.saveBoolean(Session.LOGIN_STATUS, false);
								Intent intent = new Intent(getActivity(), LoginActivity.class);
								startActivity(intent);

							}
						}

						@Override
						public void onFailure(Call<ResponseBody> call, Throwable t) {
							Toasty.error(mContext, "ERROR:" + t.getMessage(), Toasty.LENGTH_LONG).show();
							Log.e("debug", "onFailure: ERROR > " + t.toString());
							loading.dismiss();
						}
					});
				}).setNegativeButton("Tidak", null).show();
	}

	@OnClick(R.id.cart_btnBayar)
	public void onBtnBayarOnClick() {

		double tunai = 0.0;
		if (!etTunai.getText().toString().equals("")) {
			tunai = Double.parseDouble(etTunai.getText().toString());
		}

		//double bayar_tunai = Double.parseDouble(tunai);

		if (tunai >= this.total_harga_jual) {

			double finalTunai = tunai;
			new AlertDialog.Builder(this.mContext)
					.setTitle("Simpan transaksi")
					.setMessage("Apakah anda yakin melanjutkan transaksi ini?")
					.setPositiveButton("Lanjut", (dialog, which) -> {

						saveTransaction(finalTunai, "", this.total_harga_jual,this.total_harga_beli);

					}).setNegativeButton("Batal", null).show();
		} else {

			final EditText etNamaPembeli = new EditText(mContext);
			etNamaPembeli.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
			etNamaPembeli.setHint("Masukkan nama pembeli");

			int padding10 = UtilsApi.dp2px(mContext, 10);
			int padding20 = UtilsApi.dp2px(mContext, 20);

			etNamaPembeli.setPadding(padding20, padding10, padding20, padding10);

			final AlertDialog.Builder qtyDialog = new AlertDialog.Builder(mContext);
			qtyDialog.setTitle("Catatan Pembelian");
			qtyDialog.setMessage("Masukkan nama pembeli");
			qtyDialog.setView(etNamaPembeli);

			double finalTunai = tunai;
			qtyDialog.setPositiveButton("Lanjut Transaksi", (DialogInterface dialog, int which) -> {

				if (UtilsApi.isEditTextEmpty(etNamaPembeli)) {
					Toasty.error(mContext, "Pembelian dengan Hutang wajib mencantumkan nama pembeli!", Toasty.LENGTH_LONG, true).show();
				} else {
					saveTransaction(finalTunai, etNamaPembeli.getText().toString(), total_harga_jual,this.total_harga_beli);
				}
				loading.dismiss();
			});

			qtyDialog.setNegativeButton("Batal", (dialog, which) -> {
				// close the dialog
				loading.dismiss();
			});

			qtyDialog.create().show();

		}

	}


	public void saveTransaction(double bayar_tunai, String nama_pembeli, double total_transaksi,double harga_beli) {

		ProgressDialog loading = ProgressDialog.show(mContext, null, "Menyimpan data transaksi...", true, false);

		HashMap<String, String> headers = new HashMap<String, String>();
		headers.put("Authorization", session.getAccessToken());
		headers.put("Accept", "application/json");

		mBaseApiService.saveTransaction(
				headers,
				bayar_tunai,
				nama_pembeli,
				total_transaksi,
				harga_beli
		).enqueue(new Callback<ResponseBody>() {
			@Override
			public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
				if (response.isSuccessful()) {
					loading.dismiss();
					try {

						JSONObject jsonObject = new JSONObject(response.body().string());

						if (jsonObject.getString("status").equals("true")) {
							Toasty.success(mContext, "Transaksi berhasil disimpan", Toasty.LENGTH_LONG).show();


							AlertDialog.Builder dialog = new AlertDialog.Builder(mContext, android.R.style.Theme_Material_Light_NoActionBar_Fullscreen);
							LayoutInflater inflater = getLayoutInflater();
							View dialogView = inflater.inflate(R.layout.fragment_transaksi_selesai, null);
							dialog.setView(dialogView);
							dialog.setCancelable(true);
							dialog.setIcon(R.mipmap.ic_launcher);
							dialog.setTitle("Transaksi selesai");

							TextView tvTanggal = (TextView) dialogView.findViewById(R.id.fts_tvTanggal);
							TextView tvTotalHarga = (TextView) dialogView.findViewById(R.id.fts_tvTotalHarga);
							TextView tvBayarTunai = (TextView) dialogView.findViewById(R.id.fts_tvBayarTunai);
							TextView tvKembalian = (TextView) dialogView.findViewById(R.id.fts_tvKembalian);
							TextView tvNamapembeli = (TextView) dialogView.findViewById(R.id.fts_tvNamaPembeli);

							SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
							String currentDateandTime = sdf.format(new Date());

							tvTanggal.setText(currentDateandTime);
							tvTotalHarga.setText(UtilsApi.formatRupiah(total_harga_jual));
							tvBayarTunai.setText(UtilsApi.formatRupiah(bayar_tunai));

							double kembalian = bayar_tunai - total_harga_jual;

							if (kembalian < 0) {
								tvKembalian.setText(String.format("HUTANG - %s", UtilsApi.formatRupiah(kembalian)));
							} else {
								tvKembalian.setText(String.format("%s", UtilsApi.formatRupiah(kembalian)));
							}

							tvNamapembeli.setText(nama_pembeli.isEmpty() ? "UMUM" : nama_pembeli);

							dialog.setPositiveButton("SELESAI", new DialogInterface.OnClickListener() {

								@Override
								public void onClick(DialogInterface dialog, int which) {

//									MainActivity.get
//									navigationView.getMenu().getItem(0).setChecked(true);

									NavigationView navigationView = ((MainActivity) getActivity()).getNavigationView();
									navigationView.getMenu().getItem(0).setChecked(true);

									BarangFragment fragment = new BarangFragment();
									requireActivity().getSupportFragmentManager()
											.beginTransaction()
											.replace(R.id.nav_host_fragment, fragment, BarangFragment.class.getSimpleName())
											.addToBackStack(null)
											.commit();

									dialog.dismiss();
								}
							});

							dialog.show();

						} else {
							String error_message = jsonObject.getString("error_msg");
							Toasty.error(mContext, error_message, Toasty.LENGTH_LONG).show();

						}

					} catch (IOException | JSONException e) {
						Log.i("LOGIN", "Login GAGAL " + e.getMessage());
					}

				} else {
					loading.dismiss();

					Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
					session.saveBoolean(Session.LOGIN_STATUS, false);
					Intent intent = new Intent(getActivity(), LoginActivity.class);
					startActivity(intent);

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

	public View onCreateView(@NonNull LayoutInflater inflater,
							 ViewGroup container, Bundle savedInstanceState) {

		View root = inflater.inflate(R.layout.fragment_cart_list, container, false);
		//swipeRefreshLayout = root.findViewById(R.id.cart_swipeContainer);
		ButterKnife.bind(this, root);

		mBaseApiService = UtilsApi.getAPIService();
		session = new Session(mContext);

		cartswipeContainer.setOnRefreshListener(() -> {
			cartswipeContainer.setRefreshing(false);
			loadData();
		});

		loadData();

		FloatingActionButton floatingActionButton = ((MainActivity) getActivity()).getFloatingActionButton();
		if (floatingActionButton != null) {
			floatingActionButton.hide();
			floatingActionButton.setOnClickListener(view -> {
			});
		}

		//etTunai.setFilters( new InputFilter[]{ new MinMaxFilter( "0" , "1000000" )}) ;
		etTunai.addTextChangedListener(new TextWatcher() {
			@Override
			public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

			}

			@Override
			public void onTextChanged(CharSequence charSequence, int start, int befora, int count) {
				//if(charSequence.length() != 0){
				double tunai = 0.0;
				if (!etTunai.getText().toString().equals("")) {
					tunai = Double.parseDouble(etTunai.getText().toString());
				}

				//tunai = Double.parseDouble(etTunai.getText().toString());
				double kembalian = tunai - total_harga_jual;

				tvKembali.setText(String.format("%s", UtilsApi.formatRupiah(kembalian)));
				//}
			}

			@Override
			public void afterTextChanged(Editable editable) {

			}
		});

		etTunai.setOnFocusChangeListener(new View.OnFocusChangeListener() {
			@Override
			public void onFocusChange(View view, boolean has_focus) {
				if (!has_focus) {
					double tunai = 0.0;
					if (!etTunai.getText().toString().equals("")) {
						//etTunai.setText("0");
						tunai = Double.parseDouble(etTunai.getText().toString());
					}


					double kembalian = tunai - total_harga_jual;
					tvKembali.setText(String.format("%s", UtilsApi.formatRupiah(kembalian)));
				}
			}
		});


		return root;
	}

	private void loadData() {

		loading = ProgressDialog.show(mContext, null, "Mengambil data keranjang belanja...", true, false);

		HashMap<String, String> headers = new HashMap<String, String>();
		headers.put("Authorization", session.getAccessToken());
		headers.put("Accept", "application/json");

		mBaseApiService.getCart(headers).enqueue(new Callback<CartModelList>() {
			@Override
			public void onResponse(@NonNull Call<CartModelList> call, @NonNull Response<CartModelList> response) {
				if (response.isSuccessful()) {
					loading.dismiss();
					generateRecyclerList(Objects.requireNonNull(response.body()).getArrayList());
				} else {
					loading.dismiss();

					Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
					session.saveBoolean(Session.LOGIN_STATUS, false);
					Intent intent = new Intent(getActivity(), LoginActivity.class);
					startActivity(intent);

				}
			}

			@Override
			public void onFailure(Call<CartModelList> call, Throwable t) {
				Toasty.error(mContext, "Ada kesalahan! :: " + t.getMessage(), Toasty.LENGTH_LONG, true).show();
				loading.dismiss();
			}
		});
	}

	private void generateRecyclerList(ArrayList<CartModel> modelList) {

		if (modelList.isEmpty()) {
			btnBatal.setEnabled(false);
			btnBatal.setBackgroundTintList(ColorStateList.valueOf(mContext.getResources().getColor(R.color.gray)));

			btnBayar.setEnabled(false);
			btnBayar.setBackgroundTintList(ColorStateList.valueOf(mContext.getResources().getColor(R.color.gray)));


			Toasty.warning(mContext, "Keranjang belanja masih kosong", Toasty.LENGTH_LONG, true).show();
		} else {
			btnBatal.setEnabled(true);
			btnBatal.setBackgroundTintList(ColorStateList.valueOf(mContext.getResources().getColor(R.color.holo_red_light)));

			btnBayar.setEnabled(true);
			btnBayar.setBackgroundTintList(ColorStateList.valueOf(mContext.getResources().getColor(R.color.holo_green_dark)));

		}

		adapter = new CartAdapter(this.mContext, this.session, this.mBaseApiService, modelList);
		RecyclerView.LayoutManager layoutManager = new GridLayoutManager(getActivity(), 1);
		cartRecyclerView.setLayoutManager(layoutManager);
		cartRecyclerView.setAdapter(adapter);

		//this.postAndNotifyAdapter(new Handler(),cartRecyclerView);

		cartRecyclerView.postDelayed(new Runnable() {
			@Override
			public void run() {
				cartRecyclerView.scrollToPosition(0);
			}
		}, 100);

		if (modelList.size() > 0) {
			cartRecyclerView.postDelayed(new Runnable() {
				@Override
				public void run() {
					cartRecyclerView.findViewHolderForAdapterPosition(0).itemView.performClick();
				}
			}, 150);
		}

		total_harga_jual = 0.0;
		total_harga_beli = 0.0;

		for (CartModel cm : modelList) {
			total_harga_jual += (cm.getHarga_jual() * cm.getQty());
			total_harga_beli += (cm.getHarga_beli() * cm.getQty());
		}

		tvTotal.setText(String.format("%s", UtilsApi.formatRupiah(total_harga_jual)));

		double tunai = 0.0;
		if (!etTunai.getText().toString().equals("")) {
			tunai = Double.parseDouble(etTunai.getText().toString());
		}

		//double tunai = Double.parseDouble(etTunai.getText().toString());
		double kembalian = tunai - total_harga_jual;

		tvKembali.setText(String.format("%s", UtilsApi.formatRupiah(kembalian)));
	}

}
