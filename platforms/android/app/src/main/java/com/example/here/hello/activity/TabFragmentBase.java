package com.example.here.hello.activity;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorld;

public class TabFragmentBase extends Fragment {

  private Button submitButton;
  private EditText input;

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {

    final View rootView = inflater.inflate(R.layout.fragment_tab_base, container, false);
    input = (EditText) rootView.findViewById(R.id.input);
    submitButton = (Button) rootView.findViewById(R.id.greet);

    submitButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        EditText resultText = (EditText) rootView.findViewById(R.id.result_text);

        String username = input.getText().toString();
        String userGreeting = HelloWorld.helloWorldMethod(username);

        resultText.setText(userGreeting);
      }
    });

    input.setOnEditorActionListener(new EditText.OnEditorActionListener() {
      @Override
      public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
        if (actionId == EditorInfo.IME_ACTION_DONE) {
          submitButton.performClick();
          return true;
        }
        return false;
      }
    });

    return rootView;
  }
}
