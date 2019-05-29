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

package com.here.genium.loader;

import com.here.genium.common.ContextBasedModelBuilder;
import com.here.genium.common.ModelBuilderContextStack;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;

public abstract class AbstractModelBuilder<E> extends ContextBasedModelBuilder<E>
    implements ModelBuilder {

  protected AbstractModelBuilder(final ModelBuilderContextStack<E> contextStack) {
    super(contextStack);
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
}
