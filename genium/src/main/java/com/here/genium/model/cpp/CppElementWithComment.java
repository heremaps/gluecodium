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

import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
public abstract class CppElementWithComment extends CppElement {

  public String comment;

  protected CppElementWithComment(final String name) {
    this(name, name, null);
  }

  protected CppElementWithComment(final String name, final String fullyQualifiedName) {
    this(name, fullyQualifiedName, null);
  }

  protected CppElementWithComment(
      final String name, final String fullyQualifiedName, final String comment) {
    super(name, fullyQualifiedName);
    this.comment = comment;
  }
}
