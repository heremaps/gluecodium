/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.cpp;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.cpp.TopologicalSort;
import com.here.genium.model.common.Include;
import java.util.*;
import java.util.stream.Collectors;

public final class CppFile {

  public final List<String> namespace;
  public final List<CppElement> members = new LinkedList<>();
  public final Set<Include> includes = new TreeSet<>();
  public final Set<CppForwardDeclaration> forwardDeclarations = new TreeSet<>();
  public Include headerInclude;

  public CppFile(List<String> namespace) {
    this.namespace = namespace;
  }

  public boolean isEmpty() {
    return members.isEmpty();
  }

  @SuppressWarnings("unused")
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

  @SuppressWarnings("unused")
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

  @SuppressWarnings("unused")
  public List<CppClass> getClasses() {
    return CollectionsHelper.getAllOfType(members, CppClass.class);
  }
}
