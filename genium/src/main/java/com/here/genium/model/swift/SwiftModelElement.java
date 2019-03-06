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

package com.here.genium.model.swift;

import java.util.List;
import org.trimou.util.Strings;

public abstract class SwiftModelElement {

  public final String name;
  public final SwiftVisibility visibility;
  public String comment = "";

  public SwiftModelElement(final String name) {
    this(name, null);
  }

  public SwiftModelElement(final String name, final SwiftVisibility visibility) {
    this.name = name;
    this.visibility = visibility != null ? visibility : SwiftVisibility.PUBLIC;
  }

  @Override
  public String toString() {
    return name;
  }

  @SuppressWarnings("unused")
  public String getSimpleName() {
    List<String> parts = Strings.split(name, ".");
    return parts.get(parts.size() - 1);
  }
}
