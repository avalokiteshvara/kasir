package com.triasfahrudin.kasir.fragment;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.navigation.NavigationView;
import com.triasfahrudin.kasir.LoginActivity;
import com.triasfahrudin.kasir.MainActivity;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.model_list.HutangModelList;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

public class CatatanFragment extends Fragment {

	Context mContext;
	BaseApiService mBaseApiService;
	Session session;
	ProgressDialog loading;


	@BindView(R.id.catatan_etIsi)
	EditText etIsi;

	@BindView(R.id.catatan_btnSimpan)
	Button btnSimpan;
	@BindView(R.id.catatan_btnHapus)
	Button btnHapus;

	int catatan_id;

	@Override
	public void onAttach(Context context) {
		super.onAttach(context);
		mContext = context;

	}

	public View onCreateView(@NonNull LayoutInflater inflater,
							 ViewGroup container, Bundle savedInstanceState) {
		View root = inflater.inflate(R.layout.fragment_catatan, container, false);
		ButterKnife.bind(this, root);

		mBaseApiService = UtilsApi.getAPIService();
		session = new Session(mContext);

		FloatingActionButton floatingActionButton = ((MainActivity) requireActivity()).getFloatingActionButton();
		if (floatingActionButton != null) {
			floatingActionButton.hide();
		}

		loadData();

		return root;
	}

	private void loadData() {

		loading = ProgressDialog.show(mContext, null, "Mengambil data catatan...", true, false);

		HashMap<String, String> headers = new HashMap<String, String>();
		headers.put("Authorization", session.getAccessToken());
		headers.put("Accept", "application/json");

		mBaseApiService.getCatatan(headers).enqueue(new Callback<ResponseBody>() {
			@Override
			public void onResponse(@NonNull Call<ResponseBody> call, @NonNull Response<ResponseBody> response) {
				if (response.isSuccessful()) {

					loading.dismiss();

					try {
						JSONObject jsonObject = new JSONObject(response.body().string());
						String isi_catatan = jsonObject.getJSONObject("catatan").getString("isi");
						catatan_id = jsonObject.getJSONObject("catatan").getInt("id");

						etIsi.setText(String.format("%s", isi_catatan));

						//etIsi.setSelection(etIsi.getText().length());

					} catch (JSONException | IOException e) {
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
				Toasty.error(mContext, "Ada kesalahan! :: " + t.getMessage(), Toasty.LENGTH_LONG, true).show();
				loading.dismiss();
			}
		});

	}

	@OnClick(R.id.catatan_btnHapus)
	public void onBtnHapusOnClick() {
		new AlertDialog.Builder(mContext)
				.setTitle("Hapus catatan?")
				.setMessage("Apakah anda yakin ingin menghapus catatan ini dan membuat catatan baru ?")
				.setPositiveButton("Ya", (dialog, which) -> {

					ProgressDialog loading = ProgressDialog.show(mContext, null, "Menghapus item...", true, false);

					HashMap<String, String> headers = new HashMap<String, String>();
					headers.put("Authorization", session.getAccessToken());
					headers.put("Accept", "application/json");

					mBaseApiService.newCatatan(headers,"").enqueue(new Callback<ResponseBody>() {
						@Override
						public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
							if (response.isSuccessful()) {
								loading.dismiss();
								try {

									JSONObject jsonObject = new JSONObject(response.body().string());

									if (jsonObject.getString("status").equals("true")) {
										String error_message = jsonObject.getString("error_msg");
										Toasty.success(mContext, error_message, Toasty.LENGTH_LONG).show();

										loadData();

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

	@OnClick(R.id.catatan_btnSimpan)
	public void onBtnSimpanOnClick() {
		ProgressDialog loading = ProgressDialog.show(mContext, null, "Menyimpan catatan...", true, false);

		HashMap<String, String> headers = new HashMap<String, String>();
		headers.put("Authorization", session.getAccessToken());
		headers.put("Accept", "application/json");

		mBaseApiService.saveCatatan(headers,this.catatan_id, etIsi.getText().toString()).enqueue(new Callback<ResponseBody>() {
			@Override
			public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
				if (response.isSuccessful()) {
					loading.dismiss();
					try {

						JSONObject jsonObject = new JSONObject(response.body().string());

						if (jsonObject.getString("status").equals("true")) {
							Toasty.success(mContext, "Catatan berhasil disimpan", Toasty.LENGTH_LONG).show();

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
			public void onFailure(@NotNull Call<ResponseBody> call, Throwable t) {
				Toasty.error(mContext, "ERROR:" + t.getMessage(), Toasty.LENGTH_LONG).show();
				Log.e("debug", "onFailure: ERROR > " + t.toString());
				loading.dismiss();
			}
		});
	}
}
