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

package com.here.ivi.api.test;

import static junit.framework.TestCase.assertTrue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.Assert.assertEquals;

import java.time.Year;

public final class TemplateComparison {

  private static String ignoreWhitespace(String text) {
    return text.replaceAll("\\[ \\t]", " ") // ignore multiple spaces/tabs
        .replaceAll("\n+", "\n") // ignore empty lines
        .replaceAll("^\\s+", ""); // ignore leading empty lines
  }

  private static String checkAndStripCopyright(String text) {
    String copyright =
        "//\n"
            + "// Copyright (C) "
            + Year.now().getValue()
            + " HERE Global B.V. and/or its affiliated companies. All rights reserved.\n"
            + "// \n"
            + "// This software, including documentation, is protected by copyright controlled by\n"
            + "// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,\n"
            + "// adapting or translating, any or all of this material requires the prior written\n"
            + "// consent of HERE Global B.V. This material also contains confidential information,\n"
            + "// which may not be disclosed to others without prior written consent of HERE Global B.V.\n"
            + "//\n"
            + "// Automatically generated. Do not modify. Your changes will be lost.\n";
    // For nicer error messages compare the longest possible  part of the copyright with the actual
    // file and only then check the length
    final int maximalComparisonLength = Math.min(text.length(), copyright.length());
    assertEquals(copyright, text.substring(0, maximalComparisonLength));
    assertTrue(copyright.length() <= text.length());
    return text.substring(copyright.length());
  }

  public static void assertEqualImplementationContent(String expected, String actual) {
    assertEqualContent("Actual implementation file should match expected value", expected, actual);
  }

  public static void assertEqualHeaderContent(String expected, String actual) {
    String content = checkAndStripCopyright(actual);
    content = checkAndStripPragmaAndExternC(content);
    assertEquals(
        "Actual header should match expected value",
        ignoreWhitespace(expected),
        ignoreWhitespace(content));
  }

  public static void assertEqualPrivateHeaderContent(String expected, String actual) {
    String content = expected.isEmpty() ? actual : checkAndStripCopyright(actual);
    assertEquals(
        "Actual private header file should match expected value",
        ignoreWhitespace(expected),
        ignoreWhitespace(content));
  }

  public static void assertEqualContent(String message, String expected, String actual) {
    String content = checkAndStripCopyright(actual);
    assertEquals(message, ignoreWhitespace(expected), ignoreWhitespace(content));
  }

  public static void assertEqualContent(String expected, String actual) {
    assertEqualContent("", expected, actual);
  }

  private static String checkAndStripPragmaAndExternC(String content) {
    content = ignoreWhitespace(content);
    final String opening =
        "#pragma once\n" + "#ifdef __cplusplus\n" + "extern \"C\" {\n" + "#endif\n";
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
