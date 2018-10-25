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

package com.here.genium.common;

import com.here.genium.model.franca.DefinedBy;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

public final class FrancaTypeHelper {

  public interface ErrorEnumFilter {
    boolean isErrorEnum(FEnumerationType enumType);
  }

  public static ErrorEnumFilter getErrorEnumFilter(
      final Collection<FTypeCollection> fTypeCollections) {
    final Set<String> result =
        fTypeCollections
            .stream()
            .map(FrancaTypeHelper::getAllElements)
            .flatMap(str -> CollectionsHelper.getStreamOfType(str, FMethod.class))
            .map(FMethod::getErrorEnum)
            .filter(Objects::nonNull)
            .map(FrancaTypeHelper::getFullName)
            .collect(Collectors.toSet());

    return fEnumType -> result.contains(getFullName(fEnumType));
  }

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

  public static boolean haveSamePackage(
      final FModelElement francaModeElement1, final FModelElement francaModeElement2) {
    return Objects.equals(
        DefinedBy.getModelName(francaModeElement1), DefinedBy.getModelName(francaModeElement2));
  }

  public static Stream<EObject> getAllElements(final FTypeCollection francaTypeCollection) {
    @SuppressWarnings("NullableProblems")
    Iterable<EObject> iterable = francaTypeCollection::eAllContents;
    return StreamSupport.stream(iterable.spliterator(), false);
  }

  private static boolean isArray(final FTypedElement francaTypedElement) {
    return francaTypedElement.isArray() || isArray(francaTypedElement.getType().getDerived());
  }

  private static boolean isArray(final FType francaType) {
    return francaType instanceof FArrayType
        || (francaType instanceof FTypeDef
            && isArray(((FTypeDef) francaType).getActualType().getDerived()));
  }

  public static List<FMethod> getAllOverloads(final FMethod francaMethod) {
    EObject parent = francaMethod.eContainer();
    return parent instanceof FInterface
        ? ((FInterface) parent)
            .getMethods()
            .stream()
            .filter(method -> method.getName().equals(francaMethod.getName()))
            .collect(Collectors.toList())
        : Collections.emptyList();
  }
}
