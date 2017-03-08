package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppInheritance extends CppElement{

    public enum Type {
        Public,
        Protected,
        Private
    }

    public CppClass parent;
    public Type type;

    public CppInheritance(CppClass parent, Type type) {
        super(null);
        this.parent = parent;
        this.type = type;
    }
    @Override
    public Stream<CppElement> stream() {
        return parent.stream();
    }
}

