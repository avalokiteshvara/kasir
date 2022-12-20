package com.triasfahrudin.kasir.util;

import android.content.Context;
import android.content.SharedPreferences;

public class Session {

    public static final String USER_ID = "USER_ID";
    public static final String LOGIN_STATUS = "LOGIN_STATUS";
    public static final String NAMA = "NAMA";
    public static final String LEVEL = "LEVEL";
    public static final String ACCESS_TOKEN = "ACCESS_TOKEN";

    private SharedPreferences pref;
    private SharedPreferences.Editor editor;


    public Session(Context context) {
        pref = context.getSharedPreferences("COM.TRIASFAHRUDIN.KASIR.APP", Context.MODE_PRIVATE);
        editor = pref.edit();
    }

    public String getLevel() {
        return pref.getString(LEVEL, "");
    }

    public Boolean is_user_logged_in() {
        return pref.getBoolean(LOGIN_STATUS, false);
    }

    public String getNama() {
        return pref.getString(NAMA, "");
    }

    public String getAccessToken() {
        return pref.getString(ACCESS_TOKEN, "");
    }

    public int getUserId() {
        return pref.getInt(USER_ID, 0);
    }

    public void saveString(String key, String value) {
        editor.putString(key, value);
        editor.commit();
    }

    public void saveInt(String key, int value) {
        editor.putInt(key, value);
        editor.commit();
    }

    public void saveBoolean(String key, boolean value) {
        editor.putBoolean(key, value);
        editor.commit();
    }
}
