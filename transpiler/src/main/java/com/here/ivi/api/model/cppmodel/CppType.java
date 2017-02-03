package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.Includes;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import static java.util.Arrays.asList;

public class CppType {
    public String typeName = "INVALID";
    public CppElements.TypeInfo info = CppElements.TypeInfo.Invalid;
    public Set<Includes.Include> includes;
    public Set<CppType> referencedTypes;

    public boolean isValid() {
        return info != CppElements.TypeInfo.Invalid;
    }

    public CppType() {
    }

    public CppType(String typeName, CppElements.TypeInfo info) {
        this(typeName, info, Collections.emptySet());
    }

    public CppType(String typeName, CppElements.TypeInfo info, Includes.Include... includes) {
        this(typeName, info, asList(includes));
    }

    public CppType(String typeName, CppElements.TypeInfo info, Collection<Includes.Include> includes) {
        this(typeName, info, includes, Collections.emptySet());
    }

    public CppType(String typeName, CppElements.TypeInfo info,
                   Collection<Includes.Include> includes, Collection<CppType> referencedTypes) {
        this.typeName = typeName;
        this.info = info;
        this.includes = new HashSet<>(includes);
        this.referencedTypes = new HashSet<>(referencedTypes);
    }

    @Override
    public int hashCode() {
        return typeName.hashCode();
    }

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
}
