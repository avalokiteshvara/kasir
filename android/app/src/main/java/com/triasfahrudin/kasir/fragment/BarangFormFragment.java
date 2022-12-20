package com.triasfahrudin.kasir.fragment;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.provider.MediaStore;
import android.provider.Settings;
import android.util.Base64;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.core.content.FileProvider;
import androidx.core.view.ViewCompat;
import androidx.fragment.app.Fragment;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.budiyev.android.codescanner.CodeScanner;
import com.budiyev.android.codescanner.CodeScannerView;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import com.squareup.picasso.Picasso;
import com.triasfahrudin.kasir.LoginActivity;
import com.triasfahrudin.kasir.MainActivity;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.model.SatuanModel;
import com.triasfahrudin.kasir.model_list.SatuanModelList;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
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

import static android.app.Activity.RESULT_OK;

public class BarangFormFragment extends Fragment {

	Context mContext;
	BaseApiService mBaseApiService;
	Session session;

	@BindView(R.id.fbf_imgViewFoto)
	ImageView imgViewFoto;
	@BindView(R.id.fbf_imgViewCamera)
	ImageView imgViewCamera;
	@BindView(R.id.fbf_etNama)
	EditText etNama;
	@BindView(R.id.fbf_etBarcode)
	EditText etBarcode;
	@BindView(R.id.fbf_btnScan)
	Button btnScan;
	@BindView(R.id.fbf_spinnerSatuan)
	Spinner spinnerSatuan;
	@BindView(R.id.fbf_etHargaBeli)
	EditText etHargaBeli;
	@BindView(R.id.fbf_etHargaJual)
	EditText etHargaJual;
	@BindView(R.id.fbf_etStok)
	EditText etStok;

	@BindView(R.id.fbf_etKeterangan)
	EditText etKeterangan;

	@BindView(R.id.fbf_tvtglUpdate)
	TextView fbfTvtglUpdate;
	@BindView(R.id.fbf_btnRiwayat)
	Button btnRiwayat;
	@BindView(R.id.fbf_btnKembali)
	Button btnKembali;
	@BindView(R.id.fbf_btnSimpan)
	Button btnSimpan;
	@BindView(R.id.fbf_btnHapus)
	Button btnHapus;


	int barang_id;
	public final int REQUEST_CAMERA = 0;
	public final int OPEN_SETTING = 1;
	public final int BITMAP_QUALITY = 60; // range 1 - 100

	Bitmap bitmap, decoded;
	String mCurrentPhotoPath;

	ImageView imageView;
	CodeScanner codeScanner;
	CodeScannerView codeScannerView;
	AlertDialog mAlertDialog;

	int selected_satuan_id;

	@Override
	public void onAttach(@NotNull Context context) {
		super.onAttach(context);
		mContext = context;
	}

	public View onCreateView(@NonNull LayoutInflater inflater,
							 ViewGroup container, Bundle savedInstanceState) {

		View root = inflater.inflate(R.layout.fragment_barang_form, container, false);
		ButterKnife.bind(this, root);

		mBaseApiService = UtilsApi.getAPIService();
		session = new Session(mContext);

		Bundle arguments = getArguments();
		if (arguments == null)
			Toasty.error(requireActivity(), "Arguments is NULL", Toasty.LENGTH_LONG).show();
		else {

			this.barang_id = getArguments().getInt("barang_id", 0);

			if (this.barang_id == 0) {
				btnHapus.setVisibility(View.GONE);
			}

			String nama_barang = getArguments().getString("nama_barang", "");
			String barcode = getArguments().getString("barcode", "");
			int satuan_id = getArguments().getInt("satuan_id", 0);
			Double harga_beli = getArguments().getDouble("harga_beli", 0.0);
			Double harga_jual = getArguments().getDouble("harga_jual", 0.0);
			int stok_qty = getArguments().getInt("stok_qty", 0);
			String tgl_update = getArguments().getString("tgl_update", "");
			String keterangan = getArguments().getString("keterangan", "");
			String foto = getArguments().getString("foto", "");

			Picasso.get().invalidate(UtilsApi.BASE_URL + "uploads/" + foto);
			Picasso.get().load(UtilsApi.BASE_URL + "uploads/" + foto).into(imgViewFoto);


			etNama.setText(nama_barang);
			etBarcode.setText(barcode);
			etHargaBeli.setText(String.format(Locale.US, "%.0f", harga_beli));
			etHargaJual.setText(String.format(Locale.US, "%.0f", harga_jual));
			etStok.setText(String.format(Locale.US, "%d", stok_qty));
			etKeterangan.setText(keterangan);

			fbfTvtglUpdate.setText(tgl_update);

			new getSatuan(satuan_id).execute();
		}

		spinnerSatuan.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
			@Override
			public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
				SatuanModel satuanModel = (SatuanModel) adapterView.getSelectedItem();
				selected_satuan_id = satuanModel.getId();
			}

