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

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.TopologicalSort;
import com.here.ivi.api.model.common.Include;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class CppFile {

  public final List<String> namespace;
  public final List<CppElement> members = new LinkedList<>();
  public final Set<Include> includes = new TreeSet<>();

  public CppFile(List<String> namespace) {
    this.namespace = namespace;
  }

  public boolean isEmpty() {
    return members.isEmpty();
  }

  public boolean hasSortedMembers() {
    return members
        .stream()
        .anyMatch(
            member ->
                member instanceof CppEnum
                    || member instanceof CppConstant
                    || member instanceof CppStruct
                    || member instanceof CppUsing);
  }

  public List<CppElement> getSortedMembers() {
    List<CppElement> unsortedMembers =
        members
            .stream()
            .filter(
                member ->
                    member instanceof CppEnum
                        || member instanceof CppConstant
                        || member instanceof CppStruct
                        || member instanceof CppUsing)
            .collect(Collectors.toList());

    return new TopologicalSort(unsortedMembers).sort();
  }

  public final Stream<? extends CppElement> streamRecursive() {
    return members.stream().filter(Objects::nonNull).flatMap(CppElement::streamRecursive);
  }

  @SuppressWarnings("unused")
  public List<CppConstant> getConstants() {
    return CollectionsHelper.getAllOfType(members, CppConstant.class);
  }

  @SuppressWarnings("unused")
  public List<CppUsing> getUsings() {
    return CollectionsHelper.getAllOfType(members, CppUsing.class);
  }

  @SuppressWarnings("unused")
  public List<CppEnum> getEnums() {
    return CollectionsHelper.getAllOfType(members, CppEnum.class);
  }

  @SuppressWarnings("unused")
  public List<CppStruct> getStructs() {
    return CollectionsHelper.getAllOfType(members, CppStruct.class);
  }

  @SuppressWarnings("unused")
  public List<CppClass> getClasses() {
    return CollectionsHelper.getAllOfType(members, CppClass.class);
  }
}
