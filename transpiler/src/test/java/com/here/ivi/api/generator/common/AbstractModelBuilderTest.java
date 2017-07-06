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

import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class AbstractModelBuilderTest {

  private static class TestableModelBuilder extends AbstractModelBuilder<Object> {
    public TestableModelBuilder(ModelBuilderContextStack<Object> contextStack) {
      super(contextStack);
    }
  }

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  ModelBuilderContextStack<Object> contextStack;

  private final Object resultObject = new Object();

  private TestableModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    modelBuilder = new TestableModelBuilder(contextStack);

    contextStack.getCurrentContext().currentResults = new ArrayList<>();
    contextStack.getParentContext().previousResults = new ArrayList<>();
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
