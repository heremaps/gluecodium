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
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class AbstractGeneratorSuiteTest {

  @Mock(answer = Answers.CALLS_REAL_METHODS)
  private AbstractGeneratorSuite generatorSuite;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void generateWithNoFiles() {
    FileTool fileTool = mock(FileTool.class);
    when(generatorSuite.registerTools()).thenReturn(Collections.singletonList(fileTool));

    List<GeneratedFile> files = generatorSuite.generate();

    assertTrue(files.isEmpty());
    verify(fileTool, never()).process(any());
  }

  @Test
  public void generateWithNoTools() {
    when(generatorSuite.registerTools()).thenReturn(new ArrayList<>());

    GeneratedFile generatedFile = new GeneratedFile("", "");
    when(generatorSuite.generateFiles()).thenReturn(Collections.singletonList(generatedFile));

    List<GeneratedFile> files = generatorSuite.generate();

    assertEquals(1, files.size());
    assertEquals(generatedFile, files.get(0));
  }

  @Test
  public void generateWithTwoFiles() {
    FileTool fileTool = mock(FileTool.class);
    when(generatorSuite.registerTools()).thenReturn(Collections.singletonList(fileTool));

    GeneratedFile generatedFile1 = new GeneratedFile("1", "");
    GeneratedFile generatedFile2 = new GeneratedFile("2", "");
    when(generatorSuite.generateFiles()).thenReturn(Arrays.asList(generatedFile1, generatedFile2));

    List<GeneratedFile> files = generatorSuite.generate();

    assertEquals(2, files.size());
    verify(fileTool).process(generatedFile1);
    verify(fileTool).process(generatedFile2);
  }

  @Test
  public void generateWithTwoTools() {
    FileTool fileTool1 = mock(FileTool.class);
    FileTool fileTool2 = mock(FileTool.class);
    when(generatorSuite.registerTools()).thenReturn(Arrays.asList(fileTool1, fileTool2));

    GeneratedFile processedByFirstToolFile = new GeneratedFile("processed", "");
    when(fileTool1.process(any())).thenReturn(processedByFirstToolFile);

    GeneratedFile initialGeneratedFile = new GeneratedFile("generated", "");
    when(generatorSuite.generateFiles())
        .thenReturn(Collections.singletonList(initialGeneratedFile));

    List<GeneratedFile> files = generatorSuite.generate();

    assertEquals(1, files.size());
    verify(fileTool1).process(initialGeneratedFile);
    verify(fileTool2).process(processedByFirstToolFile);
  }
}
