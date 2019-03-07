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
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldEnums;

public final class EnumerationFragment extends Fragment {
  private TextView result;
  private Button submitButton;
  private Spinner spinner;

  private TextView description;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_enum, container, false);
    result = rootView.findViewById(R.id.enum_result_text);
    submitButton = rootView.findViewById(R.id.enum_submit);
    description = rootView.findViewById(R.id.enum_description);
    spinner = rootView.findViewById(R.id.enum_spinner);

    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);

    description.setText(getResources().getString(R.string.enumeration_methods_description));
    submitButton.setOnClickListener(
        v -> executeEnumerationMethod(spinner.getSelectedItem().toString()));
  }

  private void executeEnumerationMethod(String errorName) {
    switch (errorName) {
      case "ERROR_NONE":
        HelloWorldEnums.InternalError resultValue1 =
            HelloWorldEnums.methodWithEnumeration(HelloWorldEnums.InternalError.ERROR_NONE);
        result.setText(String.valueOf(resultValue1));
        break;
      case "ERROR_FATAL":
        HelloWorldEnums.InternalError resultValue2 =
            HelloWorldEnums.methodWithEnumeration(HelloWorldEnums.InternalError.ERROR_FATAL);
        result.setText(String.valueOf(resultValue2));
        break;
      default:
        result.setText(R.string.invalid_input);
        break;
    }
  }
}
