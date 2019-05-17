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

import static android.content.Context.INPUT_METHOD_SERVICE;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.Calculator;
import com.here.android.hello.CalculatorFactory;
import com.here.android.hello.CalculatorListener;
import com.here.android.hello.HelloWorldCalculatorListenerFactory;
import com.here.android.hello.HelloWorldStaticLogger;

public final class ListenersFragment extends Fragment {
  private static final String CALLED_WITH_RESULT = "called with result =";
  private static final int JAVA_LISTENER_NATIVE_METHOD = 0;
  private static final int NATIVE_LISTENER_NATIVE_METHOD = 1;
  private static final int LISTENERS_IN_BACKGROUND = 2;
  private static final Calculator.Position START_POSITION = new Calculator.Position(0f, 0f, 0f);
  private static final Calculator.Position END_POSITION = new Calculator.Position(0f, 0f, 0f);

  private TextView result;
  private TextView java_listener_result;
  private TextView native_listener_result;
  private TextView inputX1;
  private TextView inputY1;
  private TextView inputZ1;
  private TextView inputX2;
  private TextView inputY2;
  private TextView inputZ2;
  private TextView statusRegisteredJavaListeners;
  private TextView statusRegisteredNativeListeners;
  private Spinner spinner;
  private Button registerJavaButton;
  private Button unregisterJavaButton;
  private Button registerNativeButton;
  private Button unregisterNativeButton;
  private Button submitButton;
  private LinearLayout calculateInBackgroundJavaResultLayout;
  private LinearLayout calculateInBackgroundNativeResultLayout;
  private LinearLayout calculateInBackgroundJavaButtonsLayout;
  private LinearLayout calculateInBackgroundNativeButtonsLayout;
  private String[] buttonText;
  private final Calculator notifier = CalculatorFactory.createCalculator();

