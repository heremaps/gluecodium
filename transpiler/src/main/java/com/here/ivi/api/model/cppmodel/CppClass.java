package com.here.ivi.api.model.cppmodel;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Stream;

public class CppClass extends CppElement {
    public Set<CppMethod> methods = new HashSet();

    @Override
    public Stream<CppElement> stream() {
        return methods.stream().map(CppElement.class::cast);
    }
}
