package com.triasfahrudin.kasir.model;

import com.google.gson.annotations.SerializedName;

public class StokModel {


	@SerializedName("nama_barang")
	private String nama_barang;
	@SerializedName("satuan")
	private String satuan;
	@SerializedName("qty")
	private int qty;

	public String getNama_barang() {
		return nama_barang;
	}

	public void setNama_barang(String nama_barang) {
		this.nama_barang = nama_barang;
	}

	public String getSatuan() {
		return satuan;
	}

	public void setSatuan(String satuan) {
		this.satuan = satuan;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}
