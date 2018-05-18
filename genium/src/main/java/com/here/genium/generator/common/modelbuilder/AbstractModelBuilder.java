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

package com.here.genium.generator.common.modelbuilder;

import com.here.genium.common.CollectionsHelper;
import java.util.Collections;
import java.util.List;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

@SuppressWarnings({"PMD.TooManyMethods"})
public abstract class AbstractModelBuilder<E> implements ModelBuilder {

  private final ModelBuilderContextStack<E> contextStack;
  private ModelBuilderContext<E> resultContext;

  protected AbstractModelBuilder(final ModelBuilderContextStack<E> contextStack) {
    this.contextStack = contextStack;
  }

  @Override
  public void startBuilding(EObject object) {
    openContext();
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
  public void startBuildingInputArgument(FArgument francaArgument) {
    openContext();
  }

  @Override
  public void startBuildingOutputArgument(FArgument francaArgument) {
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
  public void finishBuilding(FField francaField) {
    closeContext();
  }

  @Override
  public void finishBuilding(FStructType francaStructType) {
    closeContext();
  }

  @Override
  public void finishBuilding(FTypeDef francaTypeDef) {
    closeContext();
  }

  @Override
  public void finishBuilding(FArrayType francaArrayType) {
    closeContext();
  }

  @Override
  public void finishBuilding(FMapType francaMapType) {
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerationType francaEnumerationType) {
    closeContext();
  }

  @Override
  public void finishBuilding(FEnumerator francaEnumerator) {
    closeContext();
  }

  @Override
  public void finishBuilding(FInitializerExpression francaExpression) {
    closeContext();
  }

  @Override
  public void finishBuilding(FAttribute francaAttribute) {
    closeContext();
  }

  /**
   * Get final results of the model builder execution. Intended to be called by clients of the model
   * builder but not within the model builder itself.
   *
   * @return A list of results
   */
  public List<E> getFinalResults() {
    return resultContext != null ? resultContext.currentResults : Collections.emptyList();
  }

  /**
   * Get the first item of the given type from the list of final results of the model builder
   * execution. Intended to be called by clients of the model builder but not within the model
   * builder itself.
   *
   * @param clazz Class object representing the type of the result to get
   * @param <T> Type of the result to get
   * @return A result item
   */
  public <T extends E> T getFinalResult(final Class<T> clazz) {
    return resultContext != null
        ? CollectionsHelper.getFirstOfType(resultContext.currentResults, clazz)
        : null;
  }

  /**
   * Get the results of the previous ("child") step of model builder execution.
   *
   * @return A list of results
   */
  protected <T extends E> T getPreviousResult(final Class<T> clazz) {
    return CollectionsHelper.getFirstOfType(getCurrentContext().previousResults, clazz);
  }

  /**
   * Get the first item of the given type from the list of results of the previous ("child") step of
   * model builder execution.
   *
   * @param clazz Class object representing the type of the result to get
   * @param <T> Type of the result to get
   * @return A result item
   */
  protected <T extends E> List<T> getPreviousResults(final Class<T> clazz) {
    return CollectionsHelper.getAllOfType(getCurrentContext().previousResults, clazz);
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

  protected final ModelBuilderContext<E> getParentContext() {
    return contextStack.getParentContext();
  }

  protected final void storeResult(final E element) {
    ModelBuilderContext<E> currentContext = contextStack.getCurrentContext();
    if (currentContext != null) {
      currentContext.currentResults.add(element);
    }
  }
}
