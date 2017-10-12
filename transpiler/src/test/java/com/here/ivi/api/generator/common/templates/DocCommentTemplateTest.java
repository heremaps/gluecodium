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

package com.here.ivi.api.generator.common.templates;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.CppElement;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class DocCommentTemplateTest {
  private static final String TEMPLATE_NAME = "common/DocComment";
  private final CppElement cppElement = new CppElement("") {};

  @Test
  public void nullComment() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    assertTrue(result.isEmpty());
  }

  @Test
  public void emptyComment() {
    cppElement.comment = "";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    assertTrue(result.isEmpty());
  }

  @Test
  public void someComment() {
    cppElement.comment = "nonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    final String expectedResult = "/**\n * nonsense\n */\n";
    assertEquals(expectedResult, result);
  }

  @Test
  public void multiLineComment() {
    cppElement.comment = "complete\nnonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, cppElement);

    final String expectedResult = "/**\n * complete\n * nonsense\n */\n";
    assertEquals(expectedResult, result);
  }
}
