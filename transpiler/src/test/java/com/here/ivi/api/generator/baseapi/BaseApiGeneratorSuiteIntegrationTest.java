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

package com.here.ivi.api.generator.baseapi;

import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.assertNotNull;
import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.GeneratedFile;
import java.io.File;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class BaseApiGeneratorSuiteIntegrationTest {

  private final BaseApiGeneratorSuite baseApiGeneratorSuite = new BaseApiGeneratorSuite();

  @Test
  public void generate() {
    String francaFilesPath = "src/test/resources/baseapi_generator_suite/fidl";
    baseApiGeneratorSuite.buildModels(Collections.singletonList(new File(francaFilesPath)));

    List<GeneratedFile> generatedFiles = baseApiGeneratorSuite.generate();

    assertNotNull(generatedFiles);
    assertEquals("Expected cpp/internal files and test generated file", 4, generatedFiles.size());

    assertFalse(generatedFiles.get(0).content.isEmpty());
    assertEquals("cpp/test/TestInterface.h", generatedFiles.get(0).targetFile.toString());

    assertFalse(generatedFiles.get(1).content.isEmpty());
    assertEquals("cpp/test/TestInterface.cpp", generatedFiles.get(1).targetFile.toString());

    assertFalse(generatedFiles.get(2).content.isEmpty());
    assertEquals("cpp/internal/expected.h", generatedFiles.get(2).targetFile.toString());

    assertFalse(generatedFiles.get(3).content.isEmpty());
    assertEquals("cpp/enum_hash.h", generatedFiles.get(3).targetFile.toString());
  }
}
