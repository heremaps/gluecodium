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
