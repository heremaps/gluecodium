package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.here.hello.R;
import com.here.android.hello.HelloWorldArrays;
import com.here.android.hello.HelloWorldArrays.ExampleStruct;

import java.util.Arrays;
import java.util.List;

import static android.content.Context.INPUT_METHOD_SERVICE;

public final class ArraysFragment extends Fragment {

  private Button submitButton;
  private EditText input1;
  private EditText input2;
  private EditText input3;
  private EditText input4;
  private TextView result;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  @Override
  public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container,
                           Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_arrays, container, false);
    input1 = rootView.findViewById(R.id.arrays_edit_1);
    input2 = rootView.findViewById(R.id.arrays_edit_2);
    input3 = rootView.findViewById(R.id.arrays_edit_3);
    input4 = rootView.findViewById(R.id.arrays_edit_4);
    result = rootView.findViewById(R.id.arrays_result);
    spinner = rootView.findViewById(R.id.arrays_spinner);
    submitButton = rootView.findViewById(R.id.arrays_submit_button);
    descriptionsText = getResources().getStringArray(R.array.array_methods_description);
    description = rootView.findViewById(R.id.arrays_description);
    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);
    spinner.setOnItemSelectedListener(new OnItemSelectedListener() {
      @Override
      public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position,
          long id) {
        description.setText(descriptionsText[position]);
        result.setText("");
        input1.setText("");
        input2.setText("");
        input3.setText("");
        input4.setText("");
      }

      @Override
      public void onNothingSelected(AdapterView<?> parentView) {
        description.setText("");
        result.setText("");
        input1.setText("");
        input2.setText("");
        input3.setText("");
        input4.setText("");
      }
    });
    submitButton.setOnClickListener((View v) -> {
      String inputText1 = input1.getText().toString();
      String inputText2 = input2.getText().toString();
      String inputText3 = input3.getText().toString();
      String inputText4 = input4.getText().toString();

      try {
        executeArrayMethod(spinner.getSelectedItemPosition(), inputText1, inputText2, inputText3,
            inputText4);
      } catch (NumberFormatException e) {
        String exceptionMessage = R.string.number_format_exception + " " + e.getMessage();
        result.setText(exceptionMessage);
      }

      // hide virtual keyboard
      InputMethodManager imm = (InputMethodManager) getContext()
          .getSystemService(INPUT_METHOD_SERVICE);
      imm.hideSoftInputFromWindow(result.getWindowToken(), 0);
    });
  }

  private void executeArrayMethod(final int selectedItemPosition, final String input1,
      final String input2, final String input3, final String input4) {
    switch (selectedItemPosition) {
      case 0:
        List<String> stringList = Arrays.asList(input1, input2, input3, input4);
        result.setText(HelloWorldArrays.methodWithArray(stringList).toString());
        break;
      case 1:
        List<Long> longList = Arrays.asList(
            Long.parseLong(input1),
            Long.parseLong(input2),
            Long.parseLong(input3),
            Long.parseLong(input4));
        result.setText(HelloWorldArrays.methodWithSimpleArray(longList).toString());
        break;
      case 2:
        List<Long> longList2 = Arrays.asList(
            Long.parseLong(input1),
            Long.parseLong(input2),
            Long.parseLong(input3),
            Long.parseLong(input4));
        result.setText(HelloWorldArrays.methodWithArrayInline(longList2).toString());
        break;
      case 3:
        List<ExampleStruct> exampleStructList = Arrays.asList(
            createExampleStruct(input1),
            createExampleStruct(input2),
            createExampleStruct(input3),
            createExampleStruct(input4));
        List<ExampleStruct> resultList = HelloWorldArrays.methodWithStructArray(exampleStructList);
        result.setText(formatExampleStructResult(resultList));
        break;
      case 4:
        List<List<Long>> nestedLongList = Arrays.asList(
            createListOfLongs(input1),
            createListOfLongs(input2),
            createListOfLongs(input3),
            createListOfLongs(input4));
        List<List<Long>> resultList2 = HelloWorldArrays.methodWithNestedArraysInline(nestedLongList);
        String resultText = "INPUT:\n"
            + formatNestedLongListResult(nestedLongList)
            + "\n\n\nOUTPUT:\n"
            + formatNestedLongListResult(resultList2);
        result.setText(resultText);
        break;
    }
  }

  private ExampleStruct createExampleStruct(final String input) throws NumberFormatException {
    ExampleStruct exampleStruct = new ExampleStruct();
    exampleStruct.value = Double.parseDouble(input);
    return exampleStruct;
  }

  private List<Long> createListOfLongs(final String input) throws NumberFormatException {
    Long value = Long.parseLong(input);
    return Arrays.asList(value, value + 10, value + 100, value + 1000);
  }

  private String formatExampleStructResult(List<ExampleStruct> exampleStructList) {
    StringBuilder resultText = new StringBuilder("[");
    for (ExampleStruct exampleStruct : exampleStructList) {
      resultText.append(" ExampleStruct.value = ").append(exampleStruct.value).append(",\n");
    }
    resultText.setLength(resultText.length() - 2);
    resultText.append(" ]");

    return resultText.toString();
  }

  private String formatNestedLongListResult(List<List<Long>> nestedLongList) {
    StringBuilder resultText = new StringBuilder("[");
    for (List<Long> longList : nestedLongList) {
      resultText.append(longList.toString()).append(",\n");
    }
    resultText.setLength(resultText.length() - 2);
    resultText.append("]");

    return resultText.toString();
  }
}
