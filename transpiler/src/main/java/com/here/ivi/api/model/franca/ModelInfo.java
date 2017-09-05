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

// Information about the models
public class ModelInfo {
  private final FModel fModel;
  private final List<String> packageNames;

  public ModelInfo(final FModel fModel) {
    this.fModel = fModel;
    packageNames = Strings.split(fModel.getName(), ".");
  }

  public String getName() {
    return fModel.getName();
  }

  public FModel getFModel() {
    return fModel;
  }

  public List<String> getPackageNames() {
    return packageNames;
  }
}
