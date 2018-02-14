/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.here.android.smoke;

import java.util.List;

public interface CalculatorListener {
    public static class ResultStruct {
        public double result;
        public ResultStruct() {}
        public ResultStruct(double result) {
            this.result = result;
        }
    }
    void onCalculationResult(final double calculationResult);
    void onCalculationResultConst(final double calculationResult);
    void onCalculationResultStruct(final CalculatorListener.ResultStruct calculationResult);
    void onCalculationResultArray(final List<Double> calculationResult);
}
