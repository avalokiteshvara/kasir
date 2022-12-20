package com.triasfahrudin.kasir.adapter;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.text.LineBreaker;
import android.os.Build;
import android.os.Bundle;
import android.text.InputType;
import android.text.Layout;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;
import com.triasfahrudin.kasir.R;
import com.triasfahrudin.kasir.fragment.BarangFormFragment;
import com.triasfahrudin.kasir.fragment.BarangFragment;
import com.triasfahrudin.kasir.fragment.CartFragment;
import com.triasfahrudin.kasir.model.BarangModel;
import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import es.dmoral.toasty.Toasty;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class BarangAdapter extends RecyclerView.Adapter<BarangAdapter.BarangViewHolder> {

	private final ArrayList<BarangModel> modelArrayList;
	ProgressDialog loading;
	Session session;
	BaseApiService mBaseApiService;
	Context mContext;
	String strCari;

	public BarangAdapter(String strCari, Context mContext,Session session, BaseApiService mBaseApiService,
						 ArrayList<BarangModel> modelArrayList) {
		this.strCari = strCari;
		this.modelArrayList = modelArrayList;
		this.mContext = mContext;
		this.session = session;
		this.mBaseApiService = mBaseApiService;
	}


	@NonNull
	@Override
	public BarangViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
		LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
		View view = layoutInflater.inflate(R.layout.recycler_barang, parent, false);
		return new BarangViewHolder(view);
	}

	@Override
	public void onBindViewHolder(@NonNull BarangViewHolder holder, int position) {
		Picasso.get().invalidate(UtilsApi.BASE_URL + "uploads/" + modelArrayList.get(position).getFoto());
		Picasso.get().load(UtilsApi.BASE_URL + "uploads/" + modelArrayList.get(position).getFoto()).into(holder.imgViewFoto);

		holder.tvNama.setText(modelArrayList.get(position).getNama());
		holder.tvSatuan.setText(modelArrayList.get(position).getSatuan());
		holder.tvHarga.setText(UtilsApi.formatRupiah(modelArrayList.get(position).getHarga_jual()));

		holder.imgViewFoto.setOnClickListener(view -> {
			android.app.AlertDialog.Builder dialog = new android.app.AlertDialog.Builder(mContext);
			LayoutInflater inflater = LayoutInflater.from(mContext);
			View dialogView = inflater.inflate(R.layout.fragment_popup_image, null);
			dialog.setView(dialogView);
			dialog.setCancelable(true);

			ImageView imgViewfoto = dialogView.findViewById(R.id.popup_imgView);
			Picasso.get().invalidate(UtilsApi.BASE_URL + "uploads/" + modelArrayList.get(position).getFoto());
			Picasso.get().load(UtilsApi.BASE_URL + "uploads/" + modelArrayList.get(position).getFoto()).into(imgViewfoto);

			final android.app.AlertDialog ad = dialog.create();
			ad.requestWindowFeature(Window.FEATURE_NO_TITLE);
			ad.show();
		});

		holder.btnEdit.setOnClickListener(view -> {
			Bundle bundle = new Bundle();
			bundle.putInt("barang_id", modelArrayList.get(position).getId());
			bundle.putString("nama_barang",modelArrayList.get(position).getNama());
			bundle.putString("barcode",modelArrayList.get(position).getBarcode());
			bundle.putInt("satuan_id", modelArrayList.get(position).getSatuan_id());
			bundle.putDouble("harga_beli",modelArrayList.get(position).getHarga_beli());
			bundle.putDouble("harga_jual",modelArrayList.get(position).getHarga_jual());
			bundle.putInt("stok_qty", modelArrayList.get(position).getStok_qty());
			bundle.putString("tgl_update",modelArrayList.get(position).getTgl_update());
			bundle.putString("keterangan",modelArrayList.get(position).getKeterangan());
			bundle.putString("foto",modelArrayList.get(position).getFoto());

			BarangFormFragment fragment = new BarangFormFragment();
			fragment.setArguments(bundle);
			AppCompatActivity activity = (AppCompatActivity) view.getContext();

			activity.getSupportFragmentManager()
					.beginTransaction()
					.replace(R.id.nav_host_fragment, fragment, BarangFormFragment.class.getSimpleName())
					.addToBackStack(null)
					.commit();

		});

		holder.btnKeranjang.setOnClickListener(view -> {

			loading = ProgressDialog.show(this.mContext, null, "Menambahkan barang ...", true, false);

			final EditText etQty = new EditText(view.getContext());
			etQty.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED);
			etQty.setTextSize(TypedValue.COMPLEX_UNIT_SP,15);
			etQty.setText("1");

			int padding10 = UtilsApi.dp2px(mContext,10);
			int padding20 = UtilsApi.dp2px(mContext,20);

			etQty.setPadding(padding20,padding10,padding20,padding10);

			final AlertDialog.Builder qtyDialog = new AlertDialog.Builder(view.getContext());
			qtyDialog.setTitle("Qty (" + modelArrayList.get(position).getSatuan() + ")");
			qtyDialog.setMessage("Masukkan jumlah barang yang dibeli");
			qtyDialog.setView(etQty);


			qtyDialog.setPositiveButton("Tambahkan", (dialog, which) -> {
				//cek apakah qty yang dimasukkan valid string
				if(UtilsApi.isStringInt(etQty.getText().toString())){
					int qty = Integer.parseInt(etQty.getText().toString());
					addCart(view,position,qty);
				}else{
					//jika tidak valid, otomatis qty = 1
					addCart(view,position,1);
				}
				loading.dismiss();
			});

			qtyDialog.setNegativeButton("Batal", (dialog, which) -> {
				// close the dialog
				loading.dismiss();
			});

			qtyDialog.create().show();
		});
	}

	private void addCart(View view,int position,int qty){

		HashMap<String, String> headers = new HashMap<>();
		headers.put("Authorization", this.session.getAccessToken());
		headers.put("Accept", "application/json");

		int barang_id = modelArrayList.get(position).getId();
		mBaseApiService.addCartItem(headers,barang_id,qty).enqueue(new Callback<ResponseBody>() {
			@Override
			public void onResponse(@NonNull Call<ResponseBody> call, @NonNull Response<ResponseBody> response) {
				if (response.isSuccessful()) {
					//loading.dismiss();

					try {
						JSONObject jsonObject = new JSONObject(Objects.requireNonNull(response.body()).string());
						String error_message = jsonObject.getString("error_msg");
						if (jsonObject.getString("status").equals("true")) {
							Toasty.success(mContext, error_message, Toasty.LENGTH_LONG).show();

							Bundle bundle = new Bundle();
							bundle.putString("string_cari", strCari);

							BarangFragment fragment = new BarangFragment();
							fragment.setArguments(bundle);
							AppCompatActivity activity = (AppCompatActivity) view.getContext();
							activity.getSupportFragmentManager()
									.beginTransaction()
									.replace(R.id.nav_host_fragment, fragment, BarangFragment.class.getSimpleName())
									.addToBackStack(null)
									.commit();


						} else {
							Toasty.error(mContext, error_message, Toasty.LENGTH_LONG).show();
						}
					} catch (JSONException | IOException e) {
						e.printStackTrace();
						Toasty.error(mContext, Objects.requireNonNull(e.getMessage()), Toasty.LENGTH_LONG).show();
					}

				} else {
					loading.dismiss();
				}
			}

			@Override
			public void onFailure(@NotNull Call<ResponseBody> call, Throwable t) {
				Toasty.error(mContext, "Ada kesalahan! :: " + t.getMessage(), Toasty.LENGTH_LONG, true).show();
				loading.dismiss();			}
		});
	}

	@Override
	public int getItemCount() {
		return modelArrayList.size();
	}

	public class BarangViewHolder extends RecyclerView.ViewHolder {

		ImageView imgViewFoto;

		TextView tvNama;
		TextView tvSatuan;
		TextView tvHarga;

		Button btnEdit;
		Button btnKeranjang;


		public BarangViewHolder(@NonNull View itemView) {
			super(itemView);
			imgViewFoto = itemView.findViewById(R.id.rb_imgViewFoto);

			tvNama = itemView.findViewById(R.id.rb_tvNama);
			tvSatuan = itemView.findViewById(R.id.rb_tvSatuan);
			tvHarga = itemView.findViewById(R.id.textView2);

			btnEdit = itemView.findViewById(R.id.rb_btnEdit);
			btnKeranjang = itemView.findViewById(R.id.rb_btnKeranjang);

//			tvNama.setBreakStrategy(LineBreaker.BREAK_STRATEGY_SIMPLE);

		}
	}
}
