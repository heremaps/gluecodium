/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
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
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.example.here.hello.utils.InputMethodHelper;
import com.here.android.hello.HelloWorldDefaults;

public final class DefaultsFragment extends Fragment {

  private Spinner spinner;
  private TextView result;
  private Button submitButton;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_defaults, container, false);
    spinner = rootView.findViewById(R.id.defaults_spinner);
    result = rootView.findViewById(R.id.defaults_text);
    submitButton = rootView.findViewById(R.id.defaults_submit);
    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);
    submitButton.setOnClickListener(
        v -> {
          HelloWorldDefaults.StructWithDefaults resultStruct =
              spinner.getSelectedItemPosition() == 0
                  ? new HelloWorldDefaults.StructWithDefaults()
                  : HelloWorldDefaults.getStructWithDefaults();

          String prefix =
              getResources().getString(R.string.defaults_retrieval_message)
                  + getResources()
                      .getStringArray(R.array.defaults_source)[spinner.getSelectedItemPosition()];
          result.setText(String.format("%s\n\n%s", prefix, generateStructString(resultStruct)));

          // hide virtual keyboard
          InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
        });
  }

  private static String generateStructString(final HelloWorldDefaults.StructWithDefaults struct) {
    return "StructWithDefaults {\n"
        + "intField="
        + struct.intField
        + "\n"
        + "floatField="
        + struct.floatField
        + "\n"
        + "boolField="
        + struct.boolField
        + "\n"
        + "stringField= \""
        + struct.stringField
        + "\"\n"
        + "enumField="
        + struct.enumField
        + "\n"
        + "}";
  }
}
