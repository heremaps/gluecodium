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

package com.here.ivi.api.generator.cpp;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FCompoundType;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
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
@PrepareForTest(InstanceRules.class)
public class CppNameRulesTest {

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement mockFrancaModel;

  @Mock private FModel fModel;
  @Mock private FTypeCollection fTypeCollection;
  @Mock private FInterface fInterface;
  @Mock private FType fType;
  @Mock private Interface anInterface;
  @Mock private TypeCollection typeCollection;
  @Mock private FCompoundType compound;
  @Mock private FEnumerationType enumeration;
  @Mock private FTypeDef typeDef;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(InstanceRules.class);

    when(mockFrancaModel.getFrancaModel()).thenReturn(fModel);
    when(fModel.getName()).thenReturn("");

    when(fInterface.eContainer()).thenReturn(fModel);
    when(fTypeCollection.eContainer()).thenReturn(fModel);

    when(fInterface.getName()).thenReturn("AnInterface");
    when(fModel.getName()).thenReturn("a.b.c");
  }

  @Test
  public void getNestedNameSpecifierForTypeFromInterface() {
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fInterface);
    when(fInterface.getName()).thenReturn("Iface");
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(fType.eContainer()).thenReturn(fInterface);

    //act
    List<String> qualifier = CppNameRules.getNestedNameSpecifier(fType);

    //assert
    assertEquals(Arrays.asList("my", "fancy", "package", "Iface"), qualifier);
  }

  @Test
  public void getNestedNameSpecifierForTypeFromTypeCollection() {
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    when(fTypeCollection.getName()).thenReturn("TCollection");
    when(fModel.getName()).thenReturn("my.fancy.package");
    when(fType.eContainer()).thenReturn(fTypeCollection);

    //act
    List<String> qualifier = CppNameRules.getNestedNameSpecifier(fType);

    //assert
    assertEquals(Arrays.asList("my", "fancy", "package"), qualifier);
  }

  @Test
  public void getHeaderNameForInterface() {
    List<String> packageNames = Arrays.asList("my", "fancy", "package");
    when(anInterface.getPackageNames()).thenReturn(packageNames);
    when(anInterface.getFrancaInterface()).thenReturn(fInterface);
    when(fInterface.getName()).thenReturn("FancyName");

    String headerPath = CppNameRules.getHeaderPath(anInterface);

    assertEquals("cpp/my/fancy/package/FancyName.h", headerPath);

    verify(anInterface).getPackageNames();
    verify(anInterface).getFrancaInterface();
    verify(fInterface).getName();
  }

  @Test
  public void getHeaderNameForTypeCollection() {
    List<String> packageNames = Arrays.asList("my", "fancy", "package");
    when(typeCollection.getPackageNames()).thenReturn(packageNames);
    when(typeCollection.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    when(fTypeCollection.getName()).thenReturn("FancyTypeCollectionName");

    String headerPath = CppNameRules.getHeaderPath(typeCollection);

    assertEquals("cpp/my/fancy/package/FancyTypeCollectionName.h", headerPath);

    verify(typeCollection).getPackageNames();
    verify(typeCollection).getFrancaTypeCollection();
    verify(fTypeCollection).getName();
  }

  @Test
  public void getFullyQualifiedNameOfCompoundType() {
    when(compound.eContainer()).thenReturn(fInterface);
    when(compound.getName()).thenReturn("TestCompound");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(compound);

    assertEquals("::a::b::c::AnInterface::TestCompound", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfTypeCollectionCompoundType() {
    when(compound.eContainer()).thenReturn(fTypeCollection);
    when(compound.getName()).thenReturn("TestCompound");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(compound);

    assertEquals("::a::b::c::TestCompound", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfEnumeration() {
    when(enumeration.eContainer()).thenReturn(fInterface);
    when(enumeration.getName()).thenReturn("TestEnumeration");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(enumeration);

    assertEquals("::a::b::c::AnInterface::TestEnumeration", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfTypeCollectionEnumeration() {
    when(enumeration.eContainer()).thenReturn(fTypeCollection);
    when(enumeration.getName()).thenReturn("TestEnumeration");

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(enumeration);

    assertEquals("::a::b::c::TestEnumeration", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfSimpleTypeDefinition() {
    when(typeDef.eContainer()).thenReturn(fInterface);
    when(typeDef.getName()).thenReturn("TestTypeDefinition");
    when(InstanceRules.isInstanceId(typeDef)).thenReturn(false);

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(typeDef);

    assertEquals("::a::b::c::AnInterface::TestTypeDefinition", fullyQualifiedName);
  }

  @Test
  public void getFullyQualifiedNameOfInstanceIdTypeDefinition() {
    when(typeDef.eContainer()).thenReturn(fInterface);
    when(typeDef.getName()).thenReturn("TestTypeDefinition");
    when(InstanceRules.isInstanceId(typeDef)).thenReturn(true);

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(typeDef);

    assertEquals("::a::b::c::AnInterface", fullyQualifiedName);
  }
}
