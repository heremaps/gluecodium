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
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldArrays;
import com.here.android.hello.HelloWorldArrays.ExampleStruct;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class ArraysFragment extends Fragment {

  private Button submitButton;
  private EditText input;
  private TextView result;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_arrays, container, false);
    input = rootView.findViewById(R.id.arrays_edit);
    result = rootView.findViewById(R.id.arrays_result);
    spinner = rootView.findViewById(R.id.arrays_spinner);
    submitButton = rootView.findViewById(R.id.arrays_submit_button);
    descriptionsText = getResources().getStringArray(R.array.array_methods_description);
    description = rootView.findViewById(R.id.arrays_description);
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
            String methodDescription =
                descriptionsText[position]
                    + "\n\n"
                    + getResources().getString(R.string.fragment_arrays_usage);
            description.setText(methodDescription);
            result.setText("");
            input.setText("");
          }

          @Override
          public void onNothingSelected(AdapterView<?> parentView) {
            description.setText("");
            result.setText("");
            input.setText("");
          }
        });
    submitButton.setOnClickListener(
        (View v) -> {
          String inputText = input.getText().toString();

          try {
            executeArrayMethod(spinner.getSelectedItemPosition(), inputText.split(","));
          } catch (NumberFormatException e) {
            String exceptionMessage =
                getResources().getString(R.string.number_format_exception) + "\n" + e.getMessage();
            result.setText(exceptionMessage);
          }

          // hide virtual keyboard
          InputMethodManager inputMethodManager =
              (InputMethodManager) getContext().getSystemService(INPUT_METHOD_SERVICE);
          inputMethodManager.hideSoftInputFromWindow(result.getWindowToken(), 0);
        });
  }

  private void executeArrayMethod(final int selectedItemPosition, final String[] parameters) {
    List<String> stringList = Arrays.asList(parameters);
    switch (selectedItemPosition) {
      case 0:
        result.setText(HelloWorldArrays.methodWithArray(stringList).toString());
        break;
      case 1:
        List<Long> longList = new ArrayList<>();
        for (String string : stringList) {
          if (!string.isEmpty()) {
            longList.add(Long.valueOf(string));
          }
        }

        result.setText(HelloWorldArrays.methodWithSimpleArray(longList).toString());
        break;
      case 2:
        List<Long> longList2 = new ArrayList<>();
        for (String string : stringList) {
          if (!string.isEmpty()) {
            longList2.add(Long.valueOf(string));
          }
        }

        result.setText(HelloWorldArrays.methodWithArrayInline(longList2).toString());
        break;
      case 3:
        List<ExampleStruct> exampleStructList = new ArrayList<>();
        for (String string : stringList) {
          if (!string.isEmpty()) {
            exampleStructList.add(createExampleStruct(string));
          }
        }

        List<ExampleStruct> resultList = HelloWorldArrays.methodWithStructArray(exampleStructList);
        result.setText(formatExampleStructResult(resultList));
        break;
      case 4:
        List<List<Long>> nestedLongList = new ArrayList<>();
        for (String string : stringList) {
          if (!string.isEmpty()) {
            nestedLongList.add(createListOfLongs(string));
          }
        }

        List<List<Long>> resultList2 =
            HelloWorldArrays.methodWithNestedArraysInline(nestedLongList);
        String resultText =
            "INPUT:\n"
                + formatNestedLongListResult(nestedLongList)
                + "\n\n\nOUTPUT:\n"
                + formatNestedLongListResult(resultList2);
        result.setText(resultText);
        break;
    }
  }

  private ExampleStruct createExampleStruct(final String input) throws NumberFormatException {
    ExampleStruct exampleStruct = new ExampleStruct();
    exampleStruct.value = Double.parseDouble(input);
    return exampleStruct;
  }

  private List<Long> createListOfLongs(final String input) throws NumberFormatException {
    Long value = Long.parseLong(input);
    return Arrays.asList(value, value + 10, value + 100, value + 1000);
  }

  private String formatExampleStructResult(List<ExampleStruct> exampleStructList) {
    StringBuilder resultText = new StringBuilder("[");
    for (ExampleStruct exampleStruct : exampleStructList) {
      resultText.append(" ExampleStruct.value = ").append(exampleStruct.value).append(",\n");
    }
    if (resultText.length() > 1) {
      resultText.setLength(resultText.length() - 2);
    }
    resultText.append(" ]");

    return resultText.toString();
  }

  private String formatNestedLongListResult(List<List<Long>> nestedLongList) {
    StringBuilder resultText = new StringBuilder("[");
    for (List<Long> longList : nestedLongList) {
      resultText.append(longList.toString()).append(",\n");
    }
    if (resultText.length() > 1) {
      resultText.setLength(resultText.length() - 2);
    }
    resultText.append("]");

    return resultText.toString();
  }
}
