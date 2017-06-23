package com.here.helloapplication;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private EditText user;
    private Button greetButton;
    private EditText greeting;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        user = (EditText) findViewById(R.id.user);
        greetButton = (Button) findViewById(R.id.greetButton);
        greeting = (EditText) findViewById(R.id.greeting);

        greetButton.setOnClickListener( new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String username = user.getText().toString();
                // TODO: once APIGEN-245 is solved, use HelloWorld::helloWorldMethod( ) imported
                // from Java APIs .aar
                String userGreeting = "Hello " + username;
                greeting.setText(userGreeting, TextView.BufferType.EDITABLE);
            }
        });
    }
}
