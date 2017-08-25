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

import com.here.ivi.api.generator.common.Version;
import org.franca.core.franca.*;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;

public abstract class FrancaElement {

  private final MappingGenericPropertyAccessor propertyAccessor;
  private final ModelInfo modelInfo;

  protected FrancaElement(
      final MappingGenericPropertyAccessor propertyAccessor, final ModelInfo modelInfo) {
    this.propertyAccessor = propertyAccessor;
    this.modelInfo = modelInfo;
  }

  public abstract FTypeCollection getFrancaTypeCollection();

  public String getName() {
    return getFrancaTypeCollection().getName();
  }

  public ModelInfo getModelInfo() {
    return modelInfo;
  }

  public Version getVersion() {
    FVersion francaVersion = getFrancaTypeCollection().getVersion();
    if (francaVersion != null) {
      return Version.createFromFrancaVersion(francaVersion);
    } else {
      return new Version(0, 0, 0, "");
    }
  }

  public boolean isStatic(final FMethod francaMethod) {
    return getBoolean(francaMethod, "Static");
  }

  public boolean isConst(final FMethod francaMethod) {
    return getBoolean(francaMethod, "Const");
  }

  @SuppressWarnings("unused")
  public boolean isSet(final FArrayType francaArray) {
    return getBoolean(francaArray, "Set");
  }

  @Override
  public boolean equals(Object o) {
    if (!(o instanceof FrancaElement)) {
      return false;
    }
    FrancaElement co = (FrancaElement) o;
    return getName().equals(co.getName())
        && modelInfo.getFModel().getName().equals(co.getModelInfo().getFModel().getName());
  }

  @Override
  public int hashCode() {
    int result = propertyAccessor != null ? propertyAccessor.hashCode() : 0;
    result = 31 * result + (modelInfo != null ? modelInfo.hashCode() : 0);
    return result;
  }

  private boolean getBoolean(final FModelElement francaModelElement, final String valueName) {
    Boolean result = propertyAccessor.getBoolean(francaModelElement, valueName);
    return result != null && result;
  }
}
