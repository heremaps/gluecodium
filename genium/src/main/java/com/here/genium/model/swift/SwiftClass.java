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

package com.here.genium.model.swift;

import java.util.LinkedList;
import java.util.List;

public final class SwiftClass extends SwiftType {

  public final boolean isInterface;
  public final String parentClass;
  public final List<String> implementsProtocols = new LinkedList<>();
  public final List<SwiftProperty> properties = new LinkedList<>();
  public final List<SwiftMethod> methods = new LinkedList<>();
  public final List<SwiftContainerType> structs = new LinkedList<>();
  public final List<SwiftEnum> enums = new LinkedList<>();
  public final String nameSpace;
  public final String cInstance;
  public final List<SwiftTypeDef> typedefs = new LinkedList<>();
  public final List<SwiftConstant> constants = new LinkedList<>();
  public final String functionTableName;
  public final boolean useParentCInstance;

  @SuppressWarnings("ParameterNumber")
  @lombok.Builder(builderClassName = "Builder")
  private SwiftClass(
      final String name,
      final SwiftVisibility visibility,
      final boolean isInterface,
      final String parentClass,
      final String nameSpace,
      final String cInstance,
      final String functionTableName,
      final boolean useParentCInstance) {
    super(name, visibility, TypeCategory.CLASS, null, name, false);
    this.isInterface = isInterface;
    this.parentClass = parentClass;
    this.nameSpace = nameSpace;
    this.cInstance = cInstance;
    this.functionTableName = functionTableName;
    this.useParentCInstance = useParentCInstance;
  }

  @SuppressWarnings("unused")
  public boolean hasParents() {
    return parentClass != null || !implementsProtocols.isEmpty();
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }
}
