/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.cpp;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import lombok.EqualsAndHashCode;
import org.jetbrains.annotations.NotNull;

@EqualsAndHashCode
public class CppForwardDeclaration implements Comparable<CppForwardDeclaration> {
  public final List<String> namespaces;
  public final String type;

  public CppForwardDeclaration(String fullName) {
    List<String> split =
        Arrays.stream(fullName.split("::"))
            .filter(string -> !string.isEmpty())
            .collect(Collectors.toList());
    type = split.get(split.size() - 1);
    namespaces = split.subList(0, split.size() - 1);
  }

  public String fullyQualified() {
    return String.join("::", namespaces) + "::" + type;
  }

  @Override
  public int compareTo(@NotNull CppForwardDeclaration cppForwardDeclaration) {
    return fullyQualified().compareTo(cppForwardDeclaration.fullyQualified());
  }
}
