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
import java.util.Arrays;
import java.util.List;
import lombok.EqualsAndHashCode;
import org.franca.core.franca.*;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;

@EqualsAndHashCode
public abstract class FrancaElement {

  private final MappingGenericPropertyAccessor propertyAccessor;
  private final FModel francaModel;
  private final List<String> packageNames;

  protected FrancaElement(
      final MappingGenericPropertyAccessor propertyAccessor, final FModel francaModel) {
    this.propertyAccessor = propertyAccessor;
    this.francaModel = francaModel;
    packageNames = Arrays.asList(francaModel.getName().split("\\."));
  }

  public abstract FTypeCollection getFrancaTypeCollection();

  public String getName() {
    return getFrancaTypeCollection().getName();
  }

  public Version getVersion() {
    FVersion francaVersion = getFrancaTypeCollection().getVersion();
    if (francaVersion != null) {
      return Version.createFromFrancaVersion(francaVersion);
    } else {
      return new Version(0, 0, 0, "");
    }
  }

  public boolean isInterface(final FInterface francaInterface) {
    return getBoolean(francaInterface, "IsInterface");
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

  public List<String> getPackageNames() {
    return packageNames;
  }

  public FModel getFrancaModel() {
    return francaModel;
  }

  private boolean getBoolean(final FModelElement francaModelElement, final String valueName) {
    Boolean result = propertyAccessor.getBoolean(francaModelElement, valueName);
    return result != null && result;
  }
}
