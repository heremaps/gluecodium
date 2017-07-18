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
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class CppNamespace {

  public final List<String> name;
  public List<CppElement> members = new ArrayList<>();

  public CppNamespace(List<String> name) {
    this.name = name;
  }

  public boolean isEmpty() {
    return members.isEmpty();
  }

  public final Stream<CppElement> streamRecursive() {
    return members.stream().filter(Objects::nonNull).flatMap(CppElement::streamRecursive);
  }

  public Set<Include> collectIncludes() {
    return streamRecursive()
        .filter(p -> p instanceof CppElementWithIncludes)
        .map(CppElementWithIncludes.class::cast)
        .map(t -> t.includes)
        .flatMap(Set::stream)
        .collect(Collectors.toSet());
  }
}
