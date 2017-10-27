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
import java.util.stream.Stream;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;

public final class FrancaModel {

  public final FrancaDeploymentModel deploymentModel;
  public final List<FInterface> interfaces;
  public final List<FTypeCollection> typeCollections;

  public FrancaModel(
      final FrancaDeploymentModel deploymentModel,
      final List<FInterface> interfaces,
      final List<FTypeCollection> typeCollections) {
    this.deploymentModel = deploymentModel;
    this.interfaces = interfaces;
    this.typeCollections = typeCollections;
  }

  public Stream<FTypeCollection> stream() {
    return Stream.concat(interfaces.stream(), typeCollections.stream());
  }
}
