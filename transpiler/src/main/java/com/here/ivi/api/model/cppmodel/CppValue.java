package com.here.ivi.api.model.cppmodel;

public class CppValue extends CppElement {

    public CppValue() {
        super(null);
    }

    public CppValue(String value) {
        super(value);
    }

    public boolean isValid() {
        return name != null;
    }
}
