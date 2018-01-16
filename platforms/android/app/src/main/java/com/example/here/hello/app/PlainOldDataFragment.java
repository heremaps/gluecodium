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
import com.here.android.hello.HelloWorldPlainDataStructures;
import com.here.android.hello.HelloWorldPlainDataStructures.IdentifiableSyncResult;
import com.here.android.hello.HelloWorldPlainDataStructures.NumericSyncResult;
import com.here.android.hello.HelloWorldPlainDataStructures.SyncResult;
import java.util.Locale;

public final class PlainOldDataFragment extends Fragment {
  private static final String SYNC_RESULT_TEXT =
      "SyncResult {%n" + "    long timeStamp = %d%n" + "    long numberOfUsages = %d%n" + "}";
  private static final String ID_SYNC_RESULT_TEXT =
      "IdSyncResult {%n"
          + "    int id = %d%n"
          + "    SyncResult {%n"
          + "        long timeStamp = %d%n"
          + "        long numberOfUsages = %d%n"
          + "    }%n"
          + "}";
  private static final String NUMERIC_SYNC_RESULT_TEXT =
      "NumericSyncResult {%n"
          + "    long timeStamp = %d%n"
          + "    long numberOfUsages = %d%n"
          + "    long resultInChildStruct = %d%n"
          + "}";

  private Button submitButton;
  private TextView result;
  private EditText input;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  @Override
  public View onCreateView(
      @NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_plain_old_data, container, false);
    descriptionsText = getResources().getStringArray(R.array.plain_old_data_methods_description);
    description = rootView.findViewById(R.id.plain_old_data_description);
    input = rootView.findViewById(R.id.plain_old_data_edit);
    result = rootView.findViewById(R.id.plain_old_data_result);
    spinner = rootView.findViewById(R.id.plain_old_data_spinner);
    submitButton = rootView.findViewById(R.id.plain_old_data_submit_button);
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
          try {
            Long parameterValue = Long.valueOf(input.getText().toString());
            executeBuiltinVariablesMethod(spinner.getSelectedItemPosition(), parameterValue);
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

            // Since description and result text are too big, hide keyboard on click to show results
            InputMethodHelper.hideSoftKeyboard(getContext(), textView.getWindowToken());
            return true;
          }
          return false;
        });
  }

  private void executeBuiltinVariablesMethod(
      final int selectedItemPosition, final Long parameterValue) {
    SyncResult syncResult = new SyncResult();
    syncResult.lastUpdatedTimeStamp = 42L;
    syncResult.numberOfChanges = parameterValue;

    switch (selectedItemPosition) {
      case 0:
        SyncResult outputSyncResult =
            HelloWorldPlainDataStructures.methodWithNonNestedType(syncResult);

        result.setText(
            String.format(
                Locale.getDefault(),
                SYNC_RESULT_TEXT,
                outputSyncResult.lastUpdatedTimeStamp,
                outputSyncResult.numberOfChanges));
        break;
      case 1:
        IdentifiableSyncResult identifiableSyncResult = new IdentifiableSyncResult();
        identifiableSyncResult.id = 99;
        identifiableSyncResult.syncResult = syncResult;

        IdentifiableSyncResult outputIdentifiableSyncResult =
            HelloWorldPlainDataStructures.methodWithNestedType(identifiableSyncResult);

        String resultText =
            String.format(
                Locale.getDefault(),
                ID_SYNC_RESULT_TEXT,
                outputIdentifiableSyncResult.id,
                outputIdentifiableSyncResult.syncResult.lastUpdatedTimeStamp,
                outputIdentifiableSyncResult.syncResult.numberOfChanges);
        result.setText(resultText);
        break;
      case 2:
        NumericSyncResult numericSyncResult = new NumericSyncResult();
        numericSyncResult.lastUpdatedTimeStamp = 42L;
        numericSyncResult.numberOfChanges = parameterValue;
        numericSyncResult.resultInChildStruct = 99;

        NumericSyncResult outputNumericSyncResult =
            HelloWorldPlainDataStructures.methodWithInheritedStruct(numericSyncResult);

        String numericSyncResultText =
            String.format(
                Locale.getDefault(),
                NUMERIC_SYNC_RESULT_TEXT,
                outputNumericSyncResult.lastUpdatedTimeStamp,
                outputNumericSyncResult.numberOfChanges,
                outputNumericSyncResult.resultInChildStruct);
        result.setText(numericSyncResultText);
        break;
    }
  }
}
