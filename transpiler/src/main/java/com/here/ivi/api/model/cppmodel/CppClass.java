package com.here.ivi.api.model.cppmodel;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Stream;

public class CppClass extends CppElement {
    public Set<CppMethod> methods = new LinkedHashSet<>(); // preserve insertion order
    public Set<CppUsing> usings = new LinkedHashSet<>();
    public Set<CppField> fields = new LinkedHashSet<>();

    public CppClass(String name) {
        super( name );
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.concat(methods.stream(),
                Stream.concat(usings.stream(), fields.stream())).map(CppElement.class::cast);
    }
}
