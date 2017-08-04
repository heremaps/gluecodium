package com.example.here.hello.activity;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
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

public class TabFragmentPlainOldData extends Fragment {

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

    Button builtinButton = (Button) rootView.findViewById(R.id.plain_old_data_submit_button);
    builtinButton.setOnClickListener(new View.OnClickListener() {
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

        result.setText(String.valueOf(outputSyncResult.numberOfChanges));
        break;
      case 1:
        HelloWorldPlainDataStructures.IdentifiableSyncResult identifiableSyncResult = new
            IdentifiableSyncResult();
        identifiableSyncResult.id = 42;
        identifiableSyncResult.syncResult = syncResult;

        HelloWorldPlainDataStructures.IdentifiableSyncResult outputIdentifiableSyncResult =
            HelloWorldPlainDataStructures.methodWithNestedType(identifiableSyncResult);

        result.setText(String.valueOf(outputIdentifiableSyncResult.syncResult.numberOfChanges));
        break;
    }
  }
}
