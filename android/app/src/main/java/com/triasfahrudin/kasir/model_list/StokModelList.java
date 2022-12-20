package com.triasfahrudin.kasir.model_list;

import com.google.gson.annotations.SerializedName;
import com.triasfahrudin.kasir.model.StokModel;

import java.util.ArrayList;

public class StokModelList {
	@SerializedName("dataList")
	private ArrayList<StokModel> arrayList;

	public ArrayList<StokModel> getArrayList() {
		return arrayList;    }

	public void setArraylList(ArrayList<StokModel> arrayList) {
		this.arrayList = arrayList;
	}
}
