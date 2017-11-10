/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.franca;

import java.util.List;
import org.eclipse.xtext.util.Strings;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FQualifiedElementRef;
import org.franca.core.franca.FTypeCollection;

/** This class is used for resolving namespaces and includes. */
public final class DefinedBy {

  /**
   * Find the TypeCollection that contains this type by moving up the hierarchy recursively
   *
   * @param modelElement The franca object
   * @return The type collection that contains this type
   */
  public static FTypeCollection findDefiningTypeCollection(final FModelElement modelElement) {
    return modelElement instanceof FTypeCollection
        ? (FTypeCollection) modelElement
        : findDefiningTypeCollection((FModelElement) modelElement.eContainer());
  }

  public static FTypeCollection findDefiningTypeCollection(
      final FQualifiedElementRef qualifiedElementRef) {
    return findDefiningTypeCollection((FModelElement) qualifiedElementRef.eContainer());
  }

  public static List<String> getPackages(final FTypeCollection francaTypeCollection) {
    return Strings.split(getModelName(francaTypeCollection), ".");
  }

  public static String getModelName(final FTypeCollection typeCollection) {
    return ((FModel) typeCollection.eContainer()).getName();
  }
}
