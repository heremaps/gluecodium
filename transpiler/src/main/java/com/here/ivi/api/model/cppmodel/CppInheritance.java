package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppInheritance extends CppElement{

    public enum Type {
        Public,
        Protected,
        Private
    }

    public CppType parent;
    public Type visibility;

    public CppInheritance(CppType parent, Type type) {
        super(null);
        this.parent = parent;
        this.visibility = type;
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(parent);
    }
}

