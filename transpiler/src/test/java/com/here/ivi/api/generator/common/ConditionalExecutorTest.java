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

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.function.Predicate;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class ConditionalExecutorTest {

  private final GeneratedFile initialFile = new GeneratedFile("", "");

  @Mock private Predicate<GeneratedFile> condition;
  @Mock private FileTool actualTool;

  @InjectMocks private ConditionalExecutor conditionalExecutor;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void processCallCondition() {
    conditionalExecutor.process(initialFile);

    verify(condition).test(initialFile);
  }

  @Test
  public void processCallsActualTool() {
    final GeneratedFile processedFile = new GeneratedFile("", "");
    when(actualTool.process(any())).thenReturn(processedFile);
    when(condition.test(any())).thenReturn(true);

    GeneratedFile result = conditionalExecutor.process(initialFile);

    verify(actualTool).process(initialFile);
    assertEquals(processedFile, result);
  }

  @Test
  public void processDoesNotCallActualTool() {
    when(condition.test(any())).thenReturn(false);

    GeneratedFile result = conditionalExecutor.process(initialFile);

    verify(actualTool, never()).process(any());
    assertEquals(initialFile, result);
  }
}
