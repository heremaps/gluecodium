package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppParameter extends CppElement {

    public enum Mode{
        Input,
        Output,
        Listener
    }

    public CppType type;
    public CppValue value;
    public Mode mode;

    public boolean equals(Object other) {
        if (other == null) {
            return false;
        }
        if (other == this) {
            return true;
        }
        if (!(other instanceof CppParameter)) {
            return false;
        }

        CppParameter otherParameter = (CppParameter) other;
        return type.equals(otherParameter.type);
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(type, value);
    }
}
