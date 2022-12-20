package com.triasfahrudin.kasir.util.api;

import com.triasfahrudin.kasir.model_list.BarangModelList;
import com.triasfahrudin.kasir.model_list.CartModelList;
import com.triasfahrudin.kasir.model_list.HutangModelList;
import com.triasfahrudin.kasir.model_list.SatuanModelList;
import com.triasfahrudin.kasir.model_list.StokModelList;
import com.triasfahrudin.kasir.model_list.TransactionModelList;

import java.util.HashMap;
import java.util.Map;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.HeaderMap;
import retrofit2.http.POST;

public interface BaseApiService {
	@FormUrlEncoded
	@POST("login")
	Call<ResponseBody> login(
			@Field("username") String username,
			@Field("password") String password
	);


	@FormUrlEncoded
	@POST("save-firebase-token")
	Call<ResponseBody> sendFirebaseToken(
			@HeaderMap Map<String, String> headers,
			@Field("token_id") String token_id
	);

	@FormUrlEncoded
	@POST("add-cart-item")
	Call<ResponseBody> addCartItem(
			@HeaderMap Map<String, String> headers,
			@Field("barang_id") int barang_id,
			@Field("qty") int qty
	);

	@FormUrlEncoded
	@POST("search-barang")
	Call<BarangModelList> searchBarang(
			@HeaderMap Map<String, String> headers,
			@Field("strCari") String strCari
	);

	@GET("get-satuan")
	Call<SatuanModelList> getSatuan(
			@HeaderMap Map<String, String> headers
	);

	@FormUrlEncoded
	@POST("delete-cart-item")
	Call<ResponseBody> deleteCartItem(
			@HeaderMap Map<String, String> headers,
			@Field("cart_id") int cart_id
	);

	@FormUrlEncoded
	@POST("update-cart-item")
	Call<ResponseBody> updateCartItem(
			@HeaderMap Map<String, String> headers,
			@Field("cart_id") int cart_id,
			@Field("qty") int qty
	);


	@FormUrlEncoded
	@POST("save-barang")
	Call<ResponseBody> saveBarang(
			@HeaderMap Map<String, String> headers,
			@Field("barang_id") int barang_id,
			@Field("foto") String foto,
			@Field("barcode") String barcode,
			@Field("nama") String nama,
			@Field("satuan_id") int satuan_id,
			@Field("harga_beli") Double harga_beli,
			@Field("harga_jual") Double harga_jual,
			@Field("stok_qty") int stok_qty,
			@Field("keterangan") String keterangan
	);


	@GET("get-cart")
	Call<CartModelList> getCart(
			@HeaderMap Map<String, String> headers
	);


	@POST("delete-cart")
	Call<ResponseBody> deleteCart(
			@HeaderMap Map<String, String> headers
	);

	@FormUrlEncoded
	@POST("delete-barang")
	Call<ResponseBody> deleteBarang(
			@HeaderMap Map<String, String> headers,
			@Field("barang_id") int barang_id
	);

	@FormUrlEncoded
	@POST("save-transaction")
	Call<ResponseBody> saveTransaction(
			@HeaderMap Map<String, String> headers,
			@Field("bayar_tunai") double bayar_tunai,
			@Field("nama_pembeli") String nama_pembeli,
			@Field("total_harga_jual") double total_harga_jual,
			@Field("total_harga_beli") double total_harga_beli
	);

	@GET("get-hutang")
	Call<HutangModelList> getHutang(
			@HeaderMap Map<String, String> headers
	);

	@FormUrlEncoded
	@POST("bayar-hutang")
	Call<ResponseBody> bayarHutang(
			@HeaderMap Map<String, String> headers,
			@Field("penjualan_id") int penjualan_id,
			@Field("bayar_tunai") double bayar_tunai
	);

	@GET("get-stok")
	Call<StokModelList> getStok(
			@HeaderMap Map<String, String> headers
	);

	@GET("get-catatan")
	Call<ResponseBody> getCatatan(
			@HeaderMap Map<String, String> headers
	);

	@FormUrlEncoded
	@POST("buat-catatan-baru")
	Call<ResponseBody> newCatatan(
			@HeaderMap Map<String, String> headers,
			@Field("isi") String isi_catatan
	);

	@FormUrlEncoded
	@POST("simpan-catatan")
	Call<ResponseBody> saveCatatan(
			@HeaderMap Map<String, String> headers,
			@Field("id") int id,
			@Field("isi") String isi_catatan
	);

	@GET("get-transaction-list")
	Call<TransactionModelList> getTransaction(
			@HeaderMap Map<String, String> headers
	);
}
