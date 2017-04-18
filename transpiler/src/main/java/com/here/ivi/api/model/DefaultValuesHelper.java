package com.here.ivi.api.model;

import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FQualifiedElementRef;
import org.franca.core.franca.FStructType;

public class DefaultValuesHelper {
    // Used to identify the definition of default values of struct
    static final private String DEFAULT_VALUE_CONSTANT = "defaultValues";

    public static boolean isStructDefaultValueConstant(FQualifiedElementRef qer) {
        if (qer.getElement() instanceof FConstantDef) {
            return isStructDefaultValueConstant((FConstantDef) qer.getElement());
        }

        return false;
    }

    public static boolean isStructDefaultValueConstant(FConstantDef cd) {
        return cd.getType().getDerived() instanceof FStructType &&
                DEFAULT_VALUE_CONSTANT.equals(cd.getName());
    }
}
