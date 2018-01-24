/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.output;

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
