package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppUsing extends CppElement {

    public CppUsing(String name, CppType definition) {
        super(name);
        this.definition = definition;
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(definition);
    }

    public final CppType definition;
}
