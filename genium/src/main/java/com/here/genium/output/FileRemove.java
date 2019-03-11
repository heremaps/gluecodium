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

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.logging.Logger;

public class FileRemove {

  private static final Logger LOGGER = Logger.getLogger(FileRemove.class.getName());

  private final File rootDir;

  public FileRemove(File rootDir) {
    this.rootDir = rootDir;
  }

  public boolean removeFiles(final List<Path> absolutePaths) throws FileNotFoundException {

    if (!rootDir.exists() || !rootDir.isDirectory()) {
      throw new FileNotFoundException(
          "Accessing root directory '" + rootDir.getPath() + "' failed");
    }

    for (Path absolutePath : absolutePaths) {

      try {
        //only remove regular files located below root dir
        if (Files.isRegularFile(absolutePath)
            && absolutePath
                .toFile()
                .getCanonicalPath()
                .startsWith(rootDir.getCanonicalPath() + File.separator)) {
          Files.delete(absolutePath);
        }
      } catch (IOException e) {
        LOGGER.severe("deletion of '" + absolutePath.toString() + "' failed");
        return false;
      }
    }
    return true;
  }
}
