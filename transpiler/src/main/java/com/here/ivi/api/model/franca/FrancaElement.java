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
import lombok.EqualsAndHashCode;
import org.franca.core.franca.*;

@EqualsAndHashCode
public class FrancaElement {

  private final FTypeCollection francaTypeCollection;
  private final List<String> packageNames;

  protected FrancaElement(final FTypeCollection francaTypeCollection) {
    this.francaTypeCollection = francaTypeCollection;

    packageNames = DefinedBy.getPackages((FModel) francaTypeCollection.eContainer());
  }

  public FTypeCollection getFrancaTypeCollection() {
    return francaTypeCollection;
  }

  public String getName() {
    return francaTypeCollection.getName();
  }

  @SuppressWarnings("unused")
  public List<String> getPackageNames() {
    return packageNames;
  }

  public FModel getFrancaModel() {
    return (FModel) francaTypeCollection.eContainer();
  }
}
