/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.common.LazyTypeRefName;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

/**
 * CppComplexTypeRef represents a reference to a non-builtin cpp type. It can contain either a
 * resolved name or a lazy name (see LazyTypeRefName). It the latter case, the nested-name-specifier
 * of the type definition and the nested scope (concatenation of namespace and class scopes) of the
 * type reference will be stored inside the CppComplexTypeRef object.
 *
 * <p>The nested-name-specifier of a type definition is assumed to be computable in a
 * generator-independent manner from the franca model. Therefore, its name-specifier is calculated
 * by CppTypeMapper and passed to the constructor of CppComplexTypeRef.
 *
 * <p>In contrast, the nested scope of a type reference is generator specific and is built by adding
 * scope elements (addTypeRefScopeNames()) while building the model.
 *
 * <p>Note: As model building is performed bottom-up, the addition of scope elements has to be done
 * in reverse order, i.e. innermost scope element will be added first.
 *
 * <p>After model generation is finished, the final name can be resolved via resolveLazyName().
 */
public class CppComplexTypeRef extends CppTypeRef {

  public static final String STRING_TYPE_NAME = "std::string";
  public static final String BYTE_VECTOR_TYPE_NAME = "std::vector< uint8_t >";

  public LazyTypeRefName lazyName;
  public final CppTypeInfo info;

  private CppComplexTypeRef(CppComplexTypeRef.Builder builder) {
    super(builder.resolvedName, builder.includes);
    info = builder.typeInfo != null ? builder.typeInfo : CppTypeInfo.Complex;
    lazyName = builder.lazyName;
  }

  @Override
  public boolean refersToValueType() {
    return info == CppTypeInfo.Enumeration;
  }

  public boolean hasLazyName() {
    return lazyName != null;
  }

  public void addTypeRefScopeNames(List<String> qualificationEntries) {
    lazyName.typeRefScope.addAll(0, qualificationEntries);
  }

  @Override
  public String getTextualRepresentation() {
    return hasLazyName()
        ? String.join("::", lazyName.typeDefNestedNameSpecifier)
            + "::"
            + lazyName.unqualifiedTypeName
        : name;
  }

  public void resolveLazyName() {
    List<String> disjointQualification =
        new LinkedList(
            builtDisjointNameQualifier(lazyName.typeDefNestedNameSpecifier, lazyName.typeRefScope));
    disjointQualification.add(lazyName.unqualifiedTypeName);
    this.name = String.join("::", disjointQualification);
    this.lazyName = null;
  }

  public static class Builder {
    private String resolvedName = null;
    private LazyTypeRefName lazyName = null;
    private Collection<Include> includes = null;
    private CppTypeInfo typeInfo = null;

    public Builder(final String resolvedName) {
      this.resolvedName = resolvedName;
    }

    public Builder(LazyTypeRefName lazyName) {
      this.lazyName = lazyName;
    }

    public Builder includes(final Collection<Include> includes) {
      this.includes = includes;
      return this;
    }

    public Builder includes(final Include... includes) {
      return includes(Arrays.asList(includes));
    }

    public Builder typeInfo(final CppTypeInfo typeInfo) {
      this.typeInfo = typeInfo;
      return this;
    }

    public CppComplexTypeRef build() {
      return new CppComplexTypeRef(this);
    }
  }

  private static List<String> builtDisjointNameQualifier(
      List<String> typeDefQualification, List<String> typeRefQualification) {
    int i = 0;
    // find largest common part...
    for (; i < typeDefQualification.size() && i < typeRefQualification.size(); i++) {
      if (!typeDefQualification.get(i).equals(typeRefQualification.get(i))) {
        break;
      }
    }
    // ... and strip it off
    return typeDefQualification.subList(i, typeDefQualification.size());
  }
}
