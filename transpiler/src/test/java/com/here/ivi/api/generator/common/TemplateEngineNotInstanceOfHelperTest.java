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

import static org.mockito.Mockito.*;

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
public class TemplateEngineNotInstanceOfHelperTest {

  private final Object object = new Object();
  private final List<Object> parameters = new LinkedList<>();

  @Mock private Options options;

  private final TemplateEngine.InstanceOfHelper helper = new TemplateEngine.InstanceOfHelper(false);

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    parameters.add(object);

    when(options.getParameters()).thenReturn(parameters);
  }

  @Test
  public void executeNoParameters() {
    parameters.clear();

    helper.execute(options);

    verify(options, never()).fn();
  }

  @Test
  public void executeOneParameter() {
    helper.execute(options);

    verify(options, never()).fn();
  }

  @Test
  public void executeTrue() {
    parameters.add("Object");

    helper.execute(options);

    verify(options, never()).fn();
  }

  @Test
  public void executeFalse() {
    parameters.add("String");

    helper.execute(options);

    verify(options).fn();
  }
}
