/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
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

public final class ErrorsFragment extends Fragment {

  private static final String EXCEPTION_TEXT =
      "Exception thrown:%n" + "    %s%n%n" + "Error value:%n" + "    %s.%s";

  private Button submitSuccess;
  private Button submitThrowException;
  private TextView result;
  private Spinner spinner;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_errors, container, false);
    result = rootView.findViewById(R.id.errors_result);
    submitThrowException = rootView.findViewById(R.id.errors_submit_error);
    submitSuccess = rootView.findViewById(R.id.errors_submit_success);
    spinner = rootView.findViewById(R.id.errors_spinner);
    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);

    spinner.setOnItemSelectedListener(
        new OnItemSelectedListener() {
          @Override
          public void onItemSelected(
              AdapterView<?> parentView, View selectedItemView, int position, long id) {
            result.setText("");
          }

          @Override
          public void onNothingSelected(AdapterView<?> parentView) {
            result.setText("");
          }
        });

    submitThrowException.setOnClickListener(
        v -> executeErrorsMethod(spinner.getSelectedItemPosition(), true));
    submitSuccess.setOnClickListener(
        v -> executeErrorsMethod(spinner.getSelectedItemPosition(), false));
  }

  private void executeErrorsMethod(final int selectedItemPosition, final boolean flag) {
    result.setText("");

    switch (selectedItemPosition) {
      case 0:
        try {
          HelloWorldErrors.helloWorldMethodWithError(flag);
        } catch (HelloWorldErrors.InternalErrorsException exception) {
          result.setText(
              String.format(
                  EXCEPTION_TEXT,
                  exception.getClass().getSimpleName(),
                  exception.error.getClass().getSimpleName(),
                  exception.error.toString()));
          return;
        }
        result.setText(R.string.no_exception_thrown);
        break;
      case 1:
        String resultString;

        try {
          resultString = HelloWorldErrors.helloWorldMethodWithErrorAndString(flag);
        } catch (HelloWorldErrors.InternalErrorsException exception) {
          result.setText(
              String.format(
                  EXCEPTION_TEXT,
                  exception.getClass().getSimpleName(),
                  exception.error.getClass().getSimpleName(),
                  exception.error.toString()));
          return;
        }

        String outputString =
            getResources().getString(R.string.no_exception_thrown)
                + "\n\n"
                + "Result string: "
                + resultString;
        result.setText(outputString);
        break;
    }

    // hide virtual keyboard
    InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
  }
}
