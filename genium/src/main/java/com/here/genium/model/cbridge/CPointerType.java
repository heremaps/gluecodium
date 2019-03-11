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

package com.here.genium.model.cbridge;

public final class CPointerType extends CType {

  public static final CPointerType CONST_CHAR_PTR = makeConstPointer(CType.CHAR);

  private final CType pointedType;

  private CPointerType(CType type) {
    super("*", type.includes);
    pointedType = type;
  }

  public static CPointerType makeConstPointer(CType type) {
    CType underlyingType = new CType(type.name, type.includes);
    underlyingType.isConst = true;
    return new CPointerType(underlyingType);
  }

  @Override
  public String toString() {
    StringBuilder fullType = new StringBuilder().append(pointedType.toString()).append(name);
    if (isConst) {
      fullType.append(' ').append(CONST_SPECIFIER);
    }
    return fullType.toString();
  }
}
