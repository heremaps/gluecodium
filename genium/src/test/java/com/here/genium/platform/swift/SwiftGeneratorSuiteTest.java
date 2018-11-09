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

package com.here.genium.platform.swift;

import static org.junit.Assert.assertTrue;

import com.here.genium.Genium;
import com.here.genium.generator.cbridge.CBridgeGenerator;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.swift.SwiftGenerator;
import java.util.LinkedList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class SwiftGeneratorSuiteTest {

  private final SwiftGeneratorSuite suite =
      new SwiftGeneratorSuite(Genium.Companion.getDEFAULT_OPTIONS(), null);

  @Test
  public void generatedFilesContainStaticFiles() {
    List<GeneratedFile> generatedFiles = suite.generate(new LinkedList<>());

    assertTrue(
        generatedFiles + " must contain all " + SwiftGenerator.STATIC_FILES,
        generatedFiles.containsAll(SwiftGenerator.STATIC_FILES));
    assertTrue(
        generatedFiles + " must contain all " + CBridgeGenerator.STATIC_FILES,
        generatedFiles.containsAll(CBridgeGenerator.STATIC_FILES));
  }
}
