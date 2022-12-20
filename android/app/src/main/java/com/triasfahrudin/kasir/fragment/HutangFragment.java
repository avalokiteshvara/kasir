package com.triasfahrudin.kasir.fragment;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.triasfahrudin.kasir.LoginActivity;
import com.triasfahrudin.kasir.MainActivity;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.adapter.CartAdapter;
import com.triasfahrudin.kasir.adapter.HutangAdapter;
import com.triasfahrudin.kasir.model.CartModel;
import com.triasfahrudin.kasir.model.HutangModel;
import com.triasfahrudin.kasir.model_list.CartModelList;
import com.triasfahrudin.kasir.model_list.HutangModelList;
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

public class HutangFragment extends Fragment {

	Context mContext;
	BaseApiService mBaseApiService;

	Session session;
	ProgressDialog loading;
	AlertDialog mAlertDialog;

	@BindView(R.id.fhl_recyclerview_list)
	RecyclerView recyclerView;
	@BindView(R.id.fhl_swipeContainer)
	SwipeRefreshLayout swipeContainer;

	private HutangAdapter adapter;

	@Override
	public void onAttach(Context context) {
		super.onAttach(context);
		mContext = context;
	}

	public View onCreateView(@NonNull LayoutInflater inflater,
							 ViewGroup container, Bundle savedInstanceState) {

		View root = inflater.inflate(R.layout.fragment_hutang_list, container, false);

		ButterKnife.bind(this, root);

		mBaseApiService = UtilsApi.getAPIService();
		session = new Session(mContext);

		swipeContainer.setOnRefreshListener(() -> {
			swipeContainer.setRefreshing(false);
			loadData();
		});

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

		loading = ProgressDialog.show(mContext, null, "Mengambil data hutang...", true, false);

		HashMap<String, String> headers = new HashMap<String, String>();
		headers.put("Authorization", session.getAccessToken());
		headers.put("Accept", "application/json");

		mBaseApiService.getHutang(headers).enqueue(new Callback<HutangModelList>() {
			@Override
			public void onResponse(@NonNull Call<HutangModelList> call, @NonNull Response<HutangModelList> response) {
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
			public void onFailure(Call<HutangModelList> call, Throwable t) {
				Toasty.error(mContext, "Ada kesalahan! :: " + t.getMessage(), Toasty.LENGTH_LONG, true).show();
				loading.dismiss();
			}
		});

	}

	private void generateRecyclerList(ArrayList<HutangModel> modelList) {

		if (modelList.isEmpty()) {
			Toasty.warning(mContext, "Tidak ada data hutang", Toasty.LENGTH_LONG, true).show();
		}

		adapter = new HutangAdapter(mContext,session,mBaseApiService,modelList);
		RecyclerView.LayoutManager layoutManager = new GridLayoutManager(getActivity(), 1);
		recyclerView.setLayoutManager(layoutManager);
		recyclerView.setAdapter(adapter);
	}
}
