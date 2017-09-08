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

/**
 * This class stores the information where a type was defined
 *
 * <p>It is used for resolving namespaces and includes.
 */
public final class DefinedBy {

  public final FTypeCollection type; // A FInterface is a FTypeCollection as well
  public final FModel model;

  private DefinedBy(FTypeCollection type, FModel model) {
    this.type = type;
    this.model = model;
  }

  /**
   * Gets the model and interface that defined the given franca object
   *
   * @param obj The franca model object
   * @return The model and interface that defined the given object
   */
  public static DefinedBy createFromFModelElement(EObject obj) {
    // search for parent type collection
    FTypeCollection tc = findDefiningTypeCollection(obj);

    if (tc == null || !(tc.eContainer() instanceof FModel)) {
      throw new TranspilerExecutionException(
          "Could not resolve root of EObject. Invalid franca definition. " + obj);
    }

    FModel model = (FModel) tc.eContainer();
    return new DefinedBy(tc, model);
  }

  /**
   * Gets the model and interface that defined the given franca element
   *
   * @param francaElement The franca element
   * @return The model and interface that defined the given object
   */
  public static DefinedBy createFromFrancaElement(FrancaElement francaElement) {
    return new DefinedBy(francaElement.getFrancaTypeCollection(), francaElement.getFrancaModel());
  }

  /** Returns the base name, eg. MyInterface */
  public String getBaseName() {
    return type.getName();
  }

  /** Returns the full package name, eg. com.here.navigation.guidance */
  public String getPackageName() {
    return model.getName();
  }

  /** Returns the split packages from the model */
  public List<String> getPackages() {
    return Strings.split(getPackageName(), ".");
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    DefinedBy definedBy = (DefinedBy) o;

    return getBaseName().equals(definedBy.getBaseName())
        && getPackageName().equals(definedBy.getPackageName());
  }

  @Override
  public int hashCode() {
    int result = getPackageName().hashCode();
    result = 31 * result + getBaseName().hashCode();
    return result;
  }

  @Override
  public String toString() {
    return getPackageName() + "." + getBaseName();
  }

  /**
   * Find the TypeCollection that contains this type by moving up the hierarchy recursively
   *
   * @param obj The franca object
   * @return The type collection that contains this type
   */
  private static FTypeCollection findDefiningTypeCollection(EObject obj) {
    if (obj instanceof FTypeCollection) {
      return (FTypeCollection) obj; // FInterface is a FTypeCollection as well
    }

    EObject parent = obj.eContainer();

    if (parent == obj || parent == null) { // NOPMD
      return null;
    }

    return findDefiningTypeCollection(parent);
  }
}
