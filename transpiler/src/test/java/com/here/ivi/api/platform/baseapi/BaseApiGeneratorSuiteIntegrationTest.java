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

package com.here.ivi.api.platform.baseapi;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import com.here.ivi.api.generator.common.GeneratedFile;
import java.io.File;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class BaseApiGeneratorSuiteIntegrationTest {
  private static final String FRANCA_FILE_PATH =
      "src/test/resources/baseapi_generator_suite/fidl/TestInterface.fidl";
  private final BaseApiGeneratorSuite baseApiGeneratorSuite = new BaseApiGeneratorSuite();

  @Test
  public void generate() {
    baseApiGeneratorSuite.loadModels(Collections.singletonList(new File(FRANCA_FILE_PATH)));

    List<GeneratedFile> generatedFiles = baseApiGeneratorSuite.generate();

    assertNotNull(generatedFiles);
    final int expectedGeneratedFiles = BaseApiGeneratorSuite.ADDITIONAL_HEADERS.size() + 2;
    assertEquals(
        "Expected cpp/internal files and test generated file",
        expectedGeneratedFiles,
        generatedFiles.size());
    assertFalse(generatedFiles.stream().anyMatch(generatedFile -> generatedFile.content.isEmpty()));

    assertEquals("cpp/include/test/TestInterface.h", generatedFiles.get(0).targetFile.toString());
    assertEquals("cpp/src/test/TestInterface.cpp", generatedFiles.get(1).targetFile.toString());
    assertEquals("cpp/include/enum_hash.h", generatedFiles.get(2).targetFile.toString());
    assertEquals("cpp/include/Error.h", generatedFiles.get(3).targetFile.toString());
    assertEquals("cpp/include/ErrorCode.h", generatedFiles.get(4).targetFile.toString());
    assertEquals("cpp/include/Return.h", generatedFiles.get(5).targetFile.toString());
  }
}
