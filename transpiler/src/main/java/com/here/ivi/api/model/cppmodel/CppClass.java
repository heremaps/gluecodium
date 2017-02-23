package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.common.CppUsing;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Stream;

public class CppClass extends CppElement {
    public Set<CppMethod> methods = new LinkedHashSet<>(); // preserve insertion order
    public Set<CppUsing> usings = new LinkedHashSet<>();

    public CppClass(String name) {
        super( name );
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.concat(methods.stream(), usings.stream()).map(CppElement.class::cast);
    }
}
