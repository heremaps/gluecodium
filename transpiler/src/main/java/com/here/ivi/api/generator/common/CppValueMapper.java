package com.here.ivi.api.generator.common;

import org.franca.core.franca.*;

import java.math.BigInteger;

public class CppValueMapper {
    public static CppElements.CppValue map(FInitializerExpression rhs) {
        if (rhs instanceof FBooleanConstant) {
            return map((FBooleanConstant)rhs);
        } else if (rhs instanceof FIntegerConstant) {
            return map((FIntegerConstant)rhs);
        } else if (rhs instanceof FStringConstant) {
            return map((FStringConstant)rhs);
        } else if (rhs instanceof FFloatConstant) {
            return map((FFloatConstant)rhs);
        } else if (rhs instanceof FDoubleConstant) {
            return map((FDoubleConstant)rhs);
        }

        return new CppElements.CppValue();
    }

    public static CppElements.CppValue map(FBooleanConstant bc) {

        final String value = bc.isVal() ? "true" : "false";
        return new CppElements.CppValue(value, bc);
    }

    public static CppElements.CppValue map(FStringConstant sc) {

        final String value = sc.getVal();
        return new CppElements.CppValue(value, sc);
    }

    public static CppElements.CppValue map(FIntegerConstant ic) {

        final BigInteger value = ic.getVal();
        return new CppElements.CppValue(String.valueOf(value), ic);
    }

    public static CppElements.CppValue map(FFloatConstant ic) {

        final Float value = ic.getVal();
        return new CppElements.CppValue(String.valueOf(value) + 'f', ic);
    }

    public static CppElements.CppValue map(FDoubleConstant ic) {

        final Double value = ic.getVal();
        return new CppElements.CppValue(String.valueOf(value), ic);
    }


}
