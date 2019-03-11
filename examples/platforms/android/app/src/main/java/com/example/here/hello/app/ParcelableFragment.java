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

import android.content.res.Configuration;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.Orientation;
import com.here.android.hello.State;

public class ParcelableFragment extends Fragment {
  private TextView description;
  private TextView result;
  private State currentState;
  private State previousState;

  public ParcelableFragment() {}

  @Override
  public View onCreateView(
      LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_parcelable, container, false);
    description = rootView.findViewById(R.id.parcelable_description);
    result = rootView.findViewById(R.id.parcelable_result);

    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);

    updatePreviousAndCurrentStates(view, savedInstanceState);
  }

  @Override
  public void onSaveInstanceState(Bundle outState) {
    outState.putParcelable("state", currentState);
  }

  private void updatePreviousAndCurrentStates(View view, Bundle savedInstanceState) {
    readPreviousState(savedInstanceState);

    // Reading current state must be delayed until view is ready
    view.post(
        new Runnable() {
          @Override
          public void run() {
            readCurrentState(view);
            result.setText(getResult());
          }
        });
  }

  private String getResult() {
    StringBuilder builder = new StringBuilder();

    if (previousState != null) {
      builder.append("previous state:\n" + toString(previousState) + "\n\n");
    }

    builder.append("current state:\n" + toString(currentState) + "\n");

    return builder.toString();
  }

  private String toString(State state) {
    StringBuilder builder = new StringBuilder();

    builder.append("dimension = (" + state.dimension.width + ", " + state.dimension.height + ")");
    builder.append(" and orientation = " + state.orientation.name());

    return builder.toString();
  }

  private void readPreviousState(Bundle savedInstanceState) {
    if (savedInstanceState != null) {
      previousState = savedInstanceState.getParcelable("state");
    }
  }

  private void readCurrentState(View view) {
    if (currentState == null) {
      currentState = new State();
    }

    currentState.dimension.width = view.getWidth();
    currentState.dimension.height = view.getHeight();

    int currentOrientation = getResources().getConfiguration().orientation;
    if (currentOrientation == Configuration.ORIENTATION_LANDSCAPE) {
      currentState.orientation = Orientation.LANDSCAPE;
    } else {
      currentState.orientation = Orientation.PORTRAIT;
    }
  }
}
