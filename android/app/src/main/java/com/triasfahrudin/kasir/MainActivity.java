package com.triasfahrudin.kasir;

import android.Manifest;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;

import android.provider.Settings;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.navigation.NavigationView;
import com.google.android.material.snackbar.Snackbar;
import com.google.firebase.iid.FirebaseInstanceId;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.MultiplePermissionsReport;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.multi.MultiplePermissionsListener;
import com.triasfahrudin.kasir.fragment.BarangFormFragment;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import es.dmoral.toasty.Toasty;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class MainActivity extends AppCompatActivity {

	public FloatingActionButton fab;
	public NavigationView navigationView;
	Session session;
	BaseApiService mBaseApiService;
	Context mContext;
	private AppBarConfiguration mAppBarConfiguration;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		Toolbar toolbar = findViewById(R.id.toolbar);
		setSupportActionBar(toolbar);
		fab = findViewById(R.id.fab);
		fab.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View view) {
				Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
						.setAction("Action", null).show();
			}
		});

		session = new Session(this);

		requestMultiplePermissions();
		mContext = this;
		mBaseApiService = UtilsApi.getAPIService();
		CheckTypesTask loading = new CheckTypesTask();
		loading.execute();


		DrawerLayout drawer = findViewById(R.id.drawer_layout);
		navigationView = findViewById(R.id.nav_view);
		// Passing each menu ID as a set of Ids because each
		// menu should be considered as top level destinations.
		mAppBarConfiguration = new AppBarConfiguration.Builder(
				R.id.nav_barang, R.id.nav_keranjang, R.id.nav_hutang, R.id.nav_stok, R.id.nav_catatan, R.id.nav_transaksi)
				.setDrawerLayout(drawer)
				.build();
		NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment);
		NavigationUI.setupActionBarWithNavController(this, navController, mAppBarConfiguration);
		NavigationUI.setupWithNavController(navigationView, navController);
	}

	public NavigationView getNavigationView() {
		return navigationView;
	}

	public FloatingActionButton getFloatingActionButton() {
		return fab;
	}

	private void requestMultiplePermissions() {
		Dexter.withActivity(this)
				.withPermissions(
						Manifest.permission.WRITE_EXTERNAL_STORAGE,
						Manifest.permission.CAMERA,
						Manifest.permission.READ_EXTERNAL_STORAGE)
				.withListener(new MultiplePermissionsListener() {
					@Override
					public void onPermissionsChecked(MultiplePermissionsReport report) {
						if (report.areAllPermissionsGranted()) {
							Toasty.info(getApplicationContext(), "Selamat datang kembali!", Toasty.LENGTH_SHORT).show();
						}

						if (report.isAnyPermissionPermanentlyDenied()) {
							showSettingsDialog();
						}
					}

					@Override
					public void onPermissionRationaleShouldBeShown(List<PermissionRequest> permissions, PermissionToken token) {
						token.continuePermissionRequest();
					}
				}).
				withErrorListener(error -> Toasty.error(getApplicationContext(), String.format("Some Error! %s", error.toString()), Toasty.LENGTH_SHORT).show())
				.onSameThread()
				.check();
	}

	private void showSettingsDialog() {
		AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
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
		Uri uri = Uri.fromParts("package", getPackageName(), null);
		intent.setData(uri);
		startActivityForResult(intent, 101);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}


	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		int id = item.getItemId();
		if (id == R.id.action_add_barang) {

			Bundle bundle = new Bundle();
			bundle.putInt("barang_id", 0);
			bundle.putString("nama_barang", "");
			bundle.putString("barcode", "");
			bundle.putInt("satuan_id", 1);
			bundle.putDouble("harga_beli", 0);
			bundle.putDouble("harga_jual", 0);
			bundle.putInt("stok_qty", 0);
			bundle.putString("tgl_update", "");
			bundle.putString("keterangan", "");
			bundle.putString("foto", "placeholder.png");

			BarangFormFragment fragment = new BarangFormFragment();
			fragment.setArguments(bundle);

			getSupportFragmentManager()
					.beginTransaction()
					.replace(R.id.nav_host_fragment, fragment, BarangFormFragment.class.getSimpleName())
					.addToBackStack(null)
					.commit();

		}else if(id == R.id.action_logout){

			new AlertDialog.Builder(this.mContext)
					.setTitle("Keluar")
					.setMessage("Apakah anda yakin ingin keluar aplikasi?")
					.setPositiveButton("Ya", (dialog, which) -> {

						session.saveBoolean(Session.LOGIN_STATUS, false);
						startActivity(new Intent(mContext, LoginActivity.class)
								.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK));
						finish();

					}).setNegativeButton("Batal", null).show();


		}

		return super.onOptionsItemSelected(item);
	}

	@Override
	public boolean onSupportNavigateUp() {
		NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment);
		return NavigationUI.navigateUp(navController, mAppBarConfiguration)
				|| super.onSupportNavigateUp();
	}

	public class CheckTypesTask extends AsyncTask<Void, Void, Void> {
		ProgressDialog asyncDialog = new ProgressDialog(MainActivity.this);
		String typeStatus;

		@Override
		protected void onPreExecute() {
			//set message of the dialog
			asyncDialog.setMessage(getString(R.string.mengirimkan_token));
			//show dialog
			asyncDialog.show();
			super.onPreExecute();
		}

		@Override
		protected Void doInBackground(Void... arg0) {

			//don't touch dialog here it'll break the application
			//do some lengthy stuff like calling login webservice

			FirebaseInstanceId.getInstance().getInstanceId()
					.addOnCompleteListener(task -> {
						if (!task.isSuccessful()) {
							Log.w(MainActivity.class.getSimpleName(), "getInstanceId failed", task.getException());
							return;
						}
						String token = Objects.requireNonNull(task.getResult()).getToken();
						Log.d(MainActivity.class.getSimpleName(), token);

						sendRegistrationToServer(token);
					});

			return null;
		}

		private void sendRegistrationToServer(String token_id) {

			HashMap<String, String> headers = new HashMap<String, String>();
			headers.put("Authorization", session.getAccessToken());
			headers.put("Accept", "application/json");

			mBaseApiService.sendFirebaseToken(headers, token_id)
					.enqueue(new Callback<ResponseBody>() {
						@Override
						public void onResponse(@NonNull Call<ResponseBody> call, @NonNull Response<ResponseBody> response) {
							if (response.isSuccessful()) {
								try {
									JSONObject jsonObject = new JSONObject(response.body().string());
									String error_message = jsonObject.getString("error_msg");

									if (jsonObject.getString("status").equals("true")) {
										//Toasty.success(mContext, error_message, Toasty.LENGTH_SHORT).show();
									} else {
										Toasty.error(mContext, error_message, Toasty.LENGTH_SHORT).show();
									}

								} catch (JSONException | IOException e) {
									Toasty.error(mContext, e.getMessage(), Toasty.LENGTH_SHORT).show();
									e.printStackTrace();
								}

							} else {
								Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
								session.saveBoolean(Session.LOGIN_STATUS, false);
								startActivity(new Intent(mContext, LoginActivity.class)
										.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK));
								finish();
							}
						}

						@Override
						public void onFailure(@NonNull Call<ResponseBody> call, @NonNull Throwable t) {
							Log.e("debug", "onFailure: ERROR > " + t.toString());
							Toasty.error(mContext, t.getMessage(), Toasty.LENGTH_SHORT).show();
						}
					});
		}

		@Override
		protected void onPostExecute(Void result) {
			//hide the dialog
			asyncDialog.dismiss();

			super.onPostExecute(result);
		}
	}
}
