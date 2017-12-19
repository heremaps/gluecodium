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

package com.here.ivi.api.generator.common.modelbuilder;

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
