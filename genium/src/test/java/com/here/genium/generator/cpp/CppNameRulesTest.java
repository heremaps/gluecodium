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
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.genium.generator.common.NameHelper;
import com.here.genium.model.common.InstanceRules;
import java.util.List;
import org.franca.core.franca.FCompoundType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({InstanceRules.class, NameHelper.class})
public class CppNameRulesTest {

  @Mock private FModel fModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FInterface francaInterface;
  @Mock private FType fType;
  @Mock private FCompoundType compound;
  @Mock private FEnumerationType enumeration;
  @Mock private FTypeDef typeDef;
  @Mock private FConstantDef fConstantDef;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(InstanceRules.class);
    PowerMockito.spy(NameHelper.class);

    when(francaInterface.eContainer()).thenReturn(fModel);
    when(francaTypeCollection.eContainer()).thenReturn(fModel);

    when(francaInterface.getName()).thenReturn("AnInterface");
    when(fModel.getName()).thenReturn("a.b.c");
  }

  @Test
  public void getNestedNameSpecifierForTypeFromInterface() {
    when(francaInterface.getName()).thenReturn("Iface");
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(fType.eContainer()).thenReturn(francaInterface);

    //act
    List<String> qualifier = CppNameRules.getNestedNameSpecifier(fType);

    //assert
    assertEquals(asList("my", "fancy", "package", "Iface"), qualifier);
  }

  @Test
  public void getNestedNameSpecifierForTypeFromTypeCollection() {
    when(francaTypeCollection.getName()).thenReturn("TCollection");
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(fType.eContainer()).thenReturn(francaTypeCollection);

    //act
    List<String> qualifier = CppNameRules.getNestedNameSpecifier(fType);

    //assert
    assertEquals(asList("my", "fancy", "package"), qualifier);
  }

  @Test
  public void getHeaderNameForInterface() {
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(francaInterface.getName()).thenReturn("FancyName");

    String headerPath = CppNameRules.getHeaderPath(francaInterface);

    assertEquals("my/fancy/package/FancyName.h", headerPath);

    verify(francaInterface).getName();
    verify(fModel).getName();
  }

  @Test
  public void getHeaderNameForTypeCollection() {
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(francaTypeCollection.getName()).thenReturn("FancyTypeCollectionName");

    String headerPath = CppNameRules.getHeaderPath(francaTypeCollection);

    assertEquals("my/fancy/package/FancyTypeCollectionName.h", headerPath);

    verify(francaTypeCollection).getName();
    verify(fModel).getName();
  }

  @Test
  public void getFullyQualifiedNameOfCompoundType() {
    when(compound.eContainer()).thenReturn(francaInterface);
    when(compound.getName()).thenReturn("TestCompound");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(compound);

    assertEquals("::a::b::c::AnInterface::TestCompound", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfTypeCollectionCompoundType() {
    when(compound.eContainer()).thenReturn(francaTypeCollection);
    when(compound.getName()).thenReturn("TestCompound");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(compound);

    assertEquals("::a::b::c::TestCompound", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfEnumeration() {
    when(enumeration.eContainer()).thenReturn(francaInterface);
    when(enumeration.getName()).thenReturn("TestEnumeration");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(enumeration);

    assertEquals("::a::b::c::AnInterface::TestEnumeration", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfTypeCollectionEnumeration() {
    when(enumeration.eContainer()).thenReturn(francaTypeCollection);
    when(enumeration.getName()).thenReturn("TestEnumeration");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(enumeration);

    assertEquals("::a::b::c::TestEnumeration", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfSimpleTypeDefinition() {
    when(typeDef.eContainer()).thenReturn(francaInterface);
    when(typeDef.getName()).thenReturn("TestTypeDefinition");
    when(InstanceRules.isInstanceId(typeDef)).thenReturn(false);

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(typeDef);

    assertEquals("::a::b::c::AnInterface::TestTypeDefinition", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfInstanceIdTypeDefinition() {
    when(typeDef.eContainer()).thenReturn(francaInterface);
    when(typeDef.getName()).thenReturn("TestTypeDefinition");
    when(InstanceRules.isInstanceId(typeDef)).thenReturn(true);

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(typeDef);

    assertEquals("::a::b::c::AnInterface", fullyQualifiedName);
  }

  @Test
  public void getConstantFullyQualifiedName() {
    when(fConstantDef.eContainer()).thenReturn(francaInterface);
    when(fConstantDef.getName()).thenReturn("fixed");

    String fullyQualifiedName = CppNameRules.getConstantFullyQualifiedName(fConstantDef);

    assertEquals("::a::b::c::AnInterface::FIXED", fullyQualifiedName);
  }

  @Test
  public void getEnumEntryName() {
    CppNameRules.getEnumEntryName("Any name will do");

    PowerMockito.verifyStatic(times(1));
    NameHelper.toUpperSnakeCase(any());
  }

  @Test
  public void getFullyQualifiedNameFromNamespaceParts() {
    assertEquals("::NAME", CppNameRules.getFullyQualifiedName(emptyList(), "NAME"));
    assertEquals("::A::B::NAME", CppNameRules.getFullyQualifiedName(asList("A", "B"), "NAME"));
  }
}
