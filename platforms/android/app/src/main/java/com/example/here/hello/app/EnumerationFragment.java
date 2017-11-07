package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.here.hello.R;
import com.here.android.hello.HelloWorld;
import com.here.android.hello.HelloWorldBuiltinTypes;
import com.here.android.hello.HelloWorldEnums;

import static android.content.Context.INPUT_METHOD_SERVICE;

public final class EnumerationFragment extends Fragment {
  private TextView result;
  private Button submitButton;
  private Spinner spinner;

  private TextView description;

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
                           Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_enum, container, false);
    result = rootView.findViewById(R.id.enum_result_text);
    submitButton = rootView.findViewById(R.id.enum_submit);
    description = rootView.findViewById(R.id.enum_description);
    spinner = rootView.findViewById(R.id.enum_spinner);

    return rootView;
  }

  @Override
  public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);

    description.setText(getResources().getString(R.string.enumeration_methods_description));

    submitButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {

        executeEnumerationMethod(spinner.getSelectedItem().toString());
      }
    });
  }

  private void executeEnumerationMethod(String errorName) {
    switch (errorName) {
      case "ERROR_NONE":
        HelloWorldEnums.InternalError resultValue1 = HelloWorldEnums.methodWithEnumeration(HelloWorldEnums.InternalError.ERROR_NONE);
        result.setText(String.valueOf(resultValue1));
        break;
      case "ERROR_FATAL":
        HelloWorldEnums.InternalError resultValue2 = HelloWorldEnums.methodWithEnumeration(HelloWorldEnums.InternalError.ERROR_FATAL);
        result.setText(String.valueOf(resultValue2));
        break;
      default:
        result.setText("Invalid input argument");
        break;
    }
  }
}
