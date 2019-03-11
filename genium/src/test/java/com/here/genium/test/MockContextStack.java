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

package com.here.genium.test;

import com.here.genium.generator.common.modelbuilder.ModelBuilderContext;
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack;

public class MockContextStack<E> extends ModelBuilderContextStack<E> {

  private final ModelBuilderContext<E> currentContext = new ModelBuilderContext<>();
  private final ModelBuilderContext<E> parentContext = new ModelBuilderContext<>();

  @Override
  public void openContext() {
    // Do nothing
  }

  @Override
  public void closeContext() {
    // Do nothing
  }

  @Override
  public ModelBuilderContext<E> getCurrentContext() {
    return currentContext;
  }

  @Override
  public ModelBuilderContext<E> getParentContext() {
    return parentContext;
  }

  public void injectResult(E element) {
    currentContext.previousResults.add(element);
  }
}
