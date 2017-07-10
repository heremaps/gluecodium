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

package com.here.ivi.api.generator.common;

import java.util.Collections;
import java.util.List;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;

public abstract class AbstractModelBuilder<E> implements ModelBuilder {

  private final ModelBuilderContextStack<E> contextStack;
  private ModelBuilderContext<E> resultContext = null;

  protected AbstractModelBuilder(final ModelBuilderContextStack<E> contextStack) {
    this.contextStack = contextStack;
  }

  @Override
  public void startBuilding(FInterface francaInterface) {
    openContext();
  }

  @Override
  public void startBuilding(FTypeCollection francaTypeCollection) {
    openContext();
  }

  @Override
  public void startBuilding(FMethod francaMethod) {
    openContext();
  }

  @Override
  public void startBuildingInputArgument(FArgument francaArgument) {
    openContext();
  }

  @Override
  public void startBuildingOutputArgument(FArgument francaArgument) {
    openContext();
  }

  @Override
  public void startBuilding(FTypeRef francaTypeRef) {
    openContext();
  }

  @Override
  public void startBuilding(FConstantDef francaConstant) {
    openContext();
  }

  @Override
  public void startBuilding(FTypedElement francaTypedElement) {
    openContext();
  }

  @Override
  public void startBuilding(FStructType francaStructType) {
    openContext();
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {
    closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {
    closeContext();
  }

  @Override
  public void finishBuilding(FTypedElement francaTypedElement) {
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {
    closeContext();
  }

  public List<E> getResults() {
    return resultContext != null ? resultContext.currentResults : Collections.emptyList();
  }

  protected final void openContext() {
    contextStack.openContext();
  }

  protected final void closeContext() {
    resultContext = contextStack.getCurrentContext();
    if (resultContext != null) {
      ModelBuilderContext<E> parentContext = contextStack.getParentContext();
      if (parentContext != null) {
        parentContext.previousResults.addAll(resultContext.currentResults);
      }
    }

    contextStack.closeContext();
  }

  protected final ModelBuilderContext<E> getCurrentContext() {
    return contextStack.getCurrentContext();
  }

  protected final void storeResult(final E element) {
    ModelBuilderContext<E> currentContext = contextStack.getCurrentContext();
    if (currentContext != null) {
      currentContext.currentResults.add(element);
    }
  }
}
