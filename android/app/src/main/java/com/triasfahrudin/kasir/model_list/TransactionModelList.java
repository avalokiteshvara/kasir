package com.triasfahrudin.kasir.model_list;

import com.google.gson.annotations.SerializedName;
import com.triasfahrudin.kasir.model.StokModel;
import com.triasfahrudin.kasir.model.TransactionModel;

import java.util.ArrayList;

public class TransactionModelList {
	@SerializedName("dataList")
	private ArrayList<TransactionModel> arrayList;

	public ArrayList<TransactionModel> getArrayList() {
		return arrayList;    }

	public void setArraylList(ArrayList<TransactionModel> arrayList) {
		this.arrayList = arrayList;
	}
}
