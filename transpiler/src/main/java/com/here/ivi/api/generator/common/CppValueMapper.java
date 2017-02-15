package com.here.ivi.api.generator.common;

import com.here.ivi.api.generator.common.templates.CppConstantTemplate;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.cppmodel.CppValue;
import org.franca.core.franca.*;
import org.franca.core.franca.impl.FUnaryOperationImpl;

import java.math.BigInteger;

// TODO this whole thing should be more abstract, needed for more than one language
// First do the logic mapping to JavaTypes that support validation and other things
// Then translate into target language
public class CppValueMapper {

    public static CppValue map(CppType type, FInitializerExpression rhs) {
        if (rhs instanceof FCompoundInitializer) {
            return map(type, (FCompoundInitializer)rhs);
        }

        return map(rhs);
    }

    public static CppValue map(FInitializerExpression rhs) {
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
        } else if (rhs instanceof FUnaryOperation) {
            FUnaryOperation xx = ((FUnaryOperation) rhs);
            CppValue base = map(xx.getOperand());
            // luckily all the operators look the same as in cpp, still 90% do not make much sense
            return new CppValue( xx.getOp().getLiteral() + base.value, rhs );
        }

        return new CppValue();
    }

    public static CppValue map(FBooleanConstant bc) {
        final String value = bc.isVal() ? "true" : "false";
        return new CppValue(value, bc);
    }

    public static CppValue map(FStringConstant sc) {
        final String value = sc.getVal();
        return new CppValue('"' + value + '"', sc);
    }

    public static CppValue map(FIntegerConstant ic) {
        final BigInteger value = ic.getVal();
        return new CppValue(String.valueOf(value), ic);
    }

    public static CppValue map(FFloatConstant fc) {
        final Float value = fc.getVal();
        return new CppValue(String.valueOf(value) + 'f', fc);
    }

    public static CppValue map(FDoubleConstant dc) {
        final Double value = dc.getVal();
        return new CppValue(String.valueOf(value), dc);
    }

    public static CppValue map(CppType type, FCompoundInitializer ci) {
        // FIXME having a template in here is not-so-nice, this should be some CppType
        return new CppValue(CppConstantTemplate.generate(type, ci).toString(), ci);
    }

}
