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

import java.io.IOException;
import org.junit.Rule;
import org.junit.Test;
import org.junit.contrib.java.lang.system.SystemOutRule;

public final class ConsoleOutputTest {

  @Rule public final SystemOutRule systemOutRule = new SystemOutRule().enableLog();

  private static final String EXPECTED =
      String.format(
          "Generated %1s:\n\n"
              + "        %2s\n\n"
              + "Generated %3s:\n\n\n"
              + "Generated %4s:\n\n"
              + "        %5s\n\n"
              + "Done.\n",
          TestFiles.PATH1,
          TestFiles.CONTENT1,
          TestFiles.PATH2,
          TestFiles.PATH3,
          TestFiles.CONTENT3);

  @Test
  public void verifyExpectedConsoleOutputFormatting() throws IOException {
    assertFalse(TestFiles.FILES.isEmpty());

    ConsoleOutput consoleOutput = new ConsoleOutput();
    consoleOutput.output(TestFiles.FILES);

    assertEquals(EXPECTED, systemOutRule.getLog());
  }
}
