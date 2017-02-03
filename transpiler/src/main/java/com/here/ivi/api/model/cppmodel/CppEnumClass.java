package com.here.ivi.api.model.cppmodel;

public class CppEnumClass extends CppElement {
    public CppEnum enumeration;

    public boolean isValid() {
        return enumeration.isValid();
    }
}
