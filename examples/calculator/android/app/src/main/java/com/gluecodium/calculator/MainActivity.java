// Copyright (C) 2016-2023 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE

package com.gluecodium.calculator;

import static android.widget.Toast.LENGTH_LONG;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.util.Pair;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.gluecodium.calculator.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {

    // Used to load the 'libmylibrary.so' library on application startup.
    static {
        System.loadLibrary("mylibrary");
    }

    final private Calculator calculator = new Calculator();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        com.gluecodium.calculator.databinding.ActivityMainBinding binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        findViewById(R.id.button_plus).setOnClickListener(view -> {
            final Pair<Integer, Integer> values = readValues();
            if (values == null) {
                return;
            }
            try {
                final int result = calculator.summarize(values.first, values.second);
                final String resultText = values.first + " + " + values.second + " = " + result;
                showResult(resultText);
            } catch (Calculator.CalculatorExceptionException e) {
                showError("Failure: " + e.getMessage());
            }
        });

        findViewById(R.id.button_minus).setOnClickListener(view -> {
            final Pair<Integer, Integer> values = readValues();
            if (values == null) {
                return;
            }
            calculator.subtract(values.first, values.second, (error, result) -> {
                if (error != null) {
                    showError("Failure: " + error);
                } else {
                    final String resultText = values.first + " - " + values.second + " = " + result;
                    showResult(resultText);
                }
            });
        });

        findViewById(R.id.button_multiply).setOnClickListener(view -> {
            final Pair<Integer, Integer> values = readValues();
            if (values == null) {
                return;
            }

            calculator.multiply(values.first, values.second, new Calculator.MultiplyCallback() {
                @Override
                public void onError(@NonNull Calculator.CalculatorError error) {
                    showError("Failure: " + error.toString());
                }

                @Override
                public void onResult(int result) {
                    final String resultText = values.first + " x " + values.second + " = " + result;
                    showResult(resultText);
                }
            });
        });

        findViewById(R.id.button_divide).setOnClickListener(view -> {
            final Pair<Integer, Integer> values = readValues();
            if (values == null) {
                return;
            }
            final Calculator.DivideResult result =  calculator.divide(
                    new Calculator.DivideArguments(values.first, values.second));
            if (result.error != null) {
                showError("Failure: " + result.error.toString());
            } else {
                final String resultText = values.first + " / " + values.second + " = " + result.result;
                showResult(resultText);
            }
        });

        findViewById(R.id.button_min).setOnClickListener(view -> {
            final Pair<Integer, Integer> values = readValues();
            if (values == null) {
                return;
            }
            final Calculator.MinResultRetriever resultRetriever = calculator.min(values.first, values.second);
            final int result = resultRetriever.getResult();
            final String resultText = "min(" + values.first + ", " + values.second + ") = " + result;
            showResult(resultText);
        });

        findViewById(R.id.button_max).setOnClickListener(view -> {
            Integer number1 = null;
            Integer number2 = null;

            final String inputText1 = ((EditText)(findViewById(R.id.edit_number_1))).getText().toString();
            if (!inputText1.isEmpty()) {
                number1 = Integer.parseInt(inputText1);
            }

            final String inputText2 = ((EditText)(findViewById(R.id.edit_number_2))).getText().toString();
            if (!inputText2.isEmpty()) {
                number2 = Integer.parseInt(inputText2);
            }

            final Integer result = calculator.max(number1, number2);

            if (result != null) {
                String resultText = "max(";
                if (number1 != null && number2 != null) {
                    resultText += number1 + ", " + number2;
                } else if (number1 != null) {
                    resultText += number1;
                } else if (number2 != null) {
                    resultText += number2;
                }
                resultText += ") = " + result;
                showResult(resultText);
            } else {
                showResult("null");
            }
        });
    }

    private Pair<Integer, Integer> readValues() {
        try {
            final int value1 = readValue1();
            final int value2 = readValue2();
            return new Pair<>(value1, value2);
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), e.getMessage(), LENGTH_LONG).show();
            return null;
        }
    }

    private void showResult(@NonNull String resultText) {
        TextView textView = findViewById(R.id.text_result);
        textView.setTextColor(Color.BLACK);
        textView.setText(resultText);
    }

    private void showError(@NonNull String resultText) {
        TextView textView = findViewById(R.id.text_result);
        textView.setTextColor(Color.RED);
        textView.setText(resultText);
    }

    private int readValue1() {
        return readValueById(R.id.edit_number_1);
    }

    private int readValue2() {
        return readValueById(R.id.edit_number_2);
    }

    private int readValueById(int id) {
        EditText editText = findViewById(id);
        final String inputText = editText.getText().toString();
        if (inputText.isEmpty()) {
            throw new RuntimeException("Input value is empty");
        }
        return Integer.parseInt(inputText);
    }
}