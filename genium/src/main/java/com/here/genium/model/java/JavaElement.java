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

import com.here.genium.model.common.ModelElement;
import com.here.genium.model.common.Streamable;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.stream.Stream;

public abstract class JavaElement extends Streamable<JavaElement> implements ModelElement {

  public final String name;
  public String comment = "";
  public JavaVisibility visibility = JavaVisibility.PACKAGE;
  public final Collection<JavaType> annotations = new LinkedHashSet<>();

  public JavaElement(final String name) {
    super();
    this.name = name;
  }

  @Override
  public String toString() {
    return name;
  }

  @Override
  public Stream<JavaElement> stream() {
    return annotations.stream().map(JavaElement.class::cast);
  }
}
