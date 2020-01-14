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
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldEquatable.EquatableStruct;
import com.here.android.hello.HelloWorldEquatable.NestedEquatableStruct;
import java.util.Locale;

public class EquatableFragment extends Fragment {

  private static final String STRUCT_OUTPUT_FORMAT =
      "EquatableStruct {\n"
          + "    intField = %d\n"
          + "    stringField = \"%s\"\n"
          + "    structField = NestedEquatableStruct {\n"
          + "        stringField = \"%s\"\n"
          + "    }\n}";

  private final EquatableStruct referenceStruct =
      new EquatableStruct(42, "Foo", new NestedEquatableStruct("Bar"));

  @Override
  public View onCreateView(
      LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_equatable, container, false);

    TextView referenceStructLabel = rootView.findViewById(R.id.equatable_reference_struct);
    referenceStructLabel.setText(
        String.format(
            Locale.getDefault(),
            STRUCT_OUTPUT_FORMAT,
            referenceStruct.intField,
            referenceStruct.stringField,
            referenceStruct.structField.stringField));

    TextView referenceHashcodeLabel =
        rootView.findViewById(R.id.equatable_reference_hashcode_label);
    referenceHashcodeLabel.setText(
        getString(R.string.equatable_hashcode_label, referenceStruct.hashCode()));

    EditText entryInt = rootView.findViewById(R.id.equatable_entry_int);
    entryInt.requestFocus();
    EditText entryString = rootView.findViewById(R.id.equatable_entry_string);
    EditText entryNestedString = rootView.findViewById(R.id.equatable_entry_nested_string);

    Button processButton = rootView.findViewById(R.id.process_equatable_btn);
    processButton.setOnClickListener(
        (View v) -> {
          Integer intValue = Integer.valueOf(entryInt.getText().toString());
          String stringValue = entryString.getText().toString();
          String nestedStringValue = entryNestedString.getText().toString();
          EquatableStruct newStruct =
              new EquatableStruct(
                  intValue, stringValue, new NestedEquatableStruct(nestedStringValue));

          TextView newStructLabel = rootView.findViewById(R.id.equatable_new_struct);
          newStructLabel.setText(
              String.format(
                  Locale.getDefault(),
                  STRUCT_OUTPUT_FORMAT,
                  newStruct.intField,
                  newStruct.stringField,
                  newStruct.structField.stringField));

          TextView equalsLabel = rootView.findViewById(R.id.equatable_equals_label);
          equalsLabel.setText(
              getString(R.string.equatable_equals_label, newStruct.equals(referenceStruct)));

          TextView hashCodeLabel = rootView.findViewById(R.id.equatable_hashcode_label);
          hashCodeLabel.setText(getString(R.string.equatable_hashcode_label, newStruct.hashCode()));
        });

    return rootView;
  }
}
