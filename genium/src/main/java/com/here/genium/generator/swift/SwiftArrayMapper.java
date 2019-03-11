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

package com.here.genium.generator.swift;

import com.here.genium.generator.cbridge.CArrayMapper;
import com.here.genium.model.swift.*;
import org.eclipse.emf.ecore.EObject;

public final class SwiftArrayMapper {

  public static SwiftArray create(final SwiftType underlyingType, final EObject francaElement) {
    return new SwiftArray(
        underlyingType,
        SwiftNameRules.getArrayName(underlyingType),
        CArrayMapper.addPrefix(CArrayMapper.getName(francaElement) + addSuffix(underlyingType)));
  }

  private static String addSuffix(final SwiftType innerType) {
    SwiftArray arrayType = innerType instanceof SwiftArray ? (SwiftArray) innerType : null;
    return arrayType != null && arrayType.underlyingType != null
        ? addSuffix(arrayType.underlyingType) + "Array"
        : "";
  }
}
