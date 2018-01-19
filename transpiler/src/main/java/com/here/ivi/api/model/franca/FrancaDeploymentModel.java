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
import org.franca.deploymodel.dsl.fDeploy.FDInterface;
import org.franca.deploymodel.dsl.fDeploy.FDModel;
import org.franca.deploymodel.dsl.fDeploy.FDTypes;

/** Model combining multiple FDModel instances into one. */
public class FrancaDeploymentModel {

  private final Map<String, List<MappingGenericPropertyAccessor>> propertyAccessors =
      new HashMap<>();

  public FrancaDeploymentModel(final Collection<FDModel> models) {

    List<FDModelExtender> fdModelExtenders =
        models.stream().map(FDModelExtender::new).collect(Collectors.toList());

    fdModelExtenders
        .stream()
        .flatMap(extender -> extender.getFDInterfaces().stream())
        .forEach(this::addDeploymentInterface);
    fdModelExtenders
        .stream()
        .flatMap(extender -> extender.getFDTypesList().stream())
        .forEach(this::addDeploymentTypeCollection);
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

  @SuppressWarnings("unused")
  public boolean isSerializable(final FStructType francaStruct) {
    return getBoolean(francaStruct, "Serializable");
  }

  public String getDefaultValue(final FField francaField) {
    return getString(francaField, "DefaultValue");
  }

  private boolean getBoolean(final FModelElement francaModelElement, final String valueName) {

    List<MappingGenericPropertyAccessor> propertyAccessorsForModelElement =
        getPropertyAccessors(francaModelElement);

    return propertyAccessorsForModelElement != null
        && propertyAccessorsForModelElement
            .stream()
            .anyMatch(
                accessor ->
                    Boolean.TRUE.equals(accessor.getBoolean(francaModelElement, valueName)));
  }

  private String getString(final FModelElement francaModelElement, final String valueName) {

    List<MappingGenericPropertyAccessor> propertyAccessorsForModelElement =
        getPropertyAccessors(francaModelElement);

    return propertyAccessorsForModelElement != null
        ? propertyAccessorsForModelElement
            .stream()
            .map(accessor -> accessor.getString(francaModelElement, valueName))
            .filter(Objects::nonNull)
            .findAny()
            .orElse(null)
        : null;
  }

  private List<MappingGenericPropertyAccessor> getPropertyAccessors(
      final FModelElement francaModelElement) {
    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(francaModelElement);
    return propertyAccessors.get(buildKey(typeCollection));
  }

  private static String buildKey(final FTypeCollection francaTypeCollection) {
    if (francaTypeCollection.getName() == null) {
      return null;
    }
    return DefinedBy.getModelName(francaTypeCollection) + "." + francaTypeCollection.getName();
  }

  private void addDeploymentInterface(final FDInterface fdInterface) {
    propertyAccessors
        .computeIfAbsent(buildKey(fdInterface.getTarget()), key -> new LinkedList<>())
        .add(new NameBasedPropertyAccessor(fdInterface));
  }

  private void addDeploymentTypeCollection(final FDTypes fdTypeCollection) {
    propertyAccessors
        .computeIfAbsent(buildKey(fdTypeCollection.getTarget()), key -> new LinkedList<>())
        .add(new NameBasedPropertyAccessor(fdTypeCollection));
  }
}
