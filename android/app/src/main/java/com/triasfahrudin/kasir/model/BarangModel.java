package com.triasfahrudin.kasir.model;

import com.google.gson.annotations.SerializedName;

public class BarangModel {

	@SerializedName("id")
	private int id;
	@SerializedName("foto")
	private String foto;
	@SerializedName("barcode")
	private String barcode;
	@SerializedName("nama")
	private String nama;
	@SerializedName("satuan_id")
	private int satuan_id;
	@SerializedName("satuan")
	private String satuan;
	@SerializedName("harga_beli")
	private Double harga_beli;
	@SerializedName("harga_jual")
	private Double harga_jual;
	@SerializedName("stok_qty")
	private int stok_qty;
	@SerializedName("keterangan")
	private String keterangan;
	@SerializedName("bagian")
	private String bagian;

	public String getTgl_update() {
		return tgl_update;
	}

	public void setTgl_update(String tgl_update) {
		this.tgl_update = tgl_update;
	}

	@SerializedName("tgl_update")
	private String tgl_update;

	public String getSatuan() {
		return satuan;
	}

	public void setSatuan(String satuan) {
		this.satuan = satuan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getNama() {
		return nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public int getSatuan_id() {
		return satuan_id;
	}

	public void setSatuan_id(int satuan_id) {
		this.satuan_id = satuan_id;
	}

	public Double getHarga_beli() {
		return harga_beli;
	}

	public void setHarga_beli(Double harga_beli) {
		this.harga_beli = harga_beli;
	}

	public Double getHarga_jual() {
		return harga_jual;
	}

	public void setHarga_jual(Double harga_jual) {
		this.harga_jual = harga_jual;
	}

	public int getStok_qty() {
		return stok_qty;
	}

	public void setStok_qty(int stok_qty) {
		this.stok_qty = stok_qty;
	}

	public String getKeterangan() {
		return keterangan;
	}

	public void setKeterangan(String keterangan) {
		this.keterangan = keterangan;
	}

	public String getBagian() {
		return bagian;
	}

	public void setBagian(String bagian) {
		this.bagian = bagian;
	}

}
