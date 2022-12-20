package com.triasfahrudin.kasir.model;

import com.google.gson.annotations.SerializedName;

public class TransactionModel {

	@SerializedName("tgl")
	private String tgl;
	@SerializedName("jml_transaksi")
	private int jml_transaksi;
	@SerializedName("total_harga_jual")
	private double total_harga_jual;

	public String getTgl() {
		return tgl;
	}

	public void setTgl(String tgl) {
		this.tgl = tgl;
	}

	public int getJml_transaksi() {
		return jml_transaksi;
	}

	public void setJml_transaksi(int jml_transaksi) {
		this.jml_transaksi = jml_transaksi;
	}

	public double getTotal_harga_jual() {
		return total_harga_jual;
	}

	public void setTotal_harga_jual(double total_harga_jual) {
		this.total_harga_jual = total_harga_jual;
	}

	public double getKeuntungan() {
		return keuntungan;
	}

	public void setKeuntungan(double keuntungan) {
		this.keuntungan = keuntungan;
	}

	@SerializedName("keuntungan")
	private double keuntungan;

}
