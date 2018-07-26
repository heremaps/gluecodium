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

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Stream;

public final class CppEnum extends CppElementWithComment {

  public final boolean isScoped;
  public final boolean isExternal;
  public final List<CppEnumItem> items = new LinkedList<>();

  @lombok.Builder(builderClassName = "Builder")
  private CppEnum(
      final String name,
      final String fullyQualifiedName,
      final boolean isScoped,
      final boolean isExternal) {
    super(name, fullyQualifiedName);
    this.isScoped = isScoped;
    this.isExternal = isExternal;
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return items.stream();
  }
}
