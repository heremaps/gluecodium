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

package com.here.genium.model.java;

import java.util.stream.Stream;
import org.apache.commons.lang3.StringUtils;

public final class JavaField extends JavaTypedElement {

  public final JavaValue initial;
  public final boolean isNonNull;

  @lombok.Builder(builderClassName = "Builder")
  private JavaField(
      final String name, final JavaType type, final JavaValue initial, final boolean isNonNull) {
    super(name, type);
    this.initial = initial;
    this.isNonNull = isNonNull;
  }

  public static Builder builder(final String name, final JavaType type) {
    return new Builder().name(name).type(type);
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.concat(super.stream(), Stream.of(initial));
  }

  @SuppressWarnings("unused")
  public boolean hasComment() {
    return StringUtils.isNotEmpty(comment) || isNonNull;
  }
}
