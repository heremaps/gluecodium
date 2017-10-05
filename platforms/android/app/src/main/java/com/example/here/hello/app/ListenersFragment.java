package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.here.hello.R;
import com.here.android.hello.Calculator;
import com.here.android.hello.CalculatorFactory;
import com.here.android.hello.CalculatorListener;
import com.here.android.hello.HelloWorldCalculatorListenerFactory;
import com.here.android.hello.HelloWorldStaticLogger;

import static android.content.Context.INPUT_METHOD_SERVICE;

public final class ListenersFragment extends Fragment {
    private static final String CALLED_WITH_RESULT = "called with result =";
    private Button submitButton;
    private TextView result;
    private TextView inputX1;
    private TextView inputY1;
    private TextView inputZ1;
    private TextView inputX2;
    private TextView inputY2;
    private TextView inputZ2;
    private Spinner spinner;
    private Button registerJavaButton;
    private Button unregisterJavaButton;
    private Button registerNativeButton;
    private Button unregisterNativeButton;
    private String[] buttonText;
    private final int JAVA_LISTENER_NATIVE_METHOD = 0;
    private final int NATIVE_LISTENER_NATIVE_METHOD = 1;
    private final int LISTENERS_IN_BACKGROUND = 2;

    private static final Calculator.Position START_POSITION = new Calculator.Position();
    private static final Calculator.Position END_POSITION = new Calculator.Position();
    private Calculator notifier = CalculatorFactory.createCalculator();

    private CalculatorListener javaListener = new CalculatorListener() {
        @Override
        public void onCalculationResult(double v) {
            result.setText(String.valueOf(v));
        }

        @Override
        public void onCalculationInBackgroundResult(double v) {
            result.setText(String.valueOf(v));
        }
    };
    private CalculatorListener nativeListener = HelloWorldCalculatorListenerFactory.createCalculatorListener();

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_listeners, container, false);
        buttonText = getResources().getStringArray(R.array.listeners_methods_button);
        registerJavaButton = rootView.findViewById(R.id.register_java_listener);
        unregisterJavaButton = rootView.findViewById(R.id.unregister_java_listener);
        registerNativeButton = rootView.findViewById(R.id.register_native_listener);
        unregisterNativeButton = rootView.findViewById(R.id.unregister_native_listener);
        inputX1 = rootView.findViewById(R.id.listeners_start_x);
        inputY1 = rootView.findViewById(R.id.listeners_start_y);
        inputZ1 = rootView.findViewById(R.id.listeners_start_z);
        inputX2 = rootView.findViewById(R.id.listeners_end_x);
        inputY2 = rootView.findViewById(R.id.listeners_end_y);
        inputZ2 = rootView.findViewById(R.id.listeners_end_z);
        result = rootView.findViewById(R.id.listeners_result);
        spinner = rootView.findViewById(R.id.listeners_spinner);
        submitButton = rootView.findViewById(R.id.listeners_submit_button);
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
                submitButton.setText(buttonText[position]);
                if (position == LISTENERS_IN_BACKGROUND) {
                    registerJavaButton.setVisibility(View.VISIBLE);
                    unregisterJavaButton.setVisibility(View.VISIBLE);
                    registerNativeButton.setVisibility(View.VISIBLE);
                    unregisterNativeButton.setVisibility(View.VISIBLE);
                } else {
                    registerJavaButton.setVisibility(View.GONE);
                    unregisterJavaButton.setVisibility(View.GONE);
                    registerNativeButton.setVisibility(View.GONE);
                    unregisterNativeButton.setVisibility(View.GONE);
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parentView) {
                registerJavaButton.setVisibility(View.GONE);
                unregisterJavaButton.setVisibility(View.GONE);
                registerNativeButton.setVisibility(View.GONE);
                unregisterNativeButton.setVisibility(View.GONE);
            }
        });
        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String x1 = inputX1.getText().toString();
                String y1 = inputY1.getText().toString();
                String z1 = inputZ1.getText().toString();
                String x2 = inputX2.getText().toString();
                String y2 = inputY2.getText().toString();
                String z2 = inputZ2.getText().toString();
                try {
                    executeBuiltinVariablesMethod(spinner.getSelectedItemPosition(),
                            x1, y1, z1, x2, y2, z2);
                } catch (NumberFormatException e) {
                    result.setText(e.getMessage());
                }

                // hide virtual keyboard
                InputMethodManager imm = (InputMethodManager) getContext().getSystemService(INPUT_METHOD_SERVICE);
                imm.hideSoftInputFromWindow(result.getWindowToken(), 0);
            }
        });

        registerJavaButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                notifier.registerListener(javaListener);
            }
        });

        registerNativeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                notifier.registerListener(nativeListener);
            }
        });

        unregisterJavaButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                notifier.unregisterListener(javaListener);
            }
        });

        unregisterNativeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                notifier.unregisterListener(nativeListener);
            }
        });
    }

    private void executeBuiltinVariablesMethod(final int selectedItemPosition,
                                               final String x1, final String y1, final String z1,
                                               final String x2, final String y2, final String z2) {
        START_POSITION.x = Float.parseFloat(x1);
        START_POSITION.y = Float.parseFloat(y1);
        START_POSITION.z = Float.parseFloat(z1);
        END_POSITION.x = Float.parseFloat(x2);
        END_POSITION.y = Float.parseFloat(y2);
        END_POSITION.z = Float.parseFloat(z2);
        result.setText("");

        switch (selectedItemPosition) {
            case JAVA_LISTENER_NATIVE_METHOD:
                notifier.calculate(START_POSITION, END_POSITION, javaListener);
                break;
            case NATIVE_LISTENER_NATIVE_METHOD:
                HelloWorldStaticLogger.clearLog();
                notifier.calculate(START_POSITION, END_POSITION, nativeListener);
                setResultFromLog(result);
                break;
            case LISTENERS_IN_BACKGROUND:
                HelloWorldStaticLogger.clearLog();
                notifier.calculateInBackground(START_POSITION, END_POSITION);
                setResultFromLog(result);
                break;
        }
    }

    private void setResultFromLog(TextView result) {
        String log = HelloWorldStaticLogger.getLog();
        if (log.contains(CALLED_WITH_RESULT)) {
            String value = log.split(CALLED_WITH_RESULT)[1]; // trim before CALLED_WITH_RESULT
            value = value.split("\n")[0];// trim after new line
            result.setText(value);
        }
    }
}
