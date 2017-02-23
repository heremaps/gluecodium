package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.Includes;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Stream;

import static java.util.Arrays.asList;

public class CppType extends CppElement {
    public CppElements.TypeInfo info = CppElements.TypeInfo.Invalid;
    public Set<Includes.Include> includes = Collections.emptySet();
    public DefinedBy definedIn;

    public boolean isValid() {
        return info != CppElements.TypeInfo.Invalid;
    }

    public CppType() {
        super("INVALID");
    }

    public CppType(String typeName) {
        super(typeName);
    }

    public CppType(DefinedBy def, String typeName, CppElements.TypeInfo info, Includes.Include... includes) {
        this(def, typeName, info, asList(includes));
    }

    public CppType(DefinedBy def, String typeName, CppElements.TypeInfo info,
                   Collection<Includes.Include> includes) {
        super(typeName);
        this.definedIn = def;
        this.info = info;
        this.includes = new HashSet<>(includes);
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.empty();
    }
}
