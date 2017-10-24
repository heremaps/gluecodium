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

import java.util.HashMap;
import java.util.Map;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
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
      elem = mapping.get(buildKey((FModelElement) obj));
    }
    return elem != null ? elem : createDummyFDEelement(obj);
  }

  private static String buildKey(final FModelElement modelElement) {

    String suffix = modelElement instanceof FMethod ? ((FMethod) modelElement).getSelector() : null;
    String elementName =
        suffix != null ? modelElement.getName() + ":" + suffix : modelElement.getName();

    EObject parent = modelElement.eContainer();
    if (parent instanceof FModelElement) {
      return buildKey((FModelElement) parent) + "." + elementName;
    } else if (parent instanceof FModel) {
      return ((FModel) parent).getName() + "." + elementName;
    } else {
      return elementName;
    }
  }

  private void initMapping(final FDInterface fdInterface) {

    mapping.put(buildKey(fdInterface.getTarget()), fdInterface);

    for (FDAttribute fdAttribute : fdInterface.getAttributes()) {
      mapping.put(buildKey(fdAttribute.getTarget()), fdAttribute);
    }

    for (FDMethod fdMethod : fdInterface.getMethods()) {
      mapping.put(buildKey(fdMethod.getTarget()), fdMethod);
      initArguments(fdMethod.getInArguments());
      initArguments(fdMethod.getOutArguments());
    }

    for (FDBroadcast fdBroadcast : fdInterface.getBroadcasts()) {
      mapping.put(buildKey(fdBroadcast.getTarget()), fdBroadcast);
      initArguments(fdBroadcast.getOutArguments());
    }

    fdInterface.getTypes().forEach(this::initType);
  }

  private void initMapping(final FDTypes fdTypeCollection) {
    mapping.put(buildKey(fdTypeCollection.getTarget()), fdTypeCollection);
    fdTypeCollection.getTypes().forEach(this::initType);
  }

  private void initArguments(final FDArgumentList fdArguments) {
    if (fdArguments != null) {
      for (FDArgument arg : fdArguments.getArguments()) {
        this.mapping.put(buildKey(arg.getTarget()), arg);
      }
    }
  }

  private void initType(final FDTypeDefinition fdType) {

    if (fdType instanceof FDArray) {
      mapping.put(buildKey(((FDArray) fdType).getTarget()), fdType);
    } else if (fdType instanceof FDStruct) {
      final FDStruct fdStruct = (FDStruct) fdType;
      mapping.put(buildKey(fdStruct.getTarget()), fdType);
      for (FDField fdField : fdStruct.getFields()) {
        mapping.put(buildKey(fdField.getTarget()), fdField);
      }
    } else if (fdType instanceof FDUnion) {
      final FDUnion fdUnion = (FDUnion) fdType;
      mapping.put(buildKey(fdUnion.getTarget()), fdType);
      for (FDField fdField : fdUnion.getFields()) {
        mapping.put(buildKey(fdField.getTarget()), fdField);
      }
    } else if (fdType instanceof FDEnumeration) {
      final FDEnumeration fdEnumeration = (FDEnumeration) fdType;
      mapping.put(buildKey(fdEnumeration.getTarget()), fdType);
      for (FDEnumValue fdEnumValue : fdEnumeration.getEnumerators()) {
        mapping.put(buildKey(fdEnumValue.getTarget()), fdEnumValue);
      }
    } else if (fdType instanceof FDTypedef) {
      mapping.put(buildKey(((FDTypedef) fdType).getTarget()), fdType);
    }
  }
}