			@Override
			public void onNothingSelected(AdapterView<?> adapterView) {

			}
		});

		FloatingActionButton floatingActionButton = ((MainActivity) getActivity()).getFloatingActionButton();
		if (floatingActionButton != null) {
			floatingActionButton.hide();

			floatingActionButton.setOnClickListener(view -> {


			});
		}


		return root;
	}

	@SuppressLint("StaticFieldLeak")
	private class getSatuan extends AsyncTask<Void, Void, Void> {

		//private ProgressDialog loading;
		private final int satuan_id;

		getSatuan(int satuan_id) {
			this.satuan_id = satuan_id;
		}

		@Override
		protected void onPreExecute() {
			super.onPreExecute();
		}

		@Override
		protected Void doInBackground(Void... voids) {

			HashMap<String, String> headers = new HashMap<String, String>();
			headers.put("Authorization", session.getAccessToken());
			headers.put("Accept", "application/json");

			mBaseApiService.getSatuan(headers).enqueue(new Callback<SatuanModelList>() {
				@Override
				public void onResponse(@NotNull Call<SatuanModelList> call, @NotNull Response<SatuanModelList> response) {
					if (response.isSuccessful()) {
						ArrayList<SatuanModel> arrSatuan = Objects.requireNonNull(response.body()).getArrayList();
						ArrayAdapter<SatuanModel> adapter = new ArrayAdapter<>(mContext, android.R.layout.simple_spinner_dropdown_item, arrSatuan);
						spinnerSatuan.setAdapter(adapter);
						spinnerSatuan.setSelection(adapter.getPosition(new SatuanModel(satuan_id, "", "")));

					} else {
						Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
						session.saveBoolean(Session.LOGIN_STATUS, false);
						Intent intent = new Intent(getActivity(), LoginActivity.class);
						startActivity(intent);
					}
				}

				@Override
				public void onFailure(@NotNull Call<SatuanModelList> call, Throwable t) {
					Toasty.error(mContext, "ERROR:" + t.getMessage(), Toasty.LENGTH_LONG).show();
					Log.e("debug", "onFailure: ERROR > " + t.toString());
				}
			});

			return null;
		}


		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
		}
	}

	@OnClick(R.id.fbf_imgViewCamera)
	public void onImgViewCameraClicked() {
		Dexter.withActivity(getActivity())
				.withPermission(Manifest.permission.CAMERA)
				.withListener(new PermissionListener() {
					@Override
					public void onPermissionGranted(PermissionGrantedResponse response) {
						File f = null;
						try {
							f = createImageFile();
							mCurrentPhotoPath = f.getAbsolutePath();
						} catch (IOException e) {
							e.printStackTrace();
						}

						Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
						takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, FileProvider.getUriForFile(mContext, "com.triasfahrudin.kasir.fileprovider", Objects.requireNonNull(f)));
						takePictureIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
						startActivityForResult(takePictureIntent, REQUEST_CAMERA);
					}

					@Override
					public void onPermissionDenied(PermissionDeniedResponse response) {
						showSettingsDialog();
					}

					@Override
					public void onPermissionRationaleShouldBeShown(PermissionRequest permission,
																   PermissionToken token) {
						token.continuePermissionRequest();
					}
				})
				.check();

	}

	private File createImageFile() throws IOException {
		// Create an image file name
		//sdcard/Android/data/com.example.dolibarr/files/Pictures/....
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
		String imageFileName = "JPEG_" + timeStamp + "_";
		File storageDir = mContext.getExternalFilesDir(Environment.DIRECTORY_PICTURES);
		File image = File.createTempFile(
				imageFileName,  /* prefix */
				".jpg",   /* suffix */
				storageDir      /* directory */
		);

		// Save a file: path for use with ACTION_VIEW intents
		return image;
	}

	@OnClick(R.id.fbf_btnScan)
	public void onBtnScanClicked() {
		AlertDialog.Builder dialog = new AlertDialog.Builder(mContext);
		LayoutInflater inflater = getLayoutInflater();
		View dialogView = inflater.inflate(R.layout.fragment_scan_barcode, null);
		dialog.setView(dialogView);
		dialog.setCancelable(false);
		dialog.setIcon(R.mipmap.ic_launcher);
		dialog.setTitle("Scan Barcode");

		imageView = dialogView.findViewById(R.id.imContent);
		codeScannerView = dialogView.findViewById(R.id.scannerView);
		imageView.bringToFront();

		codeScanner = new CodeScanner(mContext, codeScannerView);
		codeScanner.setDecodeCallback(result -> getActivity().runOnUiThread(() -> {
			//textQRCode = result.getText();
			//new ScanQR.GetLaporan().execute();

			Vibrator v = (Vibrator) requireContext().getSystemService(Context.VIBRATOR_SERVICE);
			// Vibrate for 500 milliseconds
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
				v.vibrate(VibrationEffect.createOneShot(400, VibrationEffect.DEFAULT_AMPLITUDE));
			} else {
				//deprecated in API 26
				v.vibrate(400);
			}

			codeScanner.releaseResources();
			etBarcode.setText(result.getText());
			mAlertDialog.dismiss();
		}));
		Dexter.withActivity(getActivity())
				.withPermission(Manifest.permission.CAMERA)
				.withListener(new PermissionListener() {
					@Override
					public void onPermissionGranted(PermissionGrantedResponse response) {
						codeScanner.startPreview();
					}

					@Override
					public void onPermissionDenied(PermissionDeniedResponse response) {

					}

					@Override
					public void onPermissionRationaleShouldBeShown(PermissionRequest permission,
																   PermissionToken token) {
						token.continuePermissionRequest();
					}
				})
				.check();

		dialog.setNegativeButton("TUTUP", new DialogInterface.OnClickListener() {

			@Override
			public void onClick(DialogInterface dialog, int i) {
				codeScanner.releaseResources();
				dialog.dismiss();
			}
		});

		//dialog.show();
		mAlertDialog = dialog.create();
		mAlertDialog.show();
	}

	@Override
	public void onResume() {
		super.onResume();

	}

	@Override
	public void onPause() {
		if (codeScanner != null) {
			codeScanner.releaseResources();
			mAlertDialog.dismiss();
		}

		super.onPause();
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		if (requestCode == REQUEST_CAMERA) {
			if (resultCode == RESULT_OK) {
				try {
					BitmapFactory.Options options = new BitmapFactory.Options();
					options.inSampleSize = 8;
					bitmap = BitmapFactory.decodeFile(mCurrentPhotoPath, options);
					setToImageView(getResizedBitmap(bitmap, 512));
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}

	}

	public Bitmap getResizedBitmap(@NotNull Bitmap image, int maxSize) {
		int width = image.getWidth();
		int height = image.getHeight();

		float bitmapRatio = (float) width / (float) height;
		if (bitmapRatio > 1) {
			width = maxSize;
			height = (int) (width / bitmapRatio);
		} else {
			height = maxSize;
			width = (int) (height * bitmapRatio);
		}
		return Bitmap.createScaledBitmap(image, width, height, true);
	}

	private void setToImageView(Bitmap bmp) {
		decoded = null;
		ByteArrayOutputStream bytes = new ByteArrayOutputStream();
		bmp.compress(Bitmap.CompressFormat.JPEG, BITMAP_QUALITY, bytes);
		decoded = BitmapFactory.decodeStream(new ByteArrayInputStream(bytes.toByteArray()));
		// imageView.setImageBitmap(decoded);
		imgViewFoto.setImageBitmap(decoded);
	}

	@Override
	public void onViewCreated(View view, Bundle savedInstanceState) {
		super.onViewCreated(view, savedInstanceState);
		ViewCompat.requestApplyInsets(view);
	}

	private void showSettingsDialog() {
		AlertDialog.Builder builder = new AlertDialog.Builder(mContext);
		builder.setTitle("Need Permissions");
		builder.setMessage("This app needs permission to use this feature. You can grant them in app settings.");
		builder.setPositiveButton("GOTO SETTINGS", (dialog, which) -> {
			dialog.cancel();
			openSettings();
		});

		builder.setNegativeButton("Cancel", (dialog, which) -> dialog.cancel());
		builder.show();
	}

	private void openSettings() {
		Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
		Uri uri = Uri.fromParts("package", getActivity().getPackageName(), null);
		intent.setData(uri);
		startActivityForResult(intent, OPEN_SETTING);
	}

	@OnClick(R.id.fbf_btnRiwayat)
	public void onBtnRiwayatClicked() {
		AlertDialog.Builder dialog = new AlertDialog.Builder(mContext, android.R.style.Theme_Material_Light_NoActionBar_Fullscreen);
		LayoutInflater inflater = getLayoutInflater();
		View root = inflater.inflate(R.layout.fragment_webview, null);
		dialog.setView(root);
		dialog.setCancelable(true);
		dialog.setIcon(R.mipmap.ic_launcher);
		dialog.setTitle("Riwayat Perubahan");

		SwipeRefreshLayout swipe;
		swipe = root.findViewById(R.id.webview_swipeContainer);

		swipe.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
			@Override
			public void onRefresh() {
				loadWebViewRiwayat(root, swipe);
				//swipe.setRefreshing(false);
			}
		});

		loadWebViewRiwayat(root, swipe);
		swipe.setEnabled(false);

		dialog.setNegativeButton("TUTUP", new DialogInterface.OnClickListener() {

			@Override
			public void onClick(DialogInterface dialog, int which) {
				dialog.dismiss();
			}
		});

		dialog.show();
	}

	@SuppressLint("SetJavaScriptEnabled")
	private void loadWebViewRiwayat(View root, SwipeRefreshLayout swipe) {

		WebView mWebView = root.findViewById(R.id.webview_webviewContainer);
		//mWebView.addJavascriptInterface(new WebAppInterface(mContext, this.kos_id), "Android");
		mWebView.loadUrl(UtilsApi.BASE_URL_WEBVIEW + "get-riwayat/" + this.barang_id);

		WebSettings webSettings = mWebView.getSettings();
		webSettings.setJavaScriptEnabled(true);
		mWebView.setWebViewClient(new WebViewClient());

		mWebView.getSettings().setDomStorageEnabled(true);
		mWebView.getSettings().setAppCacheEnabled(true);
		mWebView.getSettings().setLoadsImagesAutomatically(true);
		mWebView.getSettings().setMixedContentMode(WebSettings.MIXED_CONTENT_ALWAYS_ALLOW);

		swipe.setRefreshing(true);
		mWebView.setWebViewClient(new WebViewClient() {
			public void onReceivedError(WebView view, int errorCode,
										String description, String failingUrl) {
				mWebView.loadUrl("file:///android_asset/error.html");
			}

			public void onPageFinished(WebView view, String url) {
				//ketika loading selesai, ison loading akan hilang
				swipe.setRefreshing(false);
			}
		});

		mWebView.setWebChromeClient(new WebChromeClient() {
			@Override
			public void onProgressChanged(WebView view, int newProgress) {

				if (100 == mWebView.getProgress()) {
					swipe.setRefreshing(false);
				} else {
					swipe.setRefreshing(true);
				}
			}
		});

	}

	@OnClick(R.id.fbf_btnKembali)
	public void onBtnKembaliClicked() {

		new AlertDialog.Builder(this.mContext)
				.setTitle("Simpan data ?")
				.setMessage("Apakah anda yakin tidak ingin menyimpan data ini ?")
				.setPositiveButton("Ya", (dialog, which) -> {

					BarangFragment fragment = new BarangFragment();
					requireActivity().getSupportFragmentManager()
							.beginTransaction()
							.replace(R.id.nav_host_fragment, fragment, BarangFragment.class.getSimpleName())
							.addToBackStack(null)
							.commit();

				}).setNegativeButton("Batal", null).show();
	}

	private String getStringImage(@NotNull Bitmap bmp) {

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		bmp.compress(Bitmap.CompressFormat.JPEG, BITMAP_QUALITY, baos);
		//decoded = BitmapFactory.decodeStream(new ByteArrayInputStream(baos.toByteArray()));
		byte[] imageBytes = baos.toByteArray();
		return Base64.encodeToString(imageBytes, Base64.DEFAULT);
	}

	@OnClick(R.id.fbf_btnSimpan)
	public void onBtnSimpanClicked() {
		if (etNama.getText().toString().trim().isEmpty()) {
			etNama.setError("Nama barang tidak boleh kosong");
		} else if (etHargaJual.getText().toString().trim().isEmpty()) {
			etHargaJual.setText("Harga jual tidak boleh kosong");
		} else {
			new AlertDialog.Builder(this.mContext)
					.setTitle("Kirim Data")
					.setMessage("Apakah anda yakin ingin menyimpan data ini?")
					.setPositiveButton("Simpan", (dialog, which) -> {

						ProgressDialog loading = ProgressDialog.show(mContext, null, "Menyimpan data...", true, false);

						HashMap<String, String> headers = new HashMap<String, String>();
						headers.put("Authorization", session.getAccessToken());
						headers.put("Accept", "application/json");

						mBaseApiService.saveBarang(headers,
								this.barang_id,
								(this.decoded != null ? getStringImage(decoded) : "NO_IMAGE"),
								etBarcode.getText().toString(),
								etNama.getText().toString(),
								selected_satuan_id,
								Double.parseDouble(etHargaBeli.getText().toString()),
								Double.parseDouble(etHargaJual.getText().toString()),
								Integer.parseInt(etStok.getText().toString()),
								etKeterangan.getText().toString()
						).enqueue(new Callback<ResponseBody>() {
							@Override
							public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
								if (response.isSuccessful()) {
									loading.dismiss();
									try {

										JSONObject jsonObject = new JSONObject(response.body().string());

										if (jsonObject.getString("status").equals("true")) {
											String error_message = jsonObject.getString("error_msg");
											Toasty.success(mContext, error_message, Toasty.LENGTH_LONG).show();

											if (decoded != null) {
												File myFile = new File(mCurrentPhotoPath);
												if (myFile.exists())
													myFile.delete();
											}

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


					}).setNegativeButton("Batal", null).show();
		}
	}

	@OnClick(R.id.fbf_btnHapus)
	public void onBtnHapusClicked() {
		new AlertDialog.Builder(this.mContext)
				.setTitle("Hapus data barang")
				.setMessage("Apakah anda yakin ingin menghapus data barang ini?")
				.setPositiveButton("Hapus", (dialog, which) -> {

					ProgressDialog loading = ProgressDialog.show(mContext, null, "Menghapus data...", true, false);

					HashMap<String, String> headers = new HashMap<String, String>();
					headers.put("Authorization", session.getAccessToken());
					headers.put("Accept", "application/json");

					mBaseApiService.deleteBarang(headers, this.barang_id).enqueue(new Callback<ResponseBody>() {
						@Override
						public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
							if (response.isSuccessful()) {
								loading.dismiss();
								try {

									JSONObject jsonObject = new JSONObject(response.body().string());

									if (jsonObject.getString("status").equals("true")) {
										String error_message = jsonObject.getString("error_msg");
										Toasty.success(mContext, error_message, Toasty.LENGTH_LONG).show();

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


				}).setNegativeButton("Batal", null).show();
	}
}
