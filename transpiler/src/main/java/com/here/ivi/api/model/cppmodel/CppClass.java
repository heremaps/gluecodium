package com.here.ivi.api.model.cppmodel;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Stream;

public class CppClass extends CppElement {
    public Set<CppMethod> methods = new LinkedHashSet(); // preserve insertion order

    public CppClass(String name) {
        super( name );
    }

    @Override
    public Stream<CppElement> stream() {
        return methods.stream().map(CppElement.class::cast);
    }
}