  private final CalculatorListener javaListener =
      new CalculatorListener() {
        @Override
        public void onCalculationResult(double v) {
          result.setText(String.valueOf(v));
        }

        @Override
        public void onCalculationInBackgroundResult(double v) {
          java_listener_result.setText(String.valueOf(v));
        }
      };
  private final CalculatorListener nativeListener =
      HelloWorldCalculatorListenerFactory.createCalculatorListener();

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_listeners, container, false);
    buttonText = getResources().getStringArray(R.array.listeners_methods_button);
    registerJavaButton = rootView.findViewById(R.id.register_java_listener);
    unregisterJavaButton = rootView.findViewById(R.id.unregister_java_listener);
    registerNativeButton = rootView.findViewById(R.id.register_native_listener);
    unregisterNativeButton = rootView.findViewById(R.id.unregister_native_listener);
    inputX1 = rootView.findViewById(R.id.listeners_start_x);
    inputY1 = rootView.findViewById(R.id.listeners_start_y);
    inputZ1 = rootView.findViewById(R.id.listeners_start_z);
    inputX2 = rootView.findViewById(R.id.listeners_end_x);
    inputY2 = rootView.findViewById(R.id.listeners_end_y);
    inputZ2 = rootView.findViewById(R.id.listeners_end_z);
    result = rootView.findViewById(R.id.listener_result);
    java_listener_result = rootView.findViewById(R.id.java_listener_result);
    native_listener_result = rootView.findViewById(R.id.native_listener_result);
    spinner = rootView.findViewById(R.id.listeners_spinner);
    submitButton = rootView.findViewById(R.id.listeners_submit_button);
    statusRegisteredJavaListeners = rootView.findViewById(R.id.status_registered_java_listeners);
    statusRegisteredNativeListeners =
        rootView.findViewById(R.id.status_native_registered_native_listeners);
    calculateInBackgroundJavaResultLayout =
        rootView.findViewById(R.id.calculate_in_background_java_result);
    calculateInBackgroundNativeResultLayout =
        rootView.findViewById(R.id.calculate_in_background_native_result);
    calculateInBackgroundJavaButtonsLayout =
        rootView.findViewById(R.id.calculate_in_background_java_buttons);
    calculateInBackgroundNativeButtonsLayout =
        rootView.findViewById(R.id.calculate_in_background_native_buttons);
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
            java_listener_result.setText("");
            native_listener_result.setText("");
            submitButton.setText(buttonText[position]);
            if (position == LISTENERS_IN_BACKGROUND) {
              calculateInBackgroundJavaResultLayout.setVisibility(View.VISIBLE);
              calculateInBackgroundNativeResultLayout.setVisibility(View.VISIBLE);
              calculateInBackgroundJavaButtonsLayout.setVisibility(View.VISIBLE);
              calculateInBackgroundNativeButtonsLayout.setVisibility(View.VISIBLE);
              statusRegisteredJavaListeners.setVisibility(View.VISIBLE);
              statusRegisteredNativeListeners.setVisibility(View.VISIBLE);
              result.setVisibility(View.GONE);

            } else {
              calculateInBackgroundJavaResultLayout.setVisibility(View.GONE);
              calculateInBackgroundNativeResultLayout.setVisibility(View.GONE);
              calculateInBackgroundJavaButtonsLayout.setVisibility(View.GONE);
              calculateInBackgroundNativeButtonsLayout.setVisibility(View.GONE);
              statusRegisteredJavaListeners.setVisibility(View.GONE);
              statusRegisteredNativeListeners.setVisibility(View.GONE);
              result.setVisibility(View.VISIBLE);
            }
          }

          @Override
          public void onNothingSelected(AdapterView<?> parentView) {
            registerJavaButton.setVisibility(View.GONE);
            unregisterJavaButton.setVisibility(View.GONE);
            registerNativeButton.setVisibility(View.GONE);
            unregisterNativeButton.setVisibility(View.GONE);
          }
        });
    submitButton.setOnClickListener(
        v -> {
          String x1 = inputX1.getText().toString();
          String y1 = inputY1.getText().toString();
          String z1 = inputZ1.getText().toString();
          String x2 = inputX2.getText().toString();
          String y2 = inputY2.getText().toString();
          String z2 = inputZ2.getText().toString();
          try {
            executeBuiltinVariablesMethod(
                spinner.getSelectedItemPosition(), x1, y1, z1, x2, y2, z2);
          } catch (NumberFormatException e) {
            result.setText(e.getMessage());
          }

          // hide virtual keyboard
          InputMethodManager imm =
              (InputMethodManager) getContext().getSystemService(INPUT_METHOD_SERVICE);
          imm.hideSoftInputFromWindow(result.getWindowToken(), 0);
        });

    registerJavaButton.setOnClickListener(
        v -> {
          notifier.registerListener(javaListener);
          statusRegisteredJavaListeners.setText(R.string.java_listener_registered);
          registerJavaButton.setEnabled(false);
          unregisterJavaButton.setEnabled(true);
        });

    registerNativeButton.setOnClickListener(
        v -> {
          notifier.registerListener(nativeListener);
          statusRegisteredNativeListeners.setText(R.string.native_listener_registered);
          registerNativeButton.setEnabled(false);
          unregisterNativeButton.setEnabled(true);
        });

    unregisterJavaButton.setOnClickListener(
        v -> {
          notifier.unregisterListener(javaListener);
          statusRegisteredJavaListeners.setText(R.string.java_listener_not_registered);
          registerJavaButton.setEnabled(true);
          unregisterJavaButton.setEnabled(false);
        });

    unregisterNativeButton.setOnClickListener(
        v -> {
          notifier.unregisterListener(nativeListener);
          statusRegisteredNativeListeners.setText(R.string.native_listener_not_registered);
          registerNativeButton.setEnabled(true);
          unregisterNativeButton.setEnabled(false);
        });
  }

  private void executeBuiltinVariablesMethod(
      final int selectedItemPosition,
      final String x1,
      final String y1,
      final String z1,
      final String x2,
      final String y2,
      final String z2) {
    START_POSITION.x = Float.parseFloat(x1);
    START_POSITION.y = Float.parseFloat(y1);
    START_POSITION.z = Float.parseFloat(z1);
    END_POSITION.x = Float.parseFloat(x2);
    END_POSITION.y = Float.parseFloat(y2);
    END_POSITION.z = Float.parseFloat(z2);

    result.setText("");
    java_listener_result.setText("");
    native_listener_result.setText("");

    switch (selectedItemPosition) {
      case JAVA_LISTENER_NATIVE_METHOD:
        notifier.calculate(START_POSITION, END_POSITION, javaListener);
        break;
      case NATIVE_LISTENER_NATIVE_METHOD:
        HelloWorldStaticLogger.clearLog();
        notifier.calculate(START_POSITION, END_POSITION, nativeListener);
        setResultFromLog(result);
        break;
      case LISTENERS_IN_BACKGROUND:
        HelloWorldStaticLogger.clearLog();
        notifier.calculateInBackground(START_POSITION, END_POSITION);
        setResultFromLog(native_listener_result);
        break;
    }
  }

  private void setResultFromLog(TextView native_listener_result) {
    String log = HelloWorldStaticLogger.getLog();
    if (log.contains(CALLED_WITH_RESULT)) {
      String value = log.split(CALLED_WITH_RESULT)[1]; // trim before CALLED_WITH_RESULT
      value = value.split("\n")[0]; // trim after new line
      native_listener_result.setText(value);
    }
  }
}
