package com.here.ivi.api.model.cppmodel;

import org.franca.core.franca.FInitializerExpression;

public class CppValue extends CppElement {
    public String value;
    public FInitializerExpression expression;

    public boolean isValid() {
        return expression != null;
    }

    public CppValue() {
        this.value = "INVALID";
    }

    public CppValue(String value, FInitializerExpression expression) {
        this.value = value;
        this.expression = expression;
    }
}
