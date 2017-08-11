package com.example.here.hello.activity;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldPlainDataStructures;
import com.here.android.hello.HelloWorldPlainDataStructures.IdentifiableSyncResult;
import com.here.android.hello.HelloWorldPlainDataStructures.SyncResult;
import java.util.Locale;

public class TabFragmentPlainOldData extends Fragment {

  static final String syncResultText = "SyncResult {%n"
      + "    long timeStamp = %d%n"
      + "    long numberOfUsages = %d%n"
      + "}";
  static final String idSyncResultText = "IdSyncResult {%n"
      + "    int id = %d%n"
      + "    SyncResult {%n"
      + "        long timeStamp = %d%n"
      + "        long numberOfUsages = %d%n"
      + "    }%n"
      + "}";
  private Button submitButton;
  private EditText result;
  private EditText input;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {
    final View rootView = inflater.inflate(R.layout.fragment_tab_plain_old_data, container, false);

    descriptionsText = getResources().getStringArray(R.array.plain_old_data_methods_description);
    description = (TextView) rootView.findViewById(R.id.plain_old_data_description);
    input = (EditText) rootView.findViewById(R.id.plain_old_data_edit);
    result = (EditText) rootView.findViewById(R.id.plain_old_data_result);

    spinner = (Spinner) rootView.findViewById(R.id.plain_old_data_spinner);
    spinner.setOnItemSelectedListener(new OnItemSelectedListener() {
      @Override
      public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position,
          long id) {
        description.setText(descriptionsText[position]);
      }

      @Override
      public void onNothingSelected(AdapterView<?> parentView) {
        description.setText("");
      }
    });

    submitButton = (Button) rootView.findViewById(R.id.plain_old_data_submit_button);
    submitButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        try {
          Long parameterValue = Long.valueOf(input.getText().toString());
          executeBuiltinVariablesMethod(spinner.getSelectedItemPosition(), parameterValue);
        } catch (NumberFormatException e) {
          result.setText(e.getMessage());
        }
      }
    });

    input.setOnEditorActionListener(new EditText.OnEditorActionListener() {
      @Override
      public boolean onEditorAction(TextView textView, int actionId, KeyEvent event) {
        if (actionId == EditorInfo.IME_ACTION_DONE) {
          submitButton.performClick();

          // Since description and result text are too big, hide keyboard on click to show results
          InputMethodManager inputMethodManager = (InputMethodManager) textView.getContext()
              .getSystemService(Context.INPUT_METHOD_SERVICE);
          inputMethodManager.hideSoftInputFromWindow(textView.getWindowToken(), 0);
          return true;
        }
        return false;
      }
    });

    return rootView;
  }

  private void executeBuiltinVariablesMethod(int selectedItemPosition, Long parameterValue) {
    HelloWorldPlainDataStructures.SyncResult syncResult = new SyncResult();
    syncResult.lastUpdatedTimeStamp = 42L;
    syncResult.numberOfChanges = parameterValue;

    switch (selectedItemPosition) {
      case 0:
        HelloWorldPlainDataStructures.SyncResult outputSyncResult = HelloWorldPlainDataStructures
            .methodWithNonNestedType(syncResult);

        result.setText(String.format(Locale.getDefault(), syncResultText,
            outputSyncResult.lastUpdatedTimeStamp,
            outputSyncResult.numberOfChanges));
        break;
      case 1:
        HelloWorldPlainDataStructures.IdentifiableSyncResult identifiableSyncResult = new
            IdentifiableSyncResult();
        identifiableSyncResult.id = 99;
        identifiableSyncResult.syncResult = syncResult;

        HelloWorldPlainDataStructures.IdentifiableSyncResult outputIdentifiableSyncResult =
            HelloWorldPlainDataStructures.methodWithNestedType(identifiableSyncResult);

        String resultText = String.format(Locale.getDefault(), idSyncResultText,
            outputIdentifiableSyncResult.id,
            outputIdentifiableSyncResult.syncResult.lastUpdatedTimeStamp,
            outputIdentifiableSyncResult.syncResult.numberOfChanges);
        result.setText(resultText);
        break;
    }
  }
}
