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

package com.here.ivi.api.model.javamodel;

import com.here.ivi.api.generator.common.java.templates.JavaMethodBodyTemplate;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public class JavaMethod extends JavaElement {
  public enum Specifier {
    STATIC("static");

    private final String text;

    Specifier(final String text) {
      this.text = text;
    }

    @Override
    public String toString() {
      return text;
    }
  }

  public String deprecatedComment = null;
  public JavaElements.Visibility visibility = JavaElements.Visibility.Private;
  public JavaType returnType = JavaType.Null;
  public Set<Specifier> specifiers = EnumSet.noneOf(Specifier.class);
  public List<JavaParameter> inParameters = new ArrayList<>();
  public List<JavaParameter> outParameters = new ArrayList<>();
  public JavaMethodBodyTemplate mbt;

  public CharSequence generateBody() {
    if (mbt == null) {
      return null;
    }

    return mbt.generate(this);
  }

  public boolean hasBody() {
    return mbt != null;
  }

  public boolean hasParameters() {
    return !(inParameters.isEmpty() && outParameters.isEmpty());
  }

  @Override
  public int hashCode() {
    int result = super.hashCode();
    result = 31 * result + (deprecatedComment != null ? deprecatedComment.hashCode() : 0);
    result = 31 * result + (returnType != null ? returnType.hashCode() : 0);
    result = 31 * result + (specifiers != null ? specifiers.hashCode() : 0);
    result = 31 * result + (inParameters != null ? inParameters.hashCode() : 0);
    result = 31 * result + (outParameters != null ? outParameters.hashCode() : 0);
    result = 31 * result + (mbt != null ? mbt.hashCode() : 0);
    return result;
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.concat(
        Stream.of(returnType), Stream.concat(inParameters.stream(), outParameters.stream()));
  }
}
