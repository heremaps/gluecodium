package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppType;

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
