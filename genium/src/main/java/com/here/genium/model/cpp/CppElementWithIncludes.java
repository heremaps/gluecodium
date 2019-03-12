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

import com.here.genium.model.common.Include;
import java.util.*;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public abstract class CppElementWithIncludes extends CppElement {

  public final List<Include> includes;

  protected CppElementWithIncludes(final String name, final Collection<Include> includes) {
    this(name, name, includes);
  }

  private CppElementWithIncludes(
      final String name, final String fullyQualifiedName, final Collection<Include> includes) {
    super(name, fullyQualifiedName);
    this.includes = includes != null ? new LinkedList<>(includes) : new LinkedList<>();
  }
}
