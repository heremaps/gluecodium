package com.here.ivi.api.model;

import org.franca.core.franca.*;

public class DefaultValuesHelper {
    // Used to identify the definition of default values of struct
    static final private String DEFAULT_VALUE_CONSTANT = "DefaultValues";

    public static boolean isStructDefaultValueConstant(FQualifiedElementRef qer) {
        return qer.getElement() instanceof FConstantDef && isStructDefaultValueConstant((FConstantDef) qer.getElement());
    }

    public static boolean isStructDefaultValueConstant(FConstantDef cd) {
        return cd.getType().getDerived() instanceof FStructType &&
                DEFAULT_VALUE_CONSTANT.equals(cd.getName());
    }

    public static boolean isEnumerator(FQualifiedElementRef qer) {
        return qer.getElement() instanceof FEnumerator;
    }

}
