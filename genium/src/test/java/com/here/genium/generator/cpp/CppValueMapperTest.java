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

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.*;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppValueMapperTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FQualifiedElementRef francaElementRef;

  @Mock private CppIncludeResolver includeResolver;

  private final Include internalInclude = Include.createInternalInclude("nonsense");

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(includeResolver.resolveInclude(any())).thenReturn(internalInclude);

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaEnumerationType.eContainer()).thenReturn(francaTypeCollection);
    when(francaEnumerator.eContainer()).thenReturn(francaEnumerationType);

    when(francaModel.getName()).thenReturn("");
  }

  @Test
  public void mapNonConstantValue() {
    CppValue mappedValue = CppValueMapper.map(francaElementRef);

    assertNull(mappedValue);
  }

  @Test
  public void mapEnumValue() {
    when(francaElementRef.getElement()).thenReturn(francaEnumerator);

    CppValue mappedValue = CppValueMapper.map(francaElementRef);

    assertNotNull(mappedValue);
  }

  @Test
  public void mapDeploymentDefaultValueForString() {
    CppTypeRef cppTypeRef = CppTypeMapper.STRING_TYPE;

    CppValue result =
        CppValueMapper.mapDeploymentDefaultValue(cppTypeRef, "\\Jonny \"Magic\" Smith\n");

    assertEquals("\"\\\\Jonny \\\"Magic\\\" Smith\\n\"", result.name);
  }

  @Test
  public void mapDeploymentDefaultValueForEnum() {
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("SomeType").refersToEnum(true).build();

    CppValue result = CppValueMapper.mapDeploymentDefaultValue(cppTypeRef, "SomeString");

    assertEquals("SomeType::SOME_STRING", result.name);
  }

  @Test
  public void mapDeploymentDefaultValueForInteger() {
    CppTypeRef cppTypeRef = CppPrimitiveTypeRef.UINT64;

    CppValue result = CppValueMapper.mapDeploymentDefaultValue(cppTypeRef, "SomeString");

    assertEquals("SomeString", result.name);
  }
}
