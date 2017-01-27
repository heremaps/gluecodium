package com.here.ivi.api.generator.common;

import org.franca.core.franca.*;

import java.math.BigInteger;

// TODO this whole thing should be more abstract, needed for more than one language
// First do the logic mapping to JavaTypes that support validation and other things
// Then translate into target language
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
        } else if (rhs instanceof FCompoundInitializer) {
            return map((FCompoundInitializer)rhs);
        }

        return new CppElements.CppValue();
    }

    public static CppElements.CppValue map(FBooleanConstant bc) {
        final String value = bc.isVal() ? "true" : "false";
        return new CppElements.CppValue(value, bc);
    }

    public static CppElements.CppValue map(FStringConstant sc) {
        final String value = sc.getVal();
        return new CppElements.CppValue('"' + value + '"', sc);
    }

    public static CppElements.CppValue map(FIntegerConstant ic) {
        final BigInteger value = ic.getVal();
        return new CppElements.CppValue(String.valueOf(value), ic);
    }

    public static CppElements.CppValue map(FFloatConstant fc) {
        final Float value = fc.getVal();
        return new CppElements.CppValue(String.valueOf(value) + 'f', fc);
    }

    public static CppElements.CppValue map(FDoubleConstant dc) {
        final Double value = dc.getVal();
        return new CppElements.CppValue(String.valueOf(value), dc);
    }

    public static CppElements.CppValue map(FCompoundInitializer ci) {
        // TODO this is c-99 style, will cause pedantic warnings in c++11, replace with something nicer
        StringBuilder sb = new StringBuilder();
        sb.append("{ ");
        boolean needComma = false;
        for (FFieldInitializer fi : ci.getElements()) {
            CppElements.CppValue value = CppValueMapper.map(fi.getValue());
            if (needComma) {
                sb.append(", ");
            }
            if (value.isValid()) {
                sb.append('.').append(fi.getElement().getName()).append(" = ").append(value.value);
                needComma = true;
            }
        }
        sb.append(" }");
        return new CppElements.CppValue(sb.toString(), ci);
    }

}
