package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppField extends CppElement {
    public CppType type;
    public CppValue initializer;

    public CppField() {
    }

    public CppField(CppType type, String name, CppValue initializer) {
        super(name);
        this.type = type;
        this.initializer = initializer;
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(type, initializer);
    }
}
