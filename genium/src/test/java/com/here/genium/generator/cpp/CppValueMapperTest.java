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

import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class CppValueMapperTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FField francaField;

  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FQualifiedElementRef francaElementRef;

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private CppNameResolver nameResolver;

  private CppValueMapper valueMapper;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    valueMapper = new CppValueMapper(deploymentModel, nameResolver);

    when(deploymentModel.getDefaultValue(francaField)).thenReturn("SomeString");

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaEnumerationType.eContainer()).thenReturn(francaTypeCollection);
    when(francaEnumerator.eContainer()).thenReturn(francaEnumerationType);

    when(francaModel.getName()).thenReturn("");
  }

  @Test
  public void mapNonConstantValue() {
    CppValue mappedValue = valueMapper.map(francaElementRef);

    assertNull(mappedValue);
  }

  @Test
  public void mapEnumValue() {
    when(deploymentModel.isExternalType(any())).thenReturn(true);
    when(francaElementRef.getElement()).thenReturn(francaEnumerator);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn("nonsense");

    CppValue mappedValue = valueMapper.map(francaElementRef);

    assertNotNull(mappedValue);
  }

  @Test
  public void mapExternalEnumValue() {
    when(francaElementRef.getElement()).thenReturn(francaEnumerator);
    when(nameResolver.getFullyQualifiedName(any())).thenReturn("nonsense");

    CppValue mappedValue = valueMapper.map(francaElementRef);

    assertNotNull(mappedValue);
  }

  @Test
  public void mapDeploymentDefaultValueForString() {
    CppTypeRef cppTypeRef = CppTypeMapper.STRING_TYPE;
    when(deploymentModel.getDefaultValue(francaField)).thenReturn("\\Jonny \"Magic\" Smith\n");

    CppValue result = valueMapper.mapDeploymentDefaultValue(cppTypeRef, francaField);

    assertEquals("\"\\\\Jonny \\\"Magic\\\" Smith\\n\"", result.name);
  }

  @Test
  public void mapDeploymentDefaultValueForEnum() {
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("SomeType").refersToEnum(true).build();

    CppValue result = valueMapper.mapDeploymentDefaultValue(cppTypeRef, francaField);

    assertEquals("SomeType::SOME_STRING", result.name);
  }

  @Test
  public void mapDeploymentDefaultValueForExternalEnumReadsNameVerbatim() {
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("SomeType").refersToEnum(true).build();
    when(deploymentModel.isExternalType(any())).thenReturn(true);

    CppValue result = valueMapper.mapDeploymentDefaultValue(cppTypeRef, francaField);

    assertEquals("SomeType::SomeString", result.name);
  }

  @Test
  public void mapDeploymentDefaultValueForInteger() {
    CppTypeRef cppTypeRef = CppPrimitiveTypeRef.UINT64;

    CppValue result = valueMapper.mapDeploymentDefaultValue(cppTypeRef, francaField);

    assertEquals("SomeString", result.name);
  }
}
