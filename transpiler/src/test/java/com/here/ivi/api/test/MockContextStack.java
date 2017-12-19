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

package com.here.ivi.api.test;

import com.here.ivi.api.generator.common.modelbuilder.ModelBuilderContext;
import com.here.ivi.api.generator.common.modelbuilder.ModelBuilderContextStack;

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
