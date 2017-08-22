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
import static org.mockito.Mockito.times;
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
public class TemplateEngineJoinPartialHelperTest {

  private static final String TEMPLATE_NAME = "glorious";
  private static final String SEPARATOR = " \\o/ ";
  private static final String FIRST_LINE = "complete";
  private static final String SECOND_LINE = "nonsense";

  private final List<String> iterable = new LinkedList<>();
  private final List<Object> parameters = new LinkedList<>();

  @Mock private Options options;

  private final TemplateEngine.JoinPartialHelper helper = new TemplateEngine.JoinPartialHelper();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    iterable.add(FIRST_LINE);

    parameters.add(iterable);
    parameters.add(TEMPLATE_NAME);

    when(options.getParameters()).thenReturn(parameters);
  }

  @Test
  public void executeNoParameters() {
    parameters.clear();

    helper.execute(options);

    verify(options, never()).append(any());
    verify(options, never()).push(any());
    verify(options, never()).partial(any());
    verify(options, never()).pop();
  }

  @Test
  public void executeOneParameter() {
    parameters.clear();
    parameters.add(iterable);

    helper.execute(options);

    verify(options, never()).append(any());
    verify(options, never()).push(any());
    verify(options, never()).partial(any());
    verify(options, never()).pop();
  }

  @Test
  public void executeNotIterableNoSeparator() {
    parameters.set(0, FIRST_LINE);

    helper.execute(options);

    verify(options, never()).append(any());
    verify(options).push(FIRST_LINE);
    verify(options).partial(TEMPLATE_NAME);
    verify(options).pop();
  }

  @Test
  public void executeNotIterableWithSeparator() {
    parameters.set(0, FIRST_LINE);
    parameters.add(SEPARATOR);

    helper.execute(options);

    verify(options, never()).append(any());
    verify(options).push(FIRST_LINE);
    verify(options).partial(TEMPLATE_NAME);
    verify(options).pop();
  }

  @Test
  public void executeOneValueNoSeparator() {
    helper.execute(options);

    verify(options, never()).append(any());
    verify(options).push(FIRST_LINE);
    verify(options).partial(TEMPLATE_NAME);
    verify(options).pop();
  }

  @Test
  public void executeOneValueWithSeparator() {
    parameters.add(SEPARATOR);

    helper.execute(options);

    verify(options, never()).append(any());
    verify(options).push(FIRST_LINE);
    verify(options).partial(TEMPLATE_NAME);
    verify(options).pop();
  }

  @Test
  public void executeTwoValuesNoSeparator() {
    iterable.add(SECOND_LINE);

    helper.execute(options);

    verify(options).append("");
    verify(options).push(FIRST_LINE);
    verify(options).push(SECOND_LINE);
    verify(options, times(2)).partial(TEMPLATE_NAME);
    verify(options, times(2)).pop();
  }

  @Test
  public void executeTwoValuesWithSeparator() {
    parameters.add(SEPARATOR);
    iterable.add(SECOND_LINE);

    helper.execute(options);

    verify(options).append(SEPARATOR);
    verify(options).push(FIRST_LINE);
    verify(options).push(SECOND_LINE);
    verify(options, times(2)).partial(TEMPLATE_NAME);
    verify(options, times(2)).pop();
  }
}
