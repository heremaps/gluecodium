/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.franca;

import static com.here.genium.franca.FrancaTypeHelper.getFullName;

import java.util.HashMap;
import java.util.Map;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FModelElement;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.fDeploy.*;

/**
 * Property accessor implementation that maps deployment model elements based on element names
 * instead of based on element references.
 */
public final class NameBasedPropertyAccessor extends MappingGenericPropertyAccessor {

  private final Map<String, FDElement> mapping = new HashMap<>();

  public NameBasedPropertyAccessor(final FDInterface fdInterface) {
    super(fdInterface.getSpec(), null);
    initMapping(fdInterface);
  }

  public NameBasedPropertyAccessor(final FDTypes fdTypeCollection) {
    super(fdTypeCollection.getSpec(), null);
    initMapping(fdTypeCollection);
  }

  @Override
  public FDElement getFDElement(final EObject obj) {
    FDElement elem = null;
    if (obj instanceof FModelElement) {
      elem = mapping.get(getFullName((FModelElement) obj));
    }
    return elem != null ? elem : createDummyFDEelement(obj);
  }

  @Override
  public FDElement createDummyFDEelement(EObject obj) {
    FDElement dummy = super.createDummyFDEelement(obj);
    return dummy != null ? dummy : FDeployFactory.eINSTANCE.createFDElement();
  }

  private void initMapping(final FDInterface fdInterface) {

    mapping.put(getFullName(fdInterface.getTarget()), fdInterface);

    for (FDAttribute fdAttribute : fdInterface.getAttributes()) {
      mapping.put(getFullName(fdAttribute.getTarget()), fdAttribute);
    }

    for (FDMethod fdMethod : fdInterface.getMethods()) {
      mapping.put(getFullName(fdMethod.getTarget()), fdMethod);
      initArguments(fdMethod.getInArguments());
      initArguments(fdMethod.getOutArguments());
    }

    for (FDBroadcast fdBroadcast : fdInterface.getBroadcasts()) {
      mapping.put(getFullName(fdBroadcast.getTarget()), fdBroadcast);
      initArguments(fdBroadcast.getOutArguments());
    }

    fdInterface.getTypes().forEach(this::initType);
  }

  private void initMapping(final FDTypes fdTypeCollection) {
    mapping.put(getFullName(fdTypeCollection.getTarget()), fdTypeCollection);
    fdTypeCollection.getTypes().forEach(this::initType);
  }

  private void initArguments(final FDArgumentList fdArguments) {
    if (fdArguments != null) {
      for (FDArgument arg : fdArguments.getArguments()) {
        this.mapping.put(getFullName(arg.getTarget()), arg);
      }
    }
  }

  private void initType(final FDTypeDefinition fdType) {

    if (fdType instanceof FDArray) {
      mapping.put(getFullName(((FDArray) fdType).getTarget()), fdType);
    } else if (fdType instanceof FDStruct) {
      final FDStruct fdStruct = (FDStruct) fdType;
      mapping.put(getFullName(fdStruct.getTarget()), fdType);
      for (FDField fdField : fdStruct.getFields()) {
        mapping.put(getFullName(fdField.getTarget()), fdField);
      }
    } else if (fdType instanceof FDUnion) {
      final FDUnion fdUnion = (FDUnion) fdType;
      mapping.put(getFullName(fdUnion.getTarget()), fdType);
      for (FDField fdField : fdUnion.getFields()) {
        mapping.put(getFullName(fdField.getTarget()), fdField);
      }
    } else if (fdType instanceof FDEnumeration) {
      final FDEnumeration fdEnumeration = (FDEnumeration) fdType;
      mapping.put(getFullName(fdEnumeration.getTarget()), fdType);
      for (FDEnumValue fdEnumValue : fdEnumeration.getEnumerators()) {
        mapping.put(getFullName(fdEnumValue.getTarget()), fdEnumValue);
      }
    } else if (fdType instanceof FDTypedef) {
      mapping.put(getFullName(((FDTypedef) fdType).getTarget()), fdType);
    }
  }
}
