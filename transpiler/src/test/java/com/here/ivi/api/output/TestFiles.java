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
import java.util.Arrays;
import java.util.List;

class TestFiles {
  static final String CONTENT1 = "CONTENT1";
  static final String CONTENT3 = "CONTENT3";
  static final String PATH1 = "PATH1_1/PATH1_2/FILE1";
  static final String PATH2 = "PATH2/FILE2";
  static final String PATH3 = "FILE3";

  static final List<GeneratedFile> FILES =
      Arrays.asList(
          new GeneratedFile(CONTENT1, PATH1),
          new GeneratedFile("", PATH2),
          new GeneratedFile(CONTENT3, PATH3));
}
