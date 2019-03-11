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
