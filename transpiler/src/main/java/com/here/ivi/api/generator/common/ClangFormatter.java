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

package com.here.ivi.api.generator.common;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;

/** Class using clang-format tool to process file content */
public class ClangFormatter extends CommandLineTool {

  /** Enums to choose language used while formatting files */
  public enum Language {
    CPP("cpp"),
    JAVA("java");

    public final String fileName;

    Language(String fileName) {
      this.fileName = fileName;
    }
  }

  /**
   * @param styleFile Path to resource file containing style to be used for formatting. It must be a
   *     file named '.clang-format'.
   * @param language Argument to choose language that will be assumed by clang-format while
   *     formatting files. Based on this argument proper value of parameter '-assume-filename' (cpp,
   *     java, js, ...) will be set.
   * @throws IOException Thrown in case passed style file does not exists, is not a file, can not be
   *     found in resources or has name different than '.clang-format'
   */
  public ClangFormatter(String styleFile, Language language) throws IOException {
    super(
        "clang-format",
        getResourceDirectory(styleFile),
        Arrays.asList("-style=file", String.format("-assume-filename=.%s", language.fileName)));
  }

  private static String getResourceDirectory(String styleFile) throws IOException {
    URL resource = ClangFormatter.class.getClassLoader().getResource(styleFile);
    if (resource == null) {
      throw new IOException(
          String.format("Unable to load style file from resources: %s", styleFile));
    }
    File file = new File(resource.getPath());
    if (!file.isFile()) {
      throw new IOException(String.format("Provided resource '%s' is not a file", styleFile));
    }
    if (!".clang-format".equals(file.getName())) {
      throw new IOException(
          String.format(
              "Provided resource '%s' does not refer to '.clang-format' file", styleFile));
    }
    return file.getParent();
  }
}
