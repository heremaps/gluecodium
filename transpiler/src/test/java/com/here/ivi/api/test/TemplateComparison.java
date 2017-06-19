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
import static org.junit.Assert.assertEquals;

public class TemplateComparison {

  static String ignoreWhitespace(String text) {
    return text.replaceAll("\\[ \\t]", " ") // ignore multiple spaces/tabs
        .replaceAll("\n+", "\n") // ignore empty lines
        .replaceAll("^\\s+", ""); // ignore leading empty lines
  }

  static String checkAndStripCopyright(String text) {
    String copyright =
        "//\n"
            + "//  Copyright (C) 2015 - 2017 HERE Global B.V. and its affiliate(s).\n"
            + "//\n"
            + "//  All rights reserved. This software and other materials contain\n"
            + "//  proprietary information of HERE and are protected by applicable\n"
            + "//  copyright legislation. Any use and utilization of this software\n"
            + "//  and other materials and disclosure to any third parties is\n"
            + "//  conditional upon having a separate agreement with HERE for the\n"
            + "//  use, utilization or disclosure of this software. In the absence\n"
            + "//  of such agreement, the use of the software is not allowed.\n"
            + "//\n"
            + "//  Automatically generated. Do not modify. Your changes will be lost.\n";
    assertTrue(text.startsWith(copyright));
    return text.substring(copyright.length());
  }

  public static void assertEqualContent(String expected, String actual) {
    String actualContent = checkAndStripCopyright(actual);
    assertEquals(ignoreWhitespace(expected), ignoreWhitespace(actualContent));
  }
}
