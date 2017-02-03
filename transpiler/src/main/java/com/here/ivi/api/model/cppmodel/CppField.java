package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppField extends CppElement {
    public CppType type;
    public CppValue initializer;

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(type, initializer);
    }
}
