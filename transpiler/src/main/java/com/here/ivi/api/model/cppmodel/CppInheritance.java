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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        CppInheritance that = (CppInheritance) o;

        return parent.equals(that.parent);
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + parent.hashCode();
        return result;
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(parent);
    }

}

