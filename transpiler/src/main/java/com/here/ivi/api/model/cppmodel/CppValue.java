package com.here.ivi.api.model.cppmodel;

public class CppValue extends CppElement {

    public static final String DefaultValueString = "defaultValues";
    public static final CppValue DefaultValue = new CppValue(DefaultValueString);

    public CppValue() {
        super(null);
    }

    public CppValue(String value) {
        super(value);
    }

    public boolean isValid() {
        return name != null;
    }

    public boolean isDefault() { return name.equals(DefaultValueString); }
}
