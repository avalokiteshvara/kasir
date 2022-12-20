package com.triasfahrudin.kasir.model;

import com.google.gson.annotations.SerializedName;

public class HutangModel {
	@SerializedName("id")
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTanggal() {
		return tanggal;
	}

	public void setTanggal(String tanggal) {
		this.tanggal = tanggal;
	}

	public double getTotal_harga_jual() {
		return total_harga_jual;
	}

	public void setTotal_harga_jual(double total_harga_jual) {
		this.total_harga_jual = total_harga_jual;
	}

	public double getKurang_bayar() {
		return kurang_bayar;
	}

	public void setKurang_bayar(double kurang_bayar) {
		this.kurang_bayar = kurang_bayar;
	}

	public String getNama_pembeli() {
		return nama_pembeli;
	}

	public void setNama_pembeli(String nama_pembeli) {
		this.nama_pembeli = nama_pembeli;
	}

	@SerializedName("tanggal")
	private String tanggal;

	@SerializedName("total_harga_jual")
	private double total_harga_jual;

	@SerializedName("kurang_bayar")
	private double kurang_bayar;

	@SerializedName("nama_pembeli")
	private String nama_pembeli;
}
