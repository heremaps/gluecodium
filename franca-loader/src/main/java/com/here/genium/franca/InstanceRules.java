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

package com.here.genium.franca;

import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

/**
 * This class handles the specific rules for identifying instance references.
 *
 * <p>Each generator has to use the rules to determine if instances of another type.
 */
public final class InstanceRules {
  /**
   * This method is used to check if a typedef is for an instance by checking that the typedef
   * refers to undefined and that has the same name as a the containing class.
   *
   * @param typedef a Franca TypeDef to check.
   * @return `true` if the given TypeDef represents and instance, `false` otherwise.
   */
  public static boolean isInstanceId(FTypeDef typedef) {
    FTypeRef type = typedef.getActualType();
    if (type.getDerived() != null || type.getPredefined() != FBasicTypeId.UNDEFINED) {
      return false;
    }

    String className = DefinedBy.findDefiningTypeCollection(typedef).getName();

    return typedef.getName().equals(className);
  }

  public static boolean isInstanceId(FTypeRef typeRef) {
    FType derived = typeRef.getDerived();

    return derived instanceof FTypeDef && InstanceRules.isInstanceId((FTypeDef) derived);
  }
}
