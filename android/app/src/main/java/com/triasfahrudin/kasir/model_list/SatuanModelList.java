package com.triasfahrudin.kasir.model_list;

import com.google.gson.annotations.SerializedName;
import com.triasfahrudin.kasir.model.SatuanModel;

import java.util.ArrayList;

public class SatuanModelList {
	@SerializedName("dataList")
	private ArrayList<SatuanModel> arrayList;

	public ArrayList<SatuanModel> getArrayList() {
		return arrayList;    }

	public void setArraylList(ArrayList<SatuanModel> arrayList) {
		this.arrayList = arrayList;
	}
}
