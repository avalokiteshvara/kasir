package com.triasfahrudin.kasir;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.triasfahrudin.kasir.util.Session;
import com.triasfahrudin.kasir.util.api.BaseApiService;
import com.triasfahrudin.kasir.util.api.UtilsApi;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import es.dmoral.toasty.Toasty;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class LoginActivity extends AppCompatActivity {

    @BindView(R.id.login_etUserName)
    EditText etUserName;
    @BindView(R.id.etPassword)
    EditText etPassword;
    @BindView(R.id.btnSignIn)
    Button btnSignIn;
    @BindView(R.id.progressBar)
    ProgressBar loading;

    Context mContext;
    BaseApiService mBaseApiService;
    Session session;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_login);
        ButterKnife.bind(this);

        mContext = this;
        mBaseApiService = UtilsApi.getAPIService();
        session = new Session(this);

        loading.setVisibility(View.GONE);

        if (Boolean.TRUE.equals(session.is_user_logged_in())) {
            startActivity(new Intent(LoginActivity.this, MainActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK));
            finish();
        }
    }

    @OnClick(R.id.btnSignIn)
    public void requestLogin() {

        String username = etUserName.getText().toString().trim();
        String password = etPassword.getText().toString().trim();

        if (TextUtils.isEmpty(username)) {
            etUserName.setError("Username diperlukan.");
            return;
        }

        if (TextUtils.isEmpty(password)) {
            etPassword.setError("Password diperlukan.");
            return;
        }

        loading.setVisibility(View.VISIBLE);

        Log.e("LOGIN", "Mulai login");
        mBaseApiService.login(username, password)
            .enqueue(new Callback<ResponseBody>() {
                @Override
                public void onResponse(@NotNull Call<ResponseBody> call, @NotNull Response<ResponseBody> response) {
                    if (response.isSuccessful()) {
                        loading.setVisibility(View.GONE);
                        try {
                            JSONObject jsonObject = new JSONObject(response.body().string());

                            Log.i("LOGIN", "JSONObject :" + jsonObject.toString());

                            if (jsonObject.getString("status").equals("true")) {

                                int user_id = jsonObject.getJSONObject("user").getInt("user_id");
                                String nama = jsonObject.getJSONObject("user").getString("user_name");
                                String level = jsonObject.getJSONObject("user").getString("user_level");
                                String token = jsonObject.getJSONObject("user").getString("user_token");

                                session.saveInt(Session.USER_ID,user_id);
                                session.saveBoolean(Session.LOGIN_STATUS, true);
                                session.saveString(Session.NAMA, nama);
                                session.saveString(Session.LEVEL, level);
                                session.saveString(Session.ACCESS_TOKEN, token);

                                startActivity(new Intent(mContext, MainActivity.class)
                                    .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK));
                                finish();

                            } else {
                                String error_message = jsonObject.getString("error_msg");
                                Toasty.error(mContext, error_message, Toasty.LENGTH_LONG).show();
                                Log.i("LOGIN", "Login GAGAL : " + error_message);
                            }
                        } catch (JSONException | IOException e) {
                            Log.i("LOGIN", "Login GAGAL " + e.getMessage());
                        }
                    } else {
                        loading.setVisibility(View.GONE);
                    }
                }

                @Override
                public void onFailure(Call<ResponseBody> call, Throwable t) {
                    Toasty.error(mContext, "ERROR:" + t.getMessage(), Toast.LENGTH_LONG).show();
                    Log.e("debug", "onFailure: ERROR > " + t.toString());
                    loading.setVisibility(View.GONE);
                }
            });

    }


    @Override
    public void onBackPressed() {

    }

}
