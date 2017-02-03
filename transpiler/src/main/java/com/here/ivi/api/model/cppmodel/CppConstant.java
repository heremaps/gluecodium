package com.here.ivi.api.model.cppmodel;

public class CppConstant extends CppElement {
    public CppType type;
    public CppValue value;

    public boolean isValid() {
        return type.isValid() && value.isValid();
    }
}
