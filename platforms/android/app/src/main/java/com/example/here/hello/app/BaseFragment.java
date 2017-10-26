package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.here.hello.R;
import com.example.here.hello.utils.InputMethodHelper;
import com.here.android.hello.HelloWorld;

public final class BaseFragment extends Fragment {
    private TextView result;
    private Button submitButton;
    private EditText input;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_base, container, false);
        input = rootView.findViewById(R.id.input);
        result = rootView.findViewById(R.id.result_text);
        submitButton = rootView.findViewById(R.id.greet);
        return rootView;
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        submitButton.setOnClickListener(v -> {

            String username = input.getText().toString();
            String userGreeting = HelloWorld.helloWorldMethod(username);

            result.setText(userGreeting);

            // hide virtual keyboard
            InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
        });
        input.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_DONE) {
                submitButton.performClick();
                return true;
            }
            return false;
        });
    }
}
