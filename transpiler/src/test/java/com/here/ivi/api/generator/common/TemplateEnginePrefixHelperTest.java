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

package com.here.ivi.api.generator.common;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.LinkedList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.trimou.handlebars.Options;

@RunWith(JUnit4.class)
public class TemplateEnginePrefixHelperTest {

  private static final String PREFIX = "<!-- ";
  private static final String FIRST_LINE = "complete";
  private static final String SECOND_LINE = "nonsense";
  private static final String MULTI_LINE = FIRST_LINE + "\n" + SECOND_LINE;

  private List<Object> parameters = new LinkedList<>();

  @Mock private Options options;

  private TemplateEngine.PrefixHelper helper = new TemplateEngine.PrefixHelper();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(options.getParameters()).thenReturn(parameters);
  }

  @Test
  public void executeNoParameters() {
    helper.execute(options);

    verify(options, never()).append(any());
  }

  @Test
  public void executeSingleLineNoPrefix() {
    parameters.add(FIRST_LINE);

    helper.execute(options);

    verify(options).append(FIRST_LINE);
  }

  @Test
  public void executeSingleLineWithPrefix() {
    parameters.add(FIRST_LINE);
    parameters.add(PREFIX);

    helper.execute(options);

    verify(options).append(PREFIX + FIRST_LINE);
  }

  @Test
  public void executeMultiLineNoPrefix() {
    parameters.add(MULTI_LINE);

    helper.execute(options);

    verify(options).append(MULTI_LINE);
  }

  @Test
  public void executeMultiLineWithPrefix() {
    parameters.add(MULTI_LINE);
    parameters.add(PREFIX);

    helper.execute(options);

    verify(options).append(PREFIX + FIRST_LINE + "\n" + PREFIX + SECOND_LINE);
  }
}
