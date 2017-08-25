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

package com.here.ivi.api.generator.cpp.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.common.Include;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppNamespaceIncludeTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppNamespace";

  private static final String EXPECTED_NAMESPACE_BODY_FORMAT =
      "#pragma once\n\n%s\n\nnamespace  {\n\n}\n";
  private static final Include SYSTEM_INCLUDE = Include.createSystemInclude("systematic");
  private static final Include INTERNAL_INCLUDE = Include.createInternalInclude("internally");

  private final List<Include> includes = new LinkedList<>();
  private final Map<String, Object> fakeNamespace = new ConcurrentHashMap<>();

  @Before
  public void setUpNamespace() {
    fakeNamespace.put("name", "");
    fakeNamespace.put("includes", includes);
  }

  @Test
  public void namespaceWithSystemInclude() {
    includes.add(SYSTEM_INCLUDE);

    String result = TemplateEngine.render(TEMPLATE_NAME, fakeNamespace);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "#include <systematic>");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithInternalInclude() {
    includes.add(INTERNAL_INCLUDE);

    String result = TemplateEngine.render(TEMPLATE_NAME, fakeNamespace);

    final String expectedResult =
        String.format(EXPECTED_NAMESPACE_BODY_FORMAT, "#include <internally>");
    assertEquals(expectedResult, result);
  }

  @Test
  public void namespaceWithTwoIncludes() {
    includes.add(SYSTEM_INCLUDE);
    includes.add(INTERNAL_INCLUDE);

    String result = TemplateEngine.render(TEMPLATE_NAME, fakeNamespace);

    final String expectedResult =
        String.format(
            EXPECTED_NAMESPACE_BODY_FORMAT, "#include <systematic>\n#include <internally>");
    assertEquals(expectedResult, result);
  }
}
