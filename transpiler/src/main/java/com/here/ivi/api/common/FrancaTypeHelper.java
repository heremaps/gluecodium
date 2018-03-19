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

package com.here.ivi.api.common;

import java.util.Collection;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

public final class FrancaTypeHelper {

  public static boolean isImplicitArray(final FTypeRef typeRef) {
    EObject container = typeRef.eContainer();
    return (container instanceof FTypedElement) && ((FTypedElement) container).isArray();
  }

  public static String getNamespace(final FType type) {
    EObject container = type.eContainer();
    return (container instanceof FInterface) ? ((FInterface) container).getName() : null;
  }

  public static boolean hasArrayParameters(final FMethod francaMethod) {
    Collection<FArgument> francaArguments = francaMethod.getInArgs();
    return francaArguments != null
        && !francaArguments.isEmpty()
        && francaArguments.stream().anyMatch(FrancaTypeHelper::isArray);
  }

  public static String getFullName(final FModelElement modelElement) {

    String suffix = modelElement instanceof FMethod ? ((FMethod) modelElement).getSelector() : null;
    String elementName =
        suffix != null ? modelElement.getName() + ":" + suffix : modelElement.getName();

    EObject parent = modelElement.eContainer();
    if (parent instanceof FModelElement) {
      return getFullName((FModelElement) parent) + "." + elementName;
    } else if (parent instanceof FModel) {
      return ((FModel) parent).getName() + "." + elementName;
    } else {
      return elementName;
    }
  }

  private static boolean isArray(final FTypedElement francaTypedElement) {
    return francaTypedElement.isArray() || isArray(francaTypedElement.getType().getDerived());
  }

  private static boolean isArray(final FType francaType) {
    return francaType instanceof FArrayType
        || (francaType instanceof FTypeDef
            && isArray(((FTypeDef) francaType).getActualType().getDerived()));
  }
}
