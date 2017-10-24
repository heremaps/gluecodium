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

import java.util.*;
import java.util.stream.Collectors;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDModelExtender;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.fDeploy.FDModel;

/** Model combining multiple FDModel instances into one. */
public final class FrancaDeploymentModel {

  private final Map<String, MappingGenericPropertyAccessor> propertyAccessors = new HashMap<>();

  public FrancaDeploymentModel(final Collection<FDModel> models) {

    List<FDModelExtender> fdModelExtenders =
        models.stream().map(FDModelExtender::new).collect(Collectors.toList());
    propertyAccessors.putAll(
        fdModelExtenders
            .stream()
            .flatMap(extender -> extender.getFDInterfaces().stream())
            .collect(
                Collectors.toMap(
                    fdInterface -> fdInterface.getTarget().getName(),
                    NameBasedPropertyAccessor::new)));
    propertyAccessors.putAll(
        fdModelExtenders
            .stream()
            .flatMap(extender -> extender.getFDTypesList().stream())
            .collect(
                Collectors.toMap(
                    fdTypeCollection -> fdTypeCollection.getTarget().getName(),
                    NameBasedPropertyAccessor::new)));
  }

  public MappingGenericPropertyAccessor getPropertyAccessor(
      final FTypeCollection francaTypeCollection) {

    return propertyAccessors.computeIfAbsent(
        francaTypeCollection.getName(), key -> new DummyPropertyAccessor());
  }
}
