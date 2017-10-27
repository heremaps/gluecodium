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

import com.here.ivi.api.TranspilerExecutionException;
import java.util.List;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.util.Strings;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

/** This class is used for resolving namespaces and includes. */
public final class DefinedBy {

  /**
   * Find the TypeCollection that contains this type by moving up the hierarchy recursively
   *
   * @param modelElement The franca object
   * @return The type collection that contains this type
   */
  public static FTypeCollection findDefiningTypeCollection(final EObject modelElement) {
    if (modelElement instanceof FTypeCollection) {
      return (FTypeCollection) modelElement; // FInterface is a FTypeCollection as well
    }

    EObject parent = modelElement.eContainer();
    if (parent == null) {
      throw new TranspilerExecutionException("Invalid model element: " + modelElement);
    }

    return findDefiningTypeCollection(parent);
  }

  public static List<String> getPackages(final FTypeCollection francaTypeCollection) {
    return Strings.split(getModelName(francaTypeCollection), ".");
  }

  public static String getModelName(final FTypeCollection typeCollection) {
    return ((FModel) typeCollection.eContainer()).getName();
  }
}
