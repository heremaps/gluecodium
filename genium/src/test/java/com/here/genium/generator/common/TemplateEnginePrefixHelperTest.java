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

  private static final String PREFIX = " <!-- ";
  private static final String FIRST_LINE = "complete";
  private static final String SECOND_LINE = "nonsense";
  private static final String MULTI_LINE = FIRST_LINE + "\n" + SECOND_LINE;

  private final List<Object> parameters = new LinkedList<>();

  @Mock private Options options;

  private final TemplateEngine.PrefixHelper helper = new TemplateEngine.PrefixHelper();

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

  @Test
  public void executeMultiLineWithTrim() {
    parameters.add(FIRST_LINE + "\n\n" + SECOND_LINE);
    parameters.add(PREFIX);

    helper.execute(options);

    final String trimmedPrefix = " <!--";
    verify(options)
        .append(PREFIX + FIRST_LINE + "\n" + trimmedPrefix + "\n" + PREFIX + SECOND_LINE);
  }
}
