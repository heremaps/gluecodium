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

import com.here.genium.generator.common.GeneratedFile;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.logging.Logger;

/** Write the generated files to disk. */
public class FileOutput implements GeneratorOutput {

  private static final Logger LOGGER = Logger.getLogger(FileOutput.class.getName());

  private final File rootPath;

  public FileOutput(File rootPath) throws IOException {
    if (!rootPath.exists() && !rootPath.mkdir()) {
      throw new FileNotFoundException(rootPath.getPath() + " (Can't create output directory)");
    }
    this.rootPath = rootPath;
  }

  @Override
  public void output(List<GeneratedFile> files) throws IOException {
    for (GeneratedFile f : files) {
      output(f);
    }
  }

  public void output(GeneratedFile file) throws IOException {

    // write file
    File targetFile = new File(rootPath, file.targetFile.getPath());
    LOGGER.fine("Writing " + targetFile);

    // create missing path(s)
    Path path = Paths.get(targetFile.getParent());
    if (Files.notExists(path)) {
      Files.createDirectories(path);
    }

    BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(targetFile));
    bufferedWriter.write(file.content);
    bufferedWriter.close();
  }
}
