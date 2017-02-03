package com.here.ivi.api.model.cppmodel;

public class CppEnumItem extends CppElement {
    public CppValue value;

    public boolean isValid() {
        return !name.isEmpty();
    }

}
