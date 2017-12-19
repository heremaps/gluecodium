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

import static org.junit.Assert.assertTrue;

import com.here.ivi.api.test.MockContextStack;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class AbstractModelBuilderTest {

  private final Object resultObject = new Object();

  private final MockContextStack<Object> contextStack = new MockContextStack<>();
  private final TestableModelBuilder modelBuilder = new TestableModelBuilder(contextStack);

  private static class TestableModelBuilder extends AbstractModelBuilder<Object> {
    TestableModelBuilder(ModelBuilderContextStack<Object> contextStack) {
      super(contextStack);
    }
  }

  @Test
  public void closeContextPropagatesResults() {
    contextStack.getCurrentContext().currentResults.add(resultObject);

    modelBuilder.closeContext();

    assertTrue(contextStack.getParentContext().previousResults.contains(resultObject));
  }

  @Test
  public void closeContextAppendsResults() {
    final Object anotherResultObject = new Object();
    contextStack.getCurrentContext().currentResults.add(anotherResultObject);
    contextStack.getParentContext().previousResults.add(resultObject);

    modelBuilder.closeContext();

    assertTrue(contextStack.getParentContext().previousResults.contains(resultObject));
    assertTrue(contextStack.getParentContext().previousResults.contains(anotherResultObject));
  }
}
