package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppEnumItem extends CppElement {
    public CppValue value;

    public boolean isValid() {
        return !name.isEmpty();
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(value);
    }
}
