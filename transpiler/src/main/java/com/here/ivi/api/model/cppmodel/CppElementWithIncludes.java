package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.Includes;

import java.util.*;

public class CppElementWithIncludes extends CppElement {
    public Set<Includes.Include> includes = Collections.emptySet();

    public CppElementWithIncludes(String value) {
        super(value);
        this.includes = new HashSet<>();
    }

    public CppElementWithIncludes(String value, Collection<Includes.Include> includes) {
        super(value);
        this.includes = new HashSet<>(includes);
    }
}
