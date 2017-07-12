package com.example.here.hello.activity;

import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import com.example.here.hello.R;
import com.here.android.hello.HelloWorld;
import com.here.android.hello.HelloWorldBuiltinTypes;

public final class MainActivity extends AppCompatActivity {
    private static final byte BYTE_TEST_VALUE = 10;

    private EditText user;
    private EditText builtinEdit;
    private Spinner builtinSpinner;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        user = (EditText) findViewById(R.id.user);
        builtinEdit = (EditText) findViewById(R.id.builtin_edit);
        builtinSpinner = (Spinner) findViewById(R.id.builtin_spinner);

        Button greet = (Button) findViewById(R.id.greet);
        greet.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String username = user.getText().toString();
                String userGreeting = HelloWorld.helloWorldMethod(username);
                Snackbar.make(user, userGreeting, Snackbar.LENGTH_INDEFINITE).show();
            }
        });

        Button builtinButton = (Button) findViewById(R.id.builtin_submit_button);
        builtinButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String parameterText = builtinEdit.getText().toString();
                try {
                    executeBuiltinVariablesMethod(
                            builtinSpinner.getSelectedItemPosition(), parameterText);
                } catch (NumberFormatException e) {
                    Snackbar.make(
                            user,
                            getString(R.string.could_not_convert_to_number) + e.getMessage(),
                            Snackbar.LENGTH_SHORT).show();
                }
            }
        });
    }

    private void executeBuiltinVariablesMethod(int selectedItemPosition, String parameterText) {
        switch (selectedItemPosition) {
            case 0:
                byte byteResult = HelloWorldBuiltinTypes.methodWithInt8(Byte.decode(parameterText));
                showResult(Byte.toString(byteResult));
                break;
            case 1:
                long resultUInt8 = HelloWorldBuiltinTypes.methodWithUInt8(
                        Long.valueOf(parameterText));
                showResult(Long.toString(resultUInt8));
                break;
            case 2:
                short shortResult = HelloWorldBuiltinTypes.methodWithInt16(
                        Short.valueOf(parameterText));
                showResult(Short.toString(shortResult));
                break;
            case 3:
                long resultUInt16 = HelloWorldBuiltinTypes.methodWithUInt16(
                        Long.valueOf(parameterText));
                showResult(Long.toString(resultUInt16));
                break;
            case 4:
                int intResult = HelloWorldBuiltinTypes.methodWithInt32(
                        Integer.valueOf(parameterText));
                showResult(Integer.toString(intResult));
                break;
            case 5:
                long resultUInt32 = HelloWorldBuiltinTypes.methodWithUInt32(
                        Long.valueOf(parameterText));
                showResult(Long.toString(resultUInt32));
                break;
            case 6:
                long resultInt64 = HelloWorldBuiltinTypes.methodWithInt64(
                        Long.valueOf(parameterText));
                showResult(Long.toString(resultInt64));
                break;
            case 7:
                long resultUInt64 = HelloWorldBuiltinTypes.methodWithUInt64(
                        Long.valueOf(parameterText));
                showResult(Long.toString(resultUInt64));
                break;
            case 8:
                boolean booleanResult = HelloWorldBuiltinTypes.methodWithBoolean(
                        Boolean.valueOf(parameterText));
                showResult(Boolean.toString(booleanResult));
                break;
            case 9:
                float floatResult = HelloWorldBuiltinTypes.methodWithFloat(
                        Float.valueOf(parameterText));
                showResult(Float.toString(floatResult));
                break;
            case 10:
                double doubleResult = HelloWorldBuiltinTypes.methodWithDouble(
                        Double.valueOf(parameterText));
                showResult(Double.toString(doubleResult));
                break;
            case 11:
                byte[] byteArrayResult = HelloWorldBuiltinTypes.methodWithByteBuffer(
                        parameterText.getBytes());
                showResult(new String(byteArrayResult));
                break;
            case 12:
                double multipleParamResult = executeMultipleParameterMethod(parameterText);
                showResult(Double.toString(multipleParamResult));
                break;
        }
    }

    private double executeMultipleParameterMethod(String parameterText) {
        String[] parameters = parameterText.split(",", 2);
        float floatParameter = Float.valueOf(parameters[0]);
        byte byteParameter = parameters.length > 1 ? Byte.valueOf(parameters[1]) : BYTE_TEST_VALUE;
        return HelloWorldBuiltinTypes.methodWithFloatAndInteger(floatParameter, byteParameter);
    }

    private void showResult(String result) {
        Snackbar.make(user, getString(R.string.got_result) + result, Snackbar.LENGTH_LONG).show();
    }
}
