package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.Includes;

import java.util.*;
import java.util.stream.Stream;

import static java.util.Arrays.asList;

public class CppType extends CppElement {
    public final static CppType None = new CppType("");
    public final static CppType Void = new CppType("void");

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
        this(null, typeName);
    }

    public CppType(String typeName, Includes.Include... includes) {
        this(null, typeName, CppElements.TypeInfo.BuiltIn, asList(includes));
    }

    public CppType(DefinedBy def, String typeName) {
        this(def, typeName, CppElements.TypeInfo.BuiltIn, Collections.emptyList());
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

    public void setIncludes(Includes.Include... includes) {
        this.includes = new HashSet<>(Arrays.asList(includes));
    }

    @Override
    public Stream<CppElement> stream() {
        return Stream.empty();
    }
}
