package com.triasfahrudin.kasir.model_list;

import com.google.gson.annotations.SerializedName;
import com.triasfahrudin.kasir.model.HutangModel;

import java.util.ArrayList;

public class HutangModelList {

	@SerializedName("dataList")
	private ArrayList<HutangModel> arrayList;

	public ArrayList<HutangModel> getArrayList() {
		return arrayList;    }

	public void setArraylList(ArrayList<HutangModel> arrayList) {
		this.arrayList = arrayList;
	}

}
