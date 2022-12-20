package com.triasfahrudin.kasir.model_list;

import com.google.gson.annotations.SerializedName;
import com.triasfahrudin.kasir.model.CartModel;

import java.util.ArrayList;

public class CartModelList {

	@SerializedName("dataList")
	private ArrayList<CartModel> arrayList;

	public ArrayList<CartModel> getArrayList() {
		return arrayList;    }

	public void setArraylList(ArrayList<CartModel> arrayList) {
		this.arrayList = arrayList;
	}

}
