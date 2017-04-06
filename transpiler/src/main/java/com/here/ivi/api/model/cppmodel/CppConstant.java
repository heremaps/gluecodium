package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppConstant extends CppElement {
    public CppType type;
    public CppValue value;

    public boolean isValid() {
        return type != null && value != null && type.isValid() && value.isValid();
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(type, value);
    }
}
