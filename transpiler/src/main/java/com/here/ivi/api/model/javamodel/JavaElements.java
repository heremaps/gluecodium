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

import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class JavaElements {
  public static SortedSet<JavaImport> collectImports(JavaElement root) {
    return root.streamRecursive()
        .filter(p -> p instanceof JavaElementWithImports)
        .map(JavaElementWithImports.class::cast)
        .map(t -> t.imports)
        .flatMap(Set::stream)
        .collect(Collectors.toCollection(TreeSet::new));
  }
}
