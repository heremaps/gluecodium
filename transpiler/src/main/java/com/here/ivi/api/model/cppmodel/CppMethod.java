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

import com.here.ivi.api.generator.common.cpp.templates.CppMethodBodyTemplate;
import com.here.ivi.api.model.common.CollectionsHelper;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public final class CppMethod extends CppElementWithIncludes {
  public enum Specifier {
    EXPLICIT("explicit"),
    INLINE("inline"),
    STATIC("static"),
    VIRTUAL("virtual");

    private final String text;

    Specifier(final String text) {
      this.text = text;
    }

    @Override
    public String toString() {
      return text;
    }
  }

  public enum Qualifier {
    CONST("const"),
    OVERRIDE("override"),
    PURE_VIRTUAL("= 0");

    private final String text;

    Qualifier(final String text) {
      this.text = text;
    }

    @Override
    public String toString() {
      return text;
    }
  }

  private CppMethod(Builder builder) {
    this.name = builder.name;
    this.comment = builder.methodComment;
    this.deprecatedComment = builder.deprecatedComment;
    this.returnType = builder.returnType;
    this.specifiers = builder.specifiers;
    this.qualifiers = builder.qualifiers;
    this.inParameters = builder.inParameters;
    this.outParameters = builder.outParameters;
    this.bodyTemplate = builder.theBodyTemplate;
  }

  private final String deprecatedComment;
  private final CppType returnType;
  private final Set<Specifier> specifiers;
  private final Set<Qualifier> qualifiers;
  private final List<CppParameter> inParameters;
  private final List<CppParameter> outParameters;
  private final CppMethodBodyTemplate bodyTemplate;

  public CharSequence generateBody() {
    if (bodyTemplate == null) {
      return null;
    }

    return bodyTemplate.generate(this);
  }

  public String getDeprecatedComment() {
    return deprecatedComment;
  }

  public CppType getReturnType() {
    return returnType;
  }

  public Set<Specifier> getSpecifiers() {
    return specifiers;
  }

  public Set<Qualifier> getQualifiers() {
    return qualifiers;
  }

  public List<CppParameter> getInParameters() {
    return inParameters;
  }

  public List<CppParameter> getOutParameters() {
    return outParameters;
  }

  public boolean hasBody() {
    return bodyTemplate != null;
  }

  public boolean hasParameters() {
    return !(inParameters.isEmpty() && outParameters.isEmpty());
  }

  @Override
  public boolean equals(Object other) {
    if (other == null) {
      return false;
    }
    if (other == this) {
      return true;
    }
    if (!(other instanceof CppMethod)) {
      return false;
    }
    CppMethod otherMethod = (CppMethod) other;

    // TODO move to a helper.
    boolean inParamsEquality =
        CollectionsHelper.areEqualOrdered(inParameters, otherMethod.inParameters);
    boolean outParamsEquality =
        CollectionsHelper.areEqualOrdered(outParameters, otherMethod.outParameters);
    boolean specifiersEquality = CollectionsHelper.areEqual(specifiers, otherMethod.specifiers);
    boolean qualifiersEquality = CollectionsHelper.areEqual(qualifiers, otherMethod.qualifiers);

    return super.equals(other)
        && returnType.equals(otherMethod.returnType)
        && inParamsEquality
        && outParamsEquality
        && specifiersEquality
        && qualifiersEquality;
  }

  public static class Builder {
    private final String name;
    private String methodComment;
    private String deprecatedComment;
    private CppType returnType = CppPrimitiveType.VOID_TYPE;
    private Set<Specifier> specifiers = EnumSet.noneOf(Specifier.class);
    private Set<Qualifier> qualifiers = EnumSet.noneOf(Qualifier.class);
    private List<CppParameter> inParameters = new ArrayList<>();
    private List<CppParameter> outParameters = new ArrayList<>();
    private CppMethodBodyTemplate theBodyTemplate = null;

    public Builder(String name) {
      this.name = name;
    }

    public Builder comment(String comment) {
      this.methodComment = comment;
      return this;
    }

    public Builder returnType(CppType type) {
      this.returnType = type;
      return this;
    }

    public Builder specifier(Specifier theSpecifier) {
      this.specifiers.add(theSpecifier);
      return this;
    }

    public Builder qualifier(Qualifier theQualifier) {
      this.qualifiers.add(theQualifier);
      return this;
    }

    public Builder inParameter(CppParameter parameter) {
      this.inParameters.add(parameter);
      return this;
    }

    public Builder bodyTemplate(CppMethodBodyTemplate template) {
      this.theBodyTemplate = template;
      return this;
    }

    public CppMethod build() {
      return new CppMethod(this);
    }
  }

  @Override
  public Stream<CppElement> stream() {
    return Stream.concat(
        Stream.of(returnType), Stream.concat(inParameters.stream(), outParameters.stream()));
  }
}
