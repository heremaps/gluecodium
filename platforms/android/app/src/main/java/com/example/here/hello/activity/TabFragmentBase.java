package com.example.here.hello.activity;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorld;

public class TabFragmentBase extends Fragment {

  public TabFragmentBase() {
  }

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {

    final View rootView = inflater.inflate(R.layout.fragment_tab_base, container, false);

    Button greet = (Button) rootView.findViewById(R.id.greet);
    greet.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        EditText user = (EditText) rootView.findViewById(R.id.user);
        EditText resultText = (EditText) rootView.findViewById(R.id.result_text);

        String username = user.getText().toString();
        String userGreeting = HelloWorld.helloWorldMethod(username);

        resultText.setText(userGreeting);
      }
    });

    return rootView;
  }
}
