package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppEnumClass extends CppElement {
    public CppEnum enumeration;

    public boolean isValid() {
        return enumeration.isValid();
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(enumeration);
    }
}
