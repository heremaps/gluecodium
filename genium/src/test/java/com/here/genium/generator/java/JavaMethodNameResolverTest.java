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

package com.here.genium.generator.java;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.test.ArrayEList;
import java.util.Arrays;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FrancaTypeHelper.class)
public final class JavaMethodNameResolverTest {

  @Mock private FMethod francaMethod;
  @Mock private FMethod anotherMethod;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FArgument arrayArgument;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FArgument inlineArrayArgument;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FArgument mapArgument;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FArgument intArgument;

  private final ArrayEList<FArgument> arguments = new ArrayEList<>();
  private final ArrayEList<FArgument> otherArguments = new ArrayEList<>();

  private final JavaMethodNameResolver methodNameResolver = new JavaMethodNameResolver();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(FrancaTypeHelper.class);

    when(francaMethod.getName()).thenReturn("produce_more");
    when(francaMethod.getSelector()).thenReturn("nonsense");
    when(francaMethod.getInArgs()).thenReturn(arguments);
    when(anotherMethod.getInArgs()).thenReturn(otherArguments);

    when(arrayArgument.getType().getDerived()).thenReturn(mock(FArrayType.class));
    when(inlineArrayArgument.isArray()).thenReturn(true);
    when(inlineArrayArgument.getType().getPredefined()).thenReturn(FBasicTypeId.INT32);
    when(mapArgument.getType().getDerived()).thenReturn(mock(FMapType.class));
    when(intArgument.getType().getPredefined()).thenReturn(FBasicTypeId.INT8);

    when(FrancaTypeHelper.getFullName(francaMethod)).thenReturn("some_nonsense_cache_key");
    when(FrancaTypeHelper.getFullName(anotherMethod)).thenReturn("another_nonsense_cache_key");
    when(FrancaTypeHelper.getAllOverloads(any()))
        .thenReturn(new ArrayEList<>(Arrays.asList(francaMethod, anotherMethod)));
  }

  @Test
  public void getName() {
    otherArguments.add(intArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMore", result);
  }

  @Test
  public void getNameWithArray() {
    arguments.add(arrayArgument);
    otherArguments.add(intArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMore", result);
  }

  @Test
  public void getNameWithInlineArray() {
    arguments.add(inlineArrayArgument);
    otherArguments.add(intArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMore", result);
  }

  @Test
  public void getNameWithMap() {
    arguments.add(mapArgument);
    otherArguments.add(intArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMore", result);
  }

  @Test
  public void getNameWithArrayAmbiguity() {
    arguments.add(arrayArgument);
    otherArguments.add(arrayArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMoreNonsense", result);
  }

  @Test
  public void getNameWithInlineArrayAmbiguity() {
    arguments.add(inlineArrayArgument);
    otherArguments.add(arrayArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMoreNonsense", result);
  }

  @Test
  public void getNameWithMapAmbiguity() {
    arguments.add(mapArgument);
    otherArguments.add(mapArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMoreNonsense", result);
  }

  @Test
  public void getNameWithArrayDifferentOrder() {
    arguments.add(arrayArgument);
    arguments.add(intArgument);
    otherArguments.add(intArgument);
    otherArguments.add(arrayArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMore", result);
  }

  @Test
  public void getNameWithMapDifferentOrder() {
    arguments.add(mapArgument);
    arguments.add(intArgument);
    otherArguments.add(intArgument);
    otherArguments.add(mapArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMore", result);
  }

  @Test
  public void getNameWithArrayAndMap() {
    arguments.add(arrayArgument);
    otherArguments.add(mapArgument);

    String result = methodNameResolver.getName(francaMethod);

    assertEquals("produceMore", result);
  }
}
