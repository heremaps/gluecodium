package com.here.ivi.api.generator.common;

import org.franca.core.franca.*;

import java.math.BigInteger;

public class CppValueMapper {
    public static CppElements.CppValue map(CppElements.CppType targetType, FInitializerExpression rhs) {
        if (rhs instanceof FBooleanConstant) {
            return map(targetType, (FBooleanConstant)rhs);
        } else if (rhs instanceof FIntegerConstant) {
            return map(targetType, (FIntegerConstant)rhs);
        } else if (rhs instanceof FStringConstant) {
            return map(targetType, (FStringConstant)rhs);
        } else if (rhs instanceof FFloatConstant) {
            return map(targetType, (FFloatConstant)rhs);
        } else if (rhs instanceof FDoubleConstant) {
            return map(targetType, (FDoubleConstant)rhs);
        }

        return new CppElements.CppValue();
    }

    public static CppElements.CppValue map(CppElements.CppType targetType, FBooleanConstant bc) {
        // TODO add checks that the targetType is actually matched correct
        final String value = bc.isVal() ? "true" : "false";
        return new CppElements.CppValue(value, bc);
    }

    public static CppElements.CppValue map(CppElements.CppType targetType, FStringConstant sc) {
        // TODO add checks that the targetType is actually matched correct
        final String value = sc.getVal();
        return new CppElements.CppValue(value, sc);
    }

    public static CppElements.CppValue map(CppElements.CppType targetType, FIntegerConstant ic) {
        // TODO add checks that the targetType is actually matched correct
        // TODO add checks if value fits into the targetType

        final BigInteger value = ic.getVal();
        return new CppElements.CppValue(String.valueOf(value), ic);
    }

    public static CppElements.CppValue map(CppElements.CppType targetType, FFloatConstant ic) {
        // TODO add checks that the targetType is actually matched correct
        // TODO add checks if value fits into the targetType

        final Float value = ic.getVal();
        return new CppElements.CppValue(String.valueOf(value) + 'f', ic);
    }

    public static CppElements.CppValue map(CppElements.CppType targetType, FDoubleConstant ic) {
        // TODO add checks that the targetType is actually matched correct
        // TODO add checks if value fits into the targetType

        final Double value = ic.getVal();
        return new CppElements.CppValue(String.valueOf(value), ic);
    }


}
