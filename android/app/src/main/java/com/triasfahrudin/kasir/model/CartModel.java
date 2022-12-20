package com.triasfahrudin.kasir.model;

import com.google.gson.annotations.SerializedName;

public class CartModel {

	@SerializedName("id")
	private int id;
	@SerializedName("barang_id")
	private int barang_id;
	@SerializedName("nama_barang")
	private String nama_barang;
	@SerializedName("foto")
	private String foto;
	@SerializedName("satuan")
	private String satuan;
	@SerializedName("harga_beli")
	private Double harga_beli;
	@SerializedName("harga_jual")
	private Double harga_jual;
	@SerializedName("qty")
	private int qty;

	public Double getHarga_beli() {
		return harga_beli;
	}

	public void setHarga_beli(Double harga_beli) {
		this.harga_beli = harga_beli;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public int getBarang_id() {
		return barang_id;
	}

	public void setBarang_id(int barang_id) {
		this.barang_id = barang_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public Double getHarga_jual() {
		return harga_jual;
	}

	public void setHarga_jual(Double harga_jual) {
		this.harga_jual = harga_jual;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

}
