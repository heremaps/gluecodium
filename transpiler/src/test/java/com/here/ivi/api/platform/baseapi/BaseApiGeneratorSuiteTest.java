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
import static org.junit.Assert.assertNotNull;

import com.here.ivi.api.cli.OptionReader;
import com.here.ivi.api.generator.common.GeneratedFile;
import java.util.LinkedList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class BaseApiGeneratorSuiteTest {

  private final BaseApiGeneratorSuite baseApiGeneratorSuite =
      new BaseApiGeneratorSuite(OptionReader.DEFAULT_OPTIONS);
  private List<GeneratedFile> generatedFiles;

  private String getTargetFile(int i) {
    return generatedFiles.get(i).targetFile.toString();
  }

  @Test
  public void generateFilesEmptyModel() {
    generatedFiles = baseApiGeneratorSuite.generate(null, new LinkedList<>());
    assertNotNull(generatedFiles);
    final int expectedGeneratedFiles = BaseApiGeneratorSuite.ADDITIONAL_HEADERS.size();
    assertEquals(
        "Expected cpp/internal files and test generated file",
        expectedGeneratedFiles,
        generatedFiles.size());

    assertEquals("cpp/include/EnumHash.h", getTargetFile(0));
    assertEquals("cpp/include/Return.h", getTargetFile(1));
  }
}
