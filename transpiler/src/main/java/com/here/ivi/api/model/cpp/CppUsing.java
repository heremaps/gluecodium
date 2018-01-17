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

package com.here.ivi.api.model.cpp;

import java.util.stream.Stream;

public final class CppUsing extends CppElementWithComment {

  public final CppTypeRef definition;

  @lombok.Builder(builderClassName = "Builder")
  private CppUsing(
      final String name,
      final String fullyQualifiedName,
      final CppTypeRef definition,
      final String comment) {
    super(name, fullyQualifiedName, comment);
    this.definition = definition;
  }

  public static Builder builder(final String name, final CppTypeRef definition) {
    return new Builder().name(name).fullyQualifiedName(name).definition(definition);
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(definition);
  }
}
