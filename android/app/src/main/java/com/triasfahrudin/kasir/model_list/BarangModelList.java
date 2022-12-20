package com.triasfahrudin.kasir.model_list;

import com.google.gson.annotations.SerializedName;
import com.triasfahrudin.kasir.model.BarangModel;

import java.util.ArrayList;

public class BarangModelList {

	@SerializedName("dataList")
	private ArrayList<BarangModel> arrayList;

	public ArrayList<BarangModel> getArrayList() {
		return arrayList;    }

	public void setArraylList(ArrayList<BarangModel> arrayList) {
		this.arrayList = arrayList;
	}

}
