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
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.example.here.hello.R;
import com.example.here.hello.utils.InputMethodHelper;
import com.here.android.hello.HelloWorldTypedefs;
import java.util.Locale;

public final class TypeDefFragment extends Fragment {
  private static final String METHOD_DETAILS_TEXT =
      "%1$s:\n\n"
          + "struct SomeStruct { String text }\n"
          + "typedef RenamedStruct is SomeStruct\n"
          + "typedef RenamedTwiceStruct is RenamedStruct\n\n"
          + "method methodWithTypeDef {\n"
          + "\t\tin { RenamedTwiceStruct input }\n"
          + "\t\tout { RenamedTwiceStruct output }\n"
          + "}";

  private Button submitButton;
  private TextView result;
  private EditText input;
  private TextView description;
  private TextView methodDetails;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_typedef, container, false);
    description = rootView.findViewById(R.id.typedef_description);
    input = rootView.findViewById(R.id.typedef_edit);
    result = rootView.findViewById(R.id.typedef_result);
    submitButton = rootView.findViewById(R.id.typedef_submit_button);
    methodDetails = rootView.findViewById(R.id.typedef_method_details);
    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);
    methodDetails.setText(
        String.format(
            Locale.getDefault(),
            METHOD_DETAILS_TEXT,
            getResources().getString(R.string.typedef_method_details)));
    description.setText(R.string.typedef_method_description);
    submitButton.setOnClickListener(
        v -> {
          HelloWorldTypedefs.SomeStruct inputStruct =
              new HelloWorldTypedefs.SomeStruct(input.getText().toString());

          HelloWorldTypedefs.SomeStruct outputStruct =
              HelloWorldTypedefs.methodWithTypeDef(inputStruct);

          result.setText(outputStruct.text);

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
}
