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

import java.util.stream.Stream;

public class CppInheritance extends CppElement {

  public enum Type {
    Public("public"),
    Protected("protected"),
    Private("private");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return value;
    }
  }

  public final CppTypeRef parent;
  public final Type visibility;

  public CppInheritance(CppTypeRef parent, Type type) {
    super(null, null);
    this.parent = parent;
    this.visibility = type;
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return Stream.of(parent);
  }
}
