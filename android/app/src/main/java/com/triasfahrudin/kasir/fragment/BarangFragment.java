package com.triasfahrudin.kasir.fragment;

import android.Manifest;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.core.view.ViewCompat;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
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
import com.triasfahrudin.kasir.LoginActivity;
import com.triasfahrudin.kasir.MainActivity;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.adapter.BarangAdapter;
import com.triasfahrudin.kasir.model.BarangModel;
import com.triasfahrudin.kasir.model_list.BarangModelList;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import es.dmoral.toasty.Toasty;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class BarangFragment extends Fragment {

	Context mContext;
	BaseApiService mBaseApiService;
	Session session;
	ProgressDialog loading;
	AlertDialog mAlertDialog;

	ImageView imageView;
	CodeScanner codeScanner;
	CodeScannerView codeScannerView;

	@BindView(R.id.fbl_etBarcode)
	EditText etCariBarang;
	@BindView(R.id.fbl_btnScanBarcode)
	Button btnScanBarcode;
	@BindView(R.id.fbl_btnCari)
	Button btnCari;

	private SwipeRefreshLayout swipeRefreshLayout;

	@Override
	public void onAttach(@NotNull Context context) {
		super.onAttach(context);
		mContext = context;
	}

	public View onCreateView(@NonNull LayoutInflater inflater,
							 ViewGroup container, Bundle savedInstanceState) {

		View root = inflater.inflate(R.layout.fragment_barang_list, container, false);
		swipeRefreshLayout = root.findViewById(R.id.fbl_swipeContainer);
		ButterKnife.bind(this, root);

		mBaseApiService = UtilsApi.getAPIService();
		session = new Session(mContext);

		swipeRefreshLayout.setOnRefreshListener(() -> {
			swipeRefreshLayout.setRefreshing(false);
			loadData();
		});

		FloatingActionButton floatingActionButton = ((MainActivity) getActivity()).getFloatingActionButton();
		if (floatingActionButton != null) {
			floatingActionButton.hide();
			floatingActionButton.setOnClickListener(view -> {
			});
		}

		Bundle arguments = getArguments();
		if (arguments != null) {
			String string_cari = getArguments().getString("string_cari", "");
			etCariBarang.setText(string_cari);
			loadData();
		}

		return root;
	}


	private void loadData() {

		String strCari = etCariBarang.getText().toString();

		if (!strCari.isEmpty()) {

			if (strCari.length() >= 3) {

				hideKeyboardFrom(mContext,getView());

				loading = ProgressDialog.show(mContext, null, "Mengambil data barang...", true, false);

				HashMap<String, String> headers = new HashMap<String, String>();
				headers.put("Authorization", session.getAccessToken());
				headers.put("Accept", "application/json");

				mBaseApiService.searchBarang(
						headers,
						strCari
				).enqueue(new Callback<BarangModelList>() {
					@Override
					public void onResponse(@NonNull Call<BarangModelList> call, @NonNull Response<BarangModelList> response) {
						loading.dismiss();

						if (response.isSuccessful()) {
							generateRecyclerList(Objects.requireNonNull(response.body()).getArrayList());
						} else {
							Toasty.error(mContext, "Sesi aplikasi telah berakhir. Silahkan perbaharui sesi login anda", Toasty.LENGTH_SHORT).show();
							session.saveBoolean(Session.LOGIN_STATUS, false);
							Intent intent = new Intent(getActivity(), LoginActivity.class);
							startActivity(intent);
						}
					}

					@Override
					public void onFailure(@NotNull Call<BarangModelList> call, @NotNull Throwable t) {
						Toasty.error(mContext, "Ada kesalahan! :: " + t.getMessage(), Toasty.LENGTH_LONG, true).show();
						loading.dismiss();
					}
				});
			} else {
				etCariBarang.setError("Pencarian minimal 3 huruf.");
			}


		} else {
			etCariBarang.setError("Nama barang atau barcode diperlukan.");
		}
	}

	private void generateRecyclerList(ArrayList<BarangModel> modelList) {

		if(modelList.isEmpty()){
			Toasty.warning(mContext, "Barang tidak ditemukan", Toasty.LENGTH_LONG, true).show();
		}

		RecyclerView recyclerView = requireView().findViewById(R.id.fbl_recyclerview_list);
		BarangAdapter adapter = new BarangAdapter(etCariBarang.getText().toString(),
				this.mContext,
				this.session,
				this.mBaseApiService,
				modelList
		);

		RecyclerView.LayoutManager layoutManager = new GridLayoutManager(getActivity(), 1);
		recyclerView.setLayoutManager(layoutManager);
		recyclerView.setAdapter(adapter);
	}


	@OnClick(R.id.fbl_btnScanBarcode)
	public void onBtnScanBarcodeClicked() {

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
			etCariBarang.setText(result.getText());
			mAlertDialog.dismiss();
			loadData();

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
	public void onViewCreated(@NotNull View view, Bundle savedInstanceState) {
		super.onViewCreated(view, savedInstanceState);
		ViewCompat.requestApplyInsets(view);
	}

	public static void hideKeyboardFrom(Context context, View view) {
		if (view != null) {
			InputMethodManager imm = (InputMethodManager) context.getSystemService(Activity.INPUT_METHOD_SERVICE);
			imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
		}

	}


	@OnClick(R.id.fbl_btnCari)
	public void onBtnCariClicked() {
		loadData();
	}
}
