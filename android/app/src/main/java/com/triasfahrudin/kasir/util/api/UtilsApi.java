package com.triasfahrudin.kasir.util.api;

import android.content.Context;
import android.util.TypedValue;
import android.widget.EditText;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class UtilsApi {

//	public static final String BASE_URL = "http://192.168.8.100/kasir/";
	public static final String BASE_URL = "http://smknuruttaqwasonggon.sch.id/kasir/";
    public static final String BASE_URL_API = BASE_URL + "api/v1/";
    public static final String BASE_URL_WEBVIEW = BASE_URL + "webview/";

    // Mendeklarasikan Interface BaseApiService
    public static BaseApiService getAPIService() {
        return RetrofitClient.getClient(BASE_URL_API).create(BaseApiService.class);
    }

	public static int dp2px(Context mContext, int dp) {
		return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, mContext.getResources().getDisplayMetrics());
	}

	public static boolean isEditTextEmpty(EditText etText) {
		return etText.getText().toString().trim().length() <= 0;
	}

	public static boolean isStringInt(String s)
	{
		try
		{
			Integer.parseInt(s);
			return true;
		} catch (NumberFormatException ex)
		{
			return false;
		}
	}

    public static String formatRupiah(double nominal){
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("Rp. ");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);

        return kursIndonesia.format(nominal);
    }
}
