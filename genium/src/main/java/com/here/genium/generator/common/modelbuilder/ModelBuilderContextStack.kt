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

package com.here.genium.generator.common.modelbuilder;

import java.util.LinkedList;

public class ModelBuilderContextStack<E> {

  @SuppressWarnings({"PMD.LooseCoupling"})
  private final LinkedList<ModelBuilderContext<E>> contextStack = new LinkedList<>();

  public void openContext() {
    contextStack.push(new ModelBuilderContext<>());
  }

  public void closeContext() {
    contextStack.poll();
  }

  public ModelBuilderContext<E> getCurrentContext() {
    return contextStack.peek();
  }

  public ModelBuilderContext<E> getParentContext() {
    return contextStack.size() > 1 ? contextStack.get(1) : null;
  }
}
