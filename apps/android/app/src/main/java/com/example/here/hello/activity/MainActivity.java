package com.example.here.hello.activity;

import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.here.hello.R;
import com.here.android.hello.HelloWorld;

public final class MainActivity extends AppCompatActivity {
    private EditText user;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        user = (EditText) findViewById(R.id.user);
        Button greet = (Button) findViewById(R.id.greet);
        greet.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String username = user.getText().toString();
                // TODO: native method should be static, needs to be parsed from the deployment
                // model accordingly
                HelloWorld helloWorld = new HelloWorld();
                String userGreeting = helloWorld.helloWorldMethod(username);
                Snackbar.make(user, userGreeting, Snackbar.LENGTH_INDEFINITE)
                        .show();
            }
        });
    }
}
