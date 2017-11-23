/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.NonNull;
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
import com.here.android.hello.HelloWorldProfileManagerFactory;
import com.here.android.hello.ProfileManager;

import java.util.Locale;

public final class InstanceMethodsFragment extends Fragment {
    private Button submitButton;
    private TextView result;
    private EditText input;
    private ProfileManager profileManager;

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_instance_methods, container, false);
        input = rootView.findViewById(R.id.instance_methods_edit);
        result = rootView.findViewById(R.id.instance_methods_result);
        submitButton = rootView.findViewById(R.id.instance_methods_submit_button);

        profileManager = HelloWorldProfileManagerFactory.createProfileManagerInstance();

        return rootView;
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        submitButton.setOnClickListener(v -> {
            executeMethodOnObject(input.getText().toString());

            // hide virtual keyboard
            InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
        });
        input.setOnEditorActionListener((textView, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_DONE) {
                executeMethodOnObject(input.getText().toString());

                // Since description and result text are too big, hide keyboard on click to show results
                InputMethodHelper.hideSoftKeyboard(getContext(), textView.getWindowToken());
                return true;
            }
            return false;
        });
    }

    private void executeMethodOnObject( String parameterValue) {
        String oldProfileName = profileManager.changeProfile(parameterValue);

        String resultText = String.format(Locale.getDefault(), "Changed the profile name to \"%s\".\nThe old profile name is \"%s\"",
                parameterValue,
                oldProfileName);
        result.setText(resultText);
    }

}
