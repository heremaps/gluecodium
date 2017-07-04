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

import com.here.ivi.api.model.franca.FrancaElement;
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

  protected final ModelBuilderContextStack<E> contextStack;
  private ModelBuilderContext<E> resultContext = null;

  protected AbstractModelBuilder(final ModelBuilderContextStack<E> contextStack) {
    this.contextStack = contextStack;
  }

  @Override
  public void startBuilding(FrancaElement<?> element) {
    contextStack.openContext();
  }

  @Override
  public void startBuilding(FInterface francaInterface) {
    contextStack.openContext();
  }

  @Override
  public void startBuilding(FTypeCollection francaTypeCollection) {
    contextStack.openContext();
  }

  @Override
  public void startBuilding(FMethod francaMethod) {
    contextStack.openContext();
  }

  @Override
  public void startBuildingInputArgument(FArgument francaArgument) {
    contextStack.openContext();
  }

  @Override
  public void startBuildingOutputArgument(FArgument francaArgument) {
    contextStack.openContext();
  }

  @Override
  public void startBuilding(FTypeRef francaTypeRef) {
    contextStack.openContext();
  }

  @Override
  public void startBuilding(FConstantDef francaConstant) {
    contextStack.openContext();
  }

  @Override
  public void startBuilding(FTypedElement francaTypedElement) {
    contextStack.openContext();
  }

  @Override
  public void startBuilding(FStructType francaStructType) {
    contextStack.openContext();
  }

  @Override
  public void finishBuilding(FrancaElement<?> element) {
    resultContext = contextStack.closeContext();
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {
    resultContext = contextStack.closeContext();
  }

  @Override
  public void finishBuilding(FTypeCollection francaTypeCollection) {
    resultContext = contextStack.closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {
    resultContext = contextStack.closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {
    resultContext = contextStack.closeContext();
  }

  @Override
  public void finishBuildingOutputArgument(FArgument francaArgument) {
    resultContext = contextStack.closeContext();
  }

  @Override
  public void finishBuilding(FTypeRef francaTypeRef) {
    resultContext = contextStack.closeContext();
  }

  @Override
  public void finishBuilding(FConstantDef francaConstant) {
    contextStack.closeContext();
  }

  @Override
  public void finishBuilding(FTypedElement francaTypedElement) {
    contextStack.closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {
    resultContext = contextStack.closeContext();
  }

  public List<E> getResults() {
    return resultContext != null ? resultContext.results : Collections.emptyList();
  }

  protected final void storeToParentContext(final E element) {
    ModelBuilderContext<E> parentContext = contextStack.getParentContext();
    if (parentContext != null) {
      parentContext.results.add(element);
    }
  }
}
