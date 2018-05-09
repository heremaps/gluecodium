/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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

/** Field of a com.here.genium.model.cbridge.CStruct */
@SuppressWarnings("PMD.MissingStaticMethodInNonInstantiatableClass")
public final class CField extends CElement {

  public final String baseLayerName;
  public final CppTypeInfo type;
  public final String baseLayerGetterName;
  public final String baseLayerSetterName;

  @lombok.Builder(builderClassName = "Builder")
  private CField(
      final String swiftLayerName,
      final String baseLayerName,
      final CppTypeInfo cppTypeInfo,
      final String baseLayerGetterName,
      final String baseLayerSetterName) {
    super(swiftLayerName);
    this.baseLayerName = baseLayerName;
    this.type = cppTypeInfo;
    this.baseLayerGetterName = baseLayerGetterName;
    this.baseLayerSetterName = baseLayerSetterName;
  }

  @Override
  public String toString() {
    return type.functionReturnType + " " + name;
  }
}
