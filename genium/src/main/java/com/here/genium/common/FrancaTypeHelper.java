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

package com.here.genium.common;

import com.here.genium.model.franca.DefinedBy;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

public final class FrancaTypeHelper {

  public static List<String> getElementPath(final FModelElement modelElement) {

    String suffix = modelElement instanceof FMethod ? ((FMethod) modelElement).getSelector() : null;
    String elementName =
        suffix != null ? modelElement.getName() + ":" + suffix : modelElement.getName();

    LinkedList<String> result = new LinkedList<>();
    result.add(elementName);

    EObject parent = modelElement.eContainer();
    if (parent instanceof FModelElement) {
      result.addAll(0, getElementPath((FModelElement) parent));
    } else if (parent instanceof FModel) {
      result.addFirst(((FModel) parent).getName());
    }

    return result;
  }

  public static String getFullName(final FModelElement modelElement) {
    return String.join(".", getElementPath(modelElement));
  }

  public static boolean haveSamePackage(
      final FModelElement francaModeElement1, final FModelElement francaModeElement2) {
    return Objects.equals(
        DefinedBy.getModelName(francaModeElement1), DefinedBy.getModelName(francaModeElement2));
  }

  private static Stream<EObject> getAllChildElements(final FTypeCollection francaTypeCollection) {
    @SuppressWarnings("NullableProblems")
    Iterable<EObject> iterable = francaTypeCollection::eAllContents;
    return StreamSupport.stream(iterable.spliterator(), false);
  }

  public static Stream<EObject> getAllElements(final FTypeCollection francaTypeCollection) {
    return Stream.concat(
        Stream.of(francaTypeCollection), getAllChildElements(francaTypeCollection));
  }
}
