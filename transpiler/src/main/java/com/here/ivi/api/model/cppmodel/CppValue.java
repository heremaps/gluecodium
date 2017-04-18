package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.Includes;

import java.util.Collection;

import static java.util.Arrays.asList;

public class CppValue extends CppElementWithIncludes {

    public CppValue() {
        super(null);
    }

    public CppValue(String value) {
        super(value);
    }

    public CppValue(String value, Includes.Include... includes) {
        super(value, asList(includes));
    }

    public CppValue(String value, Collection<Includes.Include> includes) {
        super(value, includes);
    }

    public boolean isValid() {
        return name != null;
    }
}
