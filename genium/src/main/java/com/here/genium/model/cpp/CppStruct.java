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

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public final class CppStruct extends CppElementWithComment {

  public final List<CppField> fields = new LinkedList<>();
  public final Set<CppInheritance> inheritances = new LinkedHashSet<>();
  public final boolean isExternal;

  public CppStruct(final String name) {
    this(name, name, false);
  }

  public CppStruct(final String name, final String fullyQualifiedName, final boolean isExternal) {
    super(name, fullyQualifiedName, null);
    this.isExternal = isExternal;
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(fields, inheritances).flatMap(Collection::stream);
  }
}
