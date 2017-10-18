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
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.here.hello.R;
import com.here.android.hello.HelloWorldAttributes;
import com.here.android.hello.HelloWorldFactory;

import java.util.Locale;

import static android.content.Context.INPUT_METHOD_SERVICE;

public final class AttributesFragment extends Fragment {
    private static final int GET_BUILTIN_TYPE_ATTRIBUTE = 0;
    private static final int SET_BUILTIN_TYPE_ATTRIBUTE = 1;
    private static final int GET_READ_ONLY_ATTRIBUTE = 2;
    private static final int GET_STRUCT_ATTRIBUTE = 3;
    private static final int SET_STRUCT_ATTRIBUTE = 4;

    private Button submitButton;
    private TextView result;
    private EditText input;
    private Spinner spinner;
    private TextView description;
    private String[] descriptionsText;
    private final HelloWorldAttributes helloWorldAttributes = HelloWorldFactory.createAttributes();

    private static final String EXAMPLE_STRUCT = "ExampleStruct {%n"
            + "    public double value = %f%n"
            + "}";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_attributes, container, false);
        descriptionsText = getResources().getStringArray(R.array.attributes_methods_description);
        description = rootView.findViewById(R.id.attributes_description);
        input = rootView.findViewById(R.id.attributes_edit);
        result = rootView.findViewById(R.id.attributes_result);
        spinner = rootView.findViewById(R.id.attributes_spinner);
        submitButton = rootView.findViewById(R.id.attributes_submit_button);
        return rootView;
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        spinner.setOnItemSelectedListener(new OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position,
                                       long id) {
                result.setText("");
                if (position == SET_BUILTIN_TYPE_ATTRIBUTE || position == SET_STRUCT_ATTRIBUTE) {
                    input.setVisibility(View.VISIBLE);
                } else {
                    input.setVisibility(View.GONE);
                }
                description.setText(descriptionsText[position]);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parentView) {
                description.setText("");
            }
        });
        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String parameterText = input.getText().toString();
                try {
                    executeBuiltinVariablesMethod(spinner.getSelectedItemPosition(), parameterText);
                } catch (NumberFormatException e) {
                    result.setText(e.getMessage());
                }

                // hide virtual keyboard
                InputMethodManager imm = (InputMethodManager) getContext().getSystemService(INPUT_METHOD_SERVICE);
                imm.hideSoftInputFromWindow(result.getWindowToken(), 0);
            }
        });
        input.setOnEditorActionListener(new EditText.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView textView, int actionId, KeyEvent event) {
                if (actionId == EditorInfo.IME_ACTION_DONE) {
                    submitButton.performClick();
                    return true;
                }
                return false;
            }
        });
    }

    private void executeBuiltinVariablesMethod(final int selectedItemPosition, final String parameterText) {
        switch (selectedItemPosition) {
            case GET_BUILTIN_TYPE_ATTRIBUTE:
                result.setText(String.valueOf(helloWorldAttributes.getBuiltInTypeAttribute()));
                break;
            case SET_BUILTIN_TYPE_ATTRIBUTE:
                helloWorldAttributes.setBuiltInTypeAttribute(Long.parseLong(parameterText));
                result.setText(R.string.attributes_setter_success);
                break;
            case GET_READ_ONLY_ATTRIBUTE:
                result.setText(String.valueOf(helloWorldAttributes.getReadonlyAttribute()));
                break;
            case GET_STRUCT_ATTRIBUTE:
                HelloWorldAttributes.ExampleStruct structAttribute = helloWorldAttributes.getStructAttribute();
                result.setText(String.format(Locale.getDefault(), EXAMPLE_STRUCT, structAttribute.value));
                break;
            case SET_STRUCT_ATTRIBUTE:
                HelloWorldAttributes.ExampleStruct exampleStruct = new HelloWorldAttributes.ExampleStruct();
                exampleStruct.value = Double.parseDouble(parameterText);
                helloWorldAttributes.setStructAttribute(exampleStruct);
                result.setText(R.string.attributes_setter_success);
                break;
        }
    }
}
