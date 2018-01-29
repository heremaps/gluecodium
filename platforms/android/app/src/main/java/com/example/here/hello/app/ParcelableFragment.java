/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
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
