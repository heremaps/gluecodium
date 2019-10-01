/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.gluecodium.platform.swift;

import static org.junit.Assert.assertTrue;

import com.here.gluecodium.Gluecodium;
import com.here.gluecodium.generator.cbridge.CBridgeGenerator;
import com.here.gluecodium.generator.common.GeneratedFile;
import com.here.gluecodium.generator.swift.SwiftGenerator;
import com.here.gluecodium.model.lime.LimeModel;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class SwiftGeneratorSuiteTest {

  private final SwiftGeneratorSuite suite =
      new SwiftGeneratorSuite(Gluecodium.Companion.testOptions());

  @Test
  public void generatedFilesContainStaticFiles() {
    List<GeneratedFile> generatedFiles =
        suite.generate(new LimeModel(Collections.emptyMap(), Collections.emptyList()));

    assertTrue(
        generatedFiles + " must contain all " + SwiftGenerator.Companion.getSTATIC_FILES(),
        generatedFiles.containsAll(SwiftGenerator.Companion.getSTATIC_FILES()));
    assertTrue(
        generatedFiles + " must contain all " + CBridgeGenerator.Companion.getSTATIC_FILES(),
        generatedFiles.containsAll(CBridgeGenerator.Companion.getSTATIC_FILES()));
  }
}
