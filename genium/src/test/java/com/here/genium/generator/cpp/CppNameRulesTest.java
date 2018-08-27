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

package com.here.genium.generator.cpp;

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppNameRulesTest {

  @Mock private FModel fModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FInterface francaInterface;

  private final CppNameRules cppNameRules = CppNameRules.INSTANCE;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaInterface.eContainer()).thenReturn(fModel);
    when(francaTypeCollection.eContainer()).thenReturn(fModel);

    when(francaInterface.getName()).thenReturn("AnInterface");
    when(fModel.getName()).thenReturn("a.b.c");
  }

  @Test
  public void getHeaderNameForInterface() {
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(francaInterface.getName()).thenReturn("FancyName");

    String headerPath = cppNameRules.getHeaderPath(francaInterface);

    assertEquals("my/fancy/package/FancyName.h", headerPath);

    verify(francaInterface).getName();
    verify(fModel).getName();
  }

  @Test
  public void getHeaderNameForTypeCollection() {
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(francaTypeCollection.getName()).thenReturn("FancyTypeCollectionName");

    String headerPath = cppNameRules.getHeaderPath(francaTypeCollection);

    assertEquals("my/fancy/package/FancyTypeCollectionName.h", headerPath);

    verify(francaTypeCollection).getName();
    verify(fModel).getName();
  }

  @Test
  public void joinFullyQualifiedNameFromNamespaceParts() {
    assertEquals("::NAME", CppNameRules.joinFullyQualifiedName(emptyList(), "NAME"));
    assertEquals("::A::B::NAME", CppNameRules.joinFullyQualifiedName(asList("A", "B"), "NAME"));
  }
}
