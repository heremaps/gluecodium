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
import org.franca.core.franca.*;
import org.franca.deploymodel.core.FDModelExtender;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.fDeploy.FDModel;

/** Model combining multiple FDModel instances into one. */
public class FrancaDeploymentModel {

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
                    fdInterface -> buildKey(fdInterface.getTarget()),
                    NameBasedPropertyAccessor::new)));
    propertyAccessors.putAll(
        fdModelExtenders
            .stream()
            .flatMap(extender -> extender.getFDTypesList().stream())
            .collect(
                Collectors.toMap(
                    fdTypeCollection -> buildKey(fdTypeCollection.getTarget()),
                    NameBasedPropertyAccessor::new)));
  }

  @SuppressWarnings("unused")
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

  private boolean getBoolean(final FModelElement francaModelElement, final String valueName) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(francaModelElement);
    MappingGenericPropertyAccessor propertyAccessor =
        propertyAccessors.get(buildKey(typeCollection));

    return propertyAccessor != null && propertyAccessor.getBoolean(francaModelElement, valueName);
  }

  private static String buildKey(final FTypeCollection francaTypeCollection) {
    FModel francaModel = (FModel) francaTypeCollection.eContainer();
    return francaModel.getName() + "." + francaTypeCollection.getName();
  }
}
