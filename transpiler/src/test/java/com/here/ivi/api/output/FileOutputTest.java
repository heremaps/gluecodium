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

package com.here.ivi.api.output;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.common.GeneratedFile;
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
