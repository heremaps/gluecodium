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
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.here.hello.R;
import com.example.here.hello.utils.InputMethodHelper;

import com.here.android.hello.HelloWorldErrors;
import com.here.android.hello.InternalErrorsException;

public final class ErrorsFragment extends Fragment {

  private static final String EXCEPTION_TEXT = "Exception thrown%n"
      + "    %s%n%n"
      + "Error value:%n"
      + "    %s.%s";

  private Button submitTrue;
  private Button submitFalse;
  private TextView result;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  @Override
  public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_errors, container, false);
    result = rootView.findViewById(R.id.errors_result);
    submitTrue = rootView.findViewById(R.id.errors_submit_true);
    submitFalse = rootView.findViewById(R.id.errors_submit_false);
    spinner = rootView.findViewById(R.id.errors_spinner);
    descriptionsText = getResources().getStringArray(R.array.errors_methods_description);
    description = rootView.findViewById(R.id.errors_description);
    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);

    spinner.setOnItemSelectedListener(new OnItemSelectedListener() {
      @Override
      public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position,
          long id) {
        description.setText(descriptionsText[position]);
        result.setText("");
      }

      @Override
      public void onNothingSelected(AdapterView<?> parentView) {
        description.setText("");
      }
    });

    submitTrue
        .setOnClickListener(v -> executeErrorsMethod(spinner.getSelectedItemPosition(), true));
    submitFalse
        .setOnClickListener(v -> executeErrorsMethod(spinner.getSelectedItemPosition(), false));
  }

  private void executeErrorsMethod(final int selectedItemPosition, final boolean flag) {
    result.setText("");

    switch (selectedItemPosition) {
      case 0:
        try {
          HelloWorldErrors.helloWorldMethodWithError(flag);
        } catch (InternalErrorsException exception) {
          result.setText(String.format(EXCEPTION_TEXT,
              exception.getClass().getSimpleName(), exception.error.getClass().getSimpleName(),
              exception.error.toString()));
          return;
        }
        result.setText(R.string.no_exception_thrown);
        break;
      case 1:
        String resultString;

        try {
          resultString = HelloWorldErrors.helloWorldMethodWithErrorAndString(flag);
        } catch (InternalErrorsException exception) {
          result.setText(String.format(EXCEPTION_TEXT,
              exception.getClass().getSimpleName(), exception.error.getClass().getSimpleName(),
              exception.error.toString()));
          return;
        }

        String outputString =
            getResources().getString(R.string.no_exception_thrown) + "\n"
                + "Result string: " + resultString;
        result.setText(outputString);
        break;
    }

    // hide virtual keyboard
    InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
  }
}
