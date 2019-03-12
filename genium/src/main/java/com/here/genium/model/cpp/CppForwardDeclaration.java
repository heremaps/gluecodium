/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import lombok.EqualsAndHashCode;
import org.jetbrains.annotations.NotNull;

@EqualsAndHashCode
public class CppForwardDeclaration implements Comparable<CppForwardDeclaration> {

  public final List<String> namespaces;
  public final String type;

  public CppForwardDeclaration(final String fullName) {
    List<String> split =
        Arrays.stream(fullName.split("::"))
            .filter(string -> !string.isEmpty())
            .collect(Collectors.toList());
    type = split.get(split.size() - 1);
    namespaces = split.subList(0, split.size() - 1);
  }

  private String getFullName() {
    return String.join("::", namespaces) + "::" + type;
  }

  @Override
  public int compareTo(@NotNull CppForwardDeclaration cppForwardDeclaration) {
    return getFullName().compareTo(cppForwardDeclaration.getFullName());
  }
}
