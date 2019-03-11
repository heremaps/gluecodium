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

package com.here.genium.generator.common;

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
public class TemplateEngineInstanceOfHelperTest {

  private final Object object = new Object();
  private final List<Object> parameters = new LinkedList<>();

  @Mock private Options options;

  private final TemplateEngine.InstanceOfHelper helper = new TemplateEngine.InstanceOfHelper(true);

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

    verify(options).fn();
  }

  @Test
  public void executeFalse() {
    parameters.add("String");

    helper.execute(options);

    verify(options, never()).fn();
  }
}
