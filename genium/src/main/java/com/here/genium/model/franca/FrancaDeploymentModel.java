/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.franca;

import com.here.genium.common.FrancaTypeHelper;
import java.util.*;
import java.util.stream.Collectors;
import org.eclipse.emf.ecore.EObject;
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

  public boolean isConstructor(final FMethod francaMethod) {
    return getBoolean(francaMethod, "Constructor");
  }

  public boolean isSerializable(final FStructType francaStruct) {
    return getBoolean(francaStruct, "Serializable");
  }

  public boolean isEquatable(final FStructType francaStruct) {
    return getBoolean(francaStruct, "Equatable");
  }

  public boolean isImmutable(final FStructType francaStruct) {
    return getBoolean(francaStruct, "Immutable");
  }

  public boolean isNotNull(final FTypedElement francaTypedElement) {
    return getBoolean(francaTypedElement, "NotNull");
  }

  public boolean isNullable(final FTypedElement francaTypedElement) {
    return getBoolean(francaTypedElement, "Nullable");
  }

  public boolean isInternal(final EObject francaElement) {

    if (francaElement == null) {
      return false;
    }

    if (francaElement instanceof FTypeRef) {
      return isInternal(((FTypeRef) francaElement).getDerived());
    }
    if (francaElement instanceof FTypeDef) {
      return isInternal(((FTypeDef) francaElement).getActualType());
    }
    if (francaElement instanceof FConstantDef || francaElement instanceof FArgument) {
      return isInternal(((FTypedElement) francaElement).getType());
    }
    if (francaElement instanceof FMapType) {
      FMapType francaMap = (FMapType) francaElement;
      return isInternal(francaMap.getKeyType()) || isInternal(francaMap.getValueType());
    }

    return francaElement instanceof FModelElement
        && getBoolean((FModelElement) francaElement, "Internal");
  }

  public String getDefaultValue(final FField francaField) {
    return getString(francaField, "DefaultValue");
  }

  public String getExternalType(final FModelElement francaType) {
    return getString(francaType, "ExternalType");
  }

  public boolean isExternalType(final FModelElement francaType) {
    return getExternalType(francaType) != null;
  }

  public String getExternalName(final FModelElement francaType) {
    return getString(francaType, "ExternalName");
  }

  public String getExternalGetter(final FTypedElement francaField) {
    return getString(francaField, "ExternalGetter");
  }

  public String getExternalSetter(final FTypedElement francaField) {
    return getString(francaField, "ExternalSetter");
  }

  public boolean isObjcInterface(final FInterface francaInterface) {
    return getBoolean(francaInterface, "ObjcInterface");
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
    return propertyAccessors.get(FrancaTypeHelper.getFullName(typeCollection));
  }

  private void addDeploymentInterface(final FDInterface fdInterface) {
    propertyAccessors
        .computeIfAbsent(
            FrancaTypeHelper.getFullName(fdInterface.getTarget()), key -> new LinkedList<>())
        .add(new NameBasedPropertyAccessor(fdInterface));
  }

  private void addDeploymentTypeCollection(final FDTypes fdTypeCollection) {
    propertyAccessors
        .computeIfAbsent(
            FrancaTypeHelper.getFullName(fdTypeCollection.getTarget()), key -> new LinkedList<>())
        .add(new NameBasedPropertyAccessor(fdTypeCollection));
  }
}
