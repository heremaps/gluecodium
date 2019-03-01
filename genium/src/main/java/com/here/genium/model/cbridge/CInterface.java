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

package com.here.genium.model.cbridge;

import com.here.genium.generator.cbridge.CppTypeInfo;
import com.here.genium.model.common.Include;
import java.util.*;

/** Collection of related methods and structs forming an interface (like a C header file) */
public final class CInterface extends CElement {
  public final Set<Include> headerIncludes = new TreeSet<>();
  public final Set<Include> implementationIncludes = new TreeSet<>();
  public final Set<Include> privateHeaderIncludes = new TreeSet<>();
  public final List<CStruct> structs = new LinkedList<>();
  public final List<CFunction> inheritedFunctions = new LinkedList<>();
  public final List<CFunction> functions = new LinkedList<>();
  public String functionTableName;
  public final CppTypeInfo selfType;
  public final List<CEnum> enums = new LinkedList<>();
  public final List<CMap> maps = new LinkedList<>();
  public final String internalNamespace;

  public CInterface(final String name, final String internalNamespace) {
    this(name, null, internalNamespace);
  }

  public CInterface(final String name, final CppTypeInfo selfType, final String internalNamespace) {
    super(name);
    this.selfType = selfType;
    this.internalNamespace = internalNamespace;
  }

  public boolean isInterface() {
    // only interfaces have a functionTableName
    return functionTableName != null && !functionTableName.isEmpty() && selfType != null;
  }
}
