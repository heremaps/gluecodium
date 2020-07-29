/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.List;
import java.util.Map;
public interface CalculatorListener {
    public static final class ResultStruct {
        public double result;
        public ResultStruct(final double result) {
            this.result = result;
        }
    }
    void onCalculationResult(final double calculationResult);
    void onCalculationResultConst(final double calculationResult);
    void onCalculationResultStruct(@NonNull final CalculatorListener.ResultStruct calculationResult);
    void onCalculationResultArray(@NonNull final List<Double> calculationResult);
    void onCalculationResultMap(@NonNull final Map<String, Double> calculationResults);
    void onCalculationResultInstance(@NonNull final CalculationResult calculationResult);
}