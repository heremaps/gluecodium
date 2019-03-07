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
import com.here.android.hello.HelloWorld;

public final class BaseFragment extends Fragment {
  private TextView result;
  private Button submitButton;
  private EditText input;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_base, container, false);
    input = rootView.findViewById(R.id.input);
    result = rootView.findViewById(R.id.result_text);
    submitButton = rootView.findViewById(R.id.greet);
    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);
    submitButton.setOnClickListener(
        v -> {
          String username = input.getText().toString();
          String userGreeting = HelloWorld.helloWorldMethod(username);

          result.setText(userGreeting);

          // hide virtual keyboard
          InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
        });
    input.setOnEditorActionListener(
        (v, actionId, event) -> {
          if (actionId == EditorInfo.IME_ACTION_DONE) {
            submitButton.performClick();
            return true;
          }
          return false;
        });
  }
}
