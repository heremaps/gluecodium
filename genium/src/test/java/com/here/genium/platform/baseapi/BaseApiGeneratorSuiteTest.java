/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.platform.baseapi;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import com.here.genium.Genium;
import com.here.genium.generator.common.GeneratedFile;
import java.util.LinkedList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class BaseApiGeneratorSuiteTest {

  private final BaseApiGeneratorSuite baseApiGeneratorSuite =
      new BaseApiGeneratorSuite(Genium.DEFAULT_OPTIONS);
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
