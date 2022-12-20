package com.triasfahrudin.kasir.model;

import com.google.gson.annotations.SerializedName;

public class SatuanModel {
	@SerializedName("id")
	private int id;
	@SerializedName("nama")
	private String nama;
	@SerializedName("keterangan")
	private String keterangan;

	public SatuanModel(int id, String nama, String keterangan) {
		this.id = id;
		this.nama = nama;
		this.keterangan = keterangan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNama() {
		return nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public String getKeterangan() {
		return keterangan;
	}

	public void setKeterangan(String keterangan) {
		this.keterangan = keterangan;
	}

	//to display object as a string in spinner
	@Override
	public String toString() {
		return nama;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof SatuanModel) {
			SatuanModel c = (SatuanModel) obj;
			return c.getNama().equals(nama) || c.getId() == id;
		}

		return false;
	}
}
