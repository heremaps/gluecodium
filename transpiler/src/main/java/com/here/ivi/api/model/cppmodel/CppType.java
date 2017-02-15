package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.Includes;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Stream;

import static java.util.Arrays.asList;

public class CppType extends CppElement {

    public String typeName = "INVALID";
    public CppElements.TypeInfo info = CppElements.TypeInfo.Invalid;
    public Set<Includes.Include> includes;
    public DefinedBy definedIn;

    public boolean isValid() {
        return info != CppElements.TypeInfo.Invalid;
    }

    public CppType() {
    }

    public CppType(DefinedBy def, String typeName, CppElements.TypeInfo info, Includes.Include... includes) {
        this(def, typeName, info, asList(includes));
    }

    public CppType(DefinedBy def, String typeName, CppElements.TypeInfo info,
                   Collection<Includes.Include> includes) {
        this.definedIn = def;
        this.typeName = typeName;
        this.info = info;
        this.includes = new HashSet<>(includes);
    }

    @Override
    public int hashCode() {
        return typeName.hashCode();
    }

    @Override
    public boolean equals(Object other) {
        if (other == null) {
            return false;
        }
        if (other == this) {
            return true;
        }
        if (!(other instanceof CppType)) {
            return false;
        }

        CppType otherType = (CppType) other;
        return typeName.equals(otherType.typeName);
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.empty();
    }
}
