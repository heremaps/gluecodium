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
import com.here.ivi.api.model.CollectionsHelper;
import java.util.*;
import java.util.stream.Stream;

public class CppMethod extends CppElement {
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

  public String deprecatedComment = null;
  public CppType returnType = CppType.Void;
  public Set<Specifier> specifiers = EnumSet.noneOf(Specifier.class);
  public Set<Qualifier> qualifiers = EnumSet.noneOf(Qualifier.class);
  public List<CppParameter> inParameters = new ArrayList<>();
  public List<CppParameter> outParameters = new ArrayList<>();

  public CppMethodBodyTemplate bodyTemplate;

  public CharSequence generateBody() {
    if (bodyTemplate == null) {
      return null;
    }

    return bodyTemplate.generate(this);
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

  @Override
  public Stream<CppElement> stream() {
    return Stream.concat(
        Stream.of(returnType), Stream.concat(inParameters.stream(), outParameters.stream()));
  }
}
