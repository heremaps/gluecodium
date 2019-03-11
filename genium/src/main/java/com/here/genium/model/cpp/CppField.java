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

import com.google.common.base.Strings;
import java.util.stream.Stream;

public final class CppField extends CppTypedElement {

  public final CppValue initializer;
  public final boolean isNotNull;

  public CppField(final String name, final CppTypeRef type) {
    this(name, type, null, false);
  }

  @lombok.Builder(builderClassName = "Builder")
  private CppField(
      final String name,
      final CppTypeRef type,
      final CppValue initializer,
      final boolean isNotNull) {
    super(name, type);
    this.initializer = initializer;
    this.isNotNull = isNotNull;
  }

  public static Builder builder(final String name, final CppTypeRef type) {
    return new Builder().name(name).type(type);
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(type, initializer);
  }

  @SuppressWarnings("unused")
  public boolean hasComment() {
    return !Strings.isNullOrEmpty(comment) || isNotNull;
  }
}
