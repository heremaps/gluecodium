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

package com.here.genium.output;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import com.here.genium.generator.common.GeneratedFile;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public final class FileOutputTest {

  @Rule public TemporaryFolder testFolder = new TemporaryFolder();

  @Test
  public void testFileOutput() throws IOException {
    assertFalse(TestFiles.FILES.isEmpty());

    FileOutput fileOutput = new FileOutput(testFolder.getRoot());
    fileOutput.output(TestFiles.FILES);

    for (GeneratedFile file : TestFiles.FILES) {
      Path path = Paths.get(testFolder.getRoot().getPath(), file.targetFile.getPath());
      List<String> lines = Files.readAllLines(path, Charset.defaultCharset());
      if (file.content.length() > 0) {
        assertEquals(1, lines.size());
        assertEquals(file.content, lines.get(0));
      } else {
        assertTrue(lines.isEmpty());
      }
    }
  }
}
