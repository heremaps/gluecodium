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

package com.here.genium.test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public final class TemplateComparison {

  private static String ignoreWhitespace(String text) {
    return text.replaceAll("\\[ \\t]", " ") // ignore multiple spaces/tabs
        .replaceAll("( *\n)+", "\n") // ignore empty lines
        .replaceAll("^\\s+", ""); // ignore leading empty lines
  }

  private static String checkHeaderAndGetContent(String text) {
    String header =
        "//\n\n"
            + "//\n"
            + "// Automatically generated. Do not modify. Your changes will be lost.\n";
    // For nicer error messages compare the longest possible  part of the header with the actual
    // file and only then check the length
    final int maximalComparisonLength = Math.min(text.length(), header.length());
    assertEquals(header, text.substring(0, maximalComparisonLength));
    assertTrue(header.length() <= text.length());
    return text.substring(header.length());
  }

  public static void assertEqualImplementationContent(String expected, String actual) {
    assertEqualContent("Actual implementation file should match expected value", expected, actual);
  }

  public static void assertEqualHeaderContent(String expected, String actual) {
    String content = checkHeaderAndGetContent(actual);
    content = checkAndStripOpeningAndClosingDirectives(content);
    assertEquals(
        "Actual header should match expected value",
        ignoreWhitespace(expected),
        ignoreWhitespace(content));
  }

  public static void assertEqualContent(String message, String expected, String actual) {
    String content = checkHeaderAndGetContent(actual);
    assertEquals(message, ignoreWhitespace(expected), ignoreWhitespace(content));
  }

  public static void assertEqualContent(String expected, String actual) {
    assertEqualContent("", expected, actual);
  }

  private static String checkAndStripOpeningAndClosingDirectives(String content) {
    content = ignoreWhitespace(content);
    final String opening =
        "#pragma once\n"
            + "#ifdef __cplusplus\n"
            + "extern \"C\" {\n"
            + "#endif\n"
            + "#include \"cbridge/include/BaseHandle.h\"\n";
    final String closing = "#ifdef __cplusplus\n" + "}\n" + "#endif\n";

    int maxLength = Math.min(opening.length(), content.length());
    assertEquals(opening, content.substring(0, maxLength));
    assertThat("Should start with leading 'extern 'C'{'", content.length() >= opening.length());

    content = content.substring(opening.length());

    maxLength = Math.min(closing.length(), content.length());
    assertEquals(closing, content.substring(content.length() - maxLength));
    assertTrue(content.length() >= closing.length());
    content = content.substring(0, content.length() - closing.length());
    return content;
  }
}
