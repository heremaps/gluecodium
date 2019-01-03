/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
import android.view.inputmethod.EditorInfo;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.example.here.hello.utils.InputMethodHelper;
import com.here.android.hello.HelloWorldBuiltinTypes;

public final class BuiltInFragment extends Fragment {
  private static final byte BYTE_TEST_VALUE = 10;

  private Button submitButton;
  private TextView result;
  private EditText input;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_builtin, container, false);
    descriptionsText = getResources().getStringArray(R.array.builtin_methods_description);
    description = rootView.findViewById(R.id.builtin_description);
    input = rootView.findViewById(R.id.builtin_edit);
    result = rootView.findViewById(R.id.builtin_result);
    spinner = rootView.findViewById(R.id.builtin_spinner);
    submitButton = rootView.findViewById(R.id.builtin_submit_button);
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
            description.setText(descriptionsText[position]);
          }

          @Override
          public void onNothingSelected(AdapterView<?> parentView) {
            description.setText("");
          }
        });
    submitButton.setOnClickListener(
        v -> {
          String parameterText = input.getText().toString();
          try {
            executeBuiltinVariablesMethod(spinner.getSelectedItemPosition(), parameterText);
          } catch (NumberFormatException e) {
            result.setText(e.getMessage());
          }

          // hide virtual keyboard
          InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
        });
    input.setOnEditorActionListener(
        (textView, actionId, event) -> {
          if (actionId == EditorInfo.IME_ACTION_DONE) {
            submitButton.performClick();
            return true;
          }
          return false;
        });
  }

  private void executeBuiltinVariablesMethod(
      final int selectedItemPosition, final String parameterText) {
    switch (selectedItemPosition) {
      case 0:
        byte byteResult = HelloWorldBuiltinTypes.methodWithInt8(Byte.decode(parameterText));
        result.setText(String.valueOf(byteResult));
        break;
      case 1:
        short resultUInt8 = HelloWorldBuiltinTypes.methodWithUint8(Short.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt8));
        break;
      case 2:
        short shortResult = HelloWorldBuiltinTypes.methodWithInt16(Short.valueOf(parameterText));
        result.setText(String.valueOf(shortResult));
        break;
      case 3:
        int resultUInt16 = HelloWorldBuiltinTypes.methodWithUint16(Integer.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt16));
        break;
      case 4:
        int intResult = HelloWorldBuiltinTypes.methodWithInt32(Integer.valueOf(parameterText));
        result.setText(String.valueOf(intResult));
        break;
      case 5:
        long resultUInt32 = HelloWorldBuiltinTypes.methodWithUint32(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt32));
        break;
      case 6:
        long resultInt64 = HelloWorldBuiltinTypes.methodWithInt64(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultInt64));
        break;
      case 7:
        long resultUInt64 = HelloWorldBuiltinTypes.methodWithUint64(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt64));
        break;
      case 8:
        if (!parameterText.equalsIgnoreCase("true") && !parameterText.equalsIgnoreCase("false")) {
          throw new NumberFormatException("Invalid bool: only 'true' or 'false' are accepted.");
        }

        boolean booleanResult =
            HelloWorldBuiltinTypes.methodWithBoolean(Boolean.valueOf(parameterText));
        result.setText(String.valueOf(booleanResult));
        break;
      case 9:
        float floatResult = HelloWorldBuiltinTypes.methodWithFloat(Float.valueOf(parameterText));
        result.setText(String.valueOf(floatResult));
        break;
      case 10:
        double doubleResult =
            HelloWorldBuiltinTypes.methodWithDouble(Double.valueOf(parameterText));
        result.setText(String.valueOf(doubleResult));
        break;
      case 11:
        byte[] byteArrayResult =
            HelloWorldBuiltinTypes.methodWithByteBuffer(parameterText.getBytes());
        result.setText(new String(byteArrayResult));
        break;
      case 12:
        double multipleParamResult = executeMultipleParameterMethod(parameterText);
        result.setText(String.valueOf(multipleParamResult));
        break;
    }
  }

  private double executeMultipleParameterMethod(final String parameterText) {
    String[] parameters = parameterText.split(",", 2);
    float floatParameter = Float.valueOf(parameters[0]);
    byte byteParameter = parameters.length > 1 ? Byte.valueOf(parameters[1]) : BYTE_TEST_VALUE;
    return HelloWorldBuiltinTypes.methodWithFloatAndInteger(floatParameter, byteParameter);
  }
}
