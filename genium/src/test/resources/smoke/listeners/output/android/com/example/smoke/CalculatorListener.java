/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import java.util.List;
import java.util.Map;

public interface CalculatorListener {
    public static class ResultStruct {
        public double result;
        public ResultStruct() {
            this(0);
        }
        public ResultStruct(double result) {
            this.result = result;
        }
    }
    void onCalculationResult(final double calculationResult);
    void onCalculationResultConst(final double calculationResult);
    void onCalculationResultStruct(@NonNull final CalculatorListener.ResultStruct calculationResult);
    void onCalculationResultArray(final List<Double> calculationResult);
    void onCalculationResultMap(final Map<String, Double> calculationResults);
    void onCalculationResultInstance(final CalculationResult calculationResult);
}
