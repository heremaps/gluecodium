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

package com.here.ivi.api.cache;

import com.here.ivi.api.generator.common.GeneratedFile;
import java.util.Arrays;
import java.util.List;

public final class TestFiles {

  public static final String CONTENT1 = "CONTENT1";
  public static final String CONTENT2 = "";
  public static final String CONTENT3 = "CONTENT3";
  public static final String CONTENT4 = "CONTENT4";

  public static final String PATH1 = "PATH1_1/PATH1_2/FILE1";
  //leading dot is important, as it will be tested whether path strings get normalized before
  //storing them inside cache
  public static final String PATH2 = "./PATH2/FILE2";
  public static final String PATH3 = "FILE3";
  public static final String PATH4 = "FILE4";

  public static final String PATH_UNCACHED = PATH4 + "xtra";

  // initial file set
  public static final List<GeneratedFile> INITIAL_FILES =
      Arrays.asList(
          new GeneratedFile(CONTENT1, PATH1),
          new GeneratedFile(CONTENT2, PATH2),
          new GeneratedFile(CONTENT3, PATH3));

  // updated file set: one file removed, one unchanged, one added
  public static final List<GeneratedFile> UPDATED_FILES =
      Arrays.asList(
          new GeneratedFile(CONTENT1 + "xtra", PATH1),
          //following entry should be considered unchanged file as path's will be normalized
          new GeneratedFile(CONTENT3, "./" + PATH3),
          new GeneratedFile(CONTENT4, PATH4));

  // set of changed files when caching INITIAL_FILES first and update with UPDATED_FILES afterwards
  public static final List<GeneratedFile> CHANGED_FILES =
      Arrays.asList(
          new GeneratedFile(CONTENT1 + "xtra", PATH1), new GeneratedFile(CONTENT4, PATH4));
}
