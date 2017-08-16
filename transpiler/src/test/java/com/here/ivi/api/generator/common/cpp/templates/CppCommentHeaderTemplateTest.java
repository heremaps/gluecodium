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

package com.here.ivi.api.generator.common.cpp.templates;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import com.here.ivi.api.generator.common.TemplateEngine;
import java.util.HashMap;
import java.util.Map;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppCommentHeaderTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppCommentHeader";

  private static final int COPYRIGHT_NOTICE_LENGTH = 732;
  private static final int COPYRIGHT_NOTICE_LINES_COUNT = 11;
  private static final int GENERATOR_NOTICE_TEMPLATE_LENGTH = 108;
  private static final int GENERATOR_NOTICE_LINES_COUNT = 4;
  private static final int PREFIX_LENGTH = 3;

  private final Map<String, Object> dataObject = new HashMap<>();

  @Before
  public void setUp() {
    dataObject.put("year", "1984");
  }

  @Test
  public void nullGeneratorNotice() {
    String result = TemplateEngine.render(TEMPLATE_NAME, dataObject);

    assertNotNull(result);
    assertEquals(COPYRIGHT_NOTICE_LENGTH, result.length());
    assertEquals(COPYRIGHT_NOTICE_LINES_COUNT, result.split("\n").length);
  }

  @Test
  public void emptyGeneratorNotice() {
    dataObject.put("generatorNotice", "");

    String result = TemplateEngine.render(TEMPLATE_NAME, dataObject);

    assertNotNull(result);
    assertEquals(COPYRIGHT_NOTICE_LENGTH, result.length());
    assertEquals(COPYRIGHT_NOTICE_LINES_COUNT, result.split("\n").length);
  }

  @Test
  public void someGeneratorNotice() {
    final String generatorNotice = "nonsense";
    dataObject.put("generatorNotice", generatorNotice);

    String result = TemplateEngine.render(TEMPLATE_NAME, dataObject);

    assertNotNull(result);
    final int expectedLength =
        COPYRIGHT_NOTICE_LENGTH
            + GENERATOR_NOTICE_TEMPLATE_LENGTH
            + PREFIX_LENGTH
            + generatorNotice.length();
    assertEquals(expectedLength, result.length());
    assertEquals(
        COPYRIGHT_NOTICE_LINES_COUNT + GENERATOR_NOTICE_LINES_COUNT, result.split("\n").length);
  }

  @Test
  public void multiLineGeneratorNotice() {
    final String generatorNotice = "more\nnonsense";
    dataObject.put("generatorNotice", generatorNotice);

    String result = TemplateEngine.render(TEMPLATE_NAME, dataObject);

    assertNotNull(result);
    final int expectedLength =
        COPYRIGHT_NOTICE_LENGTH
            + GENERATOR_NOTICE_TEMPLATE_LENGTH
            + 2 * PREFIX_LENGTH
            + generatorNotice.length();
    assertEquals(expectedLength, result.length());
    assertEquals(
        COPYRIGHT_NOTICE_LINES_COUNT + GENERATOR_NOTICE_LINES_COUNT + 1, result.split("\n").length);
  }
}
