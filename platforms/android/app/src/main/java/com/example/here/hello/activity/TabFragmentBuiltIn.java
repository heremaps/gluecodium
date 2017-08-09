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
import com.here.android.hello.HelloWorldBuiltinTypes;

public class TabFragmentBuiltIn extends Fragment {
  private static final byte BYTE_TEST_VALUE = 10;
  private EditText result;
  private EditText input;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {

    final View rootView = inflater.inflate(R.layout.fragment_tab_builtin, container, false);
    descriptionsText = getResources().getStringArray(R.array.builtin_methods_description);
    description = (TextView) rootView.findViewById(R.id.builtin_description);
    input = (EditText) rootView.findViewById(R.id.builtin_edit);
    result = (EditText) rootView.findViewById(R.id.builtin_result);

    spinner = (Spinner) rootView.findViewById(R.id.builtin_spinner);
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

    Button builtinButton = (Button) rootView.findViewById(R.id.builtin_submit_button);
    builtinButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        String parameterText = input.getText().toString();
        try {
          executeBuiltinVariablesMethod(spinner.getSelectedItemPosition(), parameterText);
        } catch (NumberFormatException e) {
          result.setText(e.getMessage());
        }
      }
    });

    return rootView;
  }

  private void executeBuiltinVariablesMethod(int selectedItemPosition, String parameterText) {
    switch (selectedItemPosition) {
      case 0:
        byte byteResult = HelloWorldBuiltinTypes.methodWithInt8(Byte.decode(parameterText));
        result.setText(String.valueOf(byteResult));
        break;
      case 1:
        long resultUInt8 = HelloWorldBuiltinTypes.methodWithUInt8(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt8));
        break;
      case 2:
        short shortResult = HelloWorldBuiltinTypes.methodWithInt16(Short.valueOf(parameterText));
        result.setText(String.valueOf(shortResult));
        break;
      case 3:
        long resultUInt16 = HelloWorldBuiltinTypes.methodWithUInt16(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt16));
        break;
      case 4:
        int intResult = HelloWorldBuiltinTypes.methodWithInt32(Integer.valueOf(parameterText));
        result.setText(String.valueOf(intResult));
        break;
      case 5:
        long resultUInt32 = HelloWorldBuiltinTypes.methodWithUInt32(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt32));
        break;
      case 6:
        long resultInt64 = HelloWorldBuiltinTypes.methodWithInt64(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultInt64));
        break;
      case 7:
        long resultUInt64 = HelloWorldBuiltinTypes.methodWithUInt64(Long.valueOf(parameterText));
        result.setText(String.valueOf(resultUInt64));
        break;
      case 8:
        if (!parameterText.equalsIgnoreCase("true") && !parameterText.equalsIgnoreCase("false")) {
          throw new NumberFormatException("Invalid bool: only 'true' or 'false' are accepted.");
        }

        boolean booleanResult = HelloWorldBuiltinTypes.methodWithBoolean(
            Boolean.valueOf(parameterText));
        result.setText(String.valueOf(booleanResult));
        break;
      case 9:
        float floatResult = HelloWorldBuiltinTypes.methodWithFloat(Float.valueOf(parameterText));
        result.setText(String.valueOf(floatResult));
        break;
      case 10:
        double doubleResult = HelloWorldBuiltinTypes.methodWithDouble(
            Double.valueOf(parameterText));
        result.setText(String.valueOf(doubleResult));
        break;
      case 11:
        byte[] byteArrayResult = HelloWorldBuiltinTypes.methodWithByteBuffer(
            parameterText.getBytes());
        result.setText(new String(byteArrayResult));
        break;
      case 12:
        double multipleParamResult = executeMultipleParameterMethod(parameterText);
        result.setText(String.valueOf(multipleParamResult));
        break;
    }
  }

  private double executeMultipleParameterMethod(String parameterText) {
    String[] parameters = parameterText.split(",", 2);
    float floatParameter = Float.valueOf(parameters[0]);
    byte byteParameter = parameters.length > 1 ? Byte.valueOf(parameters[1]) : BYTE_TEST_VALUE;
    return HelloWorldBuiltinTypes.methodWithFloatAndInteger(floatParameter, byteParameter);
  }
}
