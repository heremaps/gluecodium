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

import com.here.ivi.api.generator.common.GeneratedFile;
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
