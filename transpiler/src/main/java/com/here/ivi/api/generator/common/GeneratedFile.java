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

public class GeneratedFile {

  public GeneratedFile(CharSequence content, String targetFile) {
    this(content, new File(targetFile));
  }

  public GeneratedFile(CharSequence content, File targetFile) {
    this.content = content;
    this.targetFile = targetFile;
  }

  public final CharSequence content;
  public final File targetFile;
}
