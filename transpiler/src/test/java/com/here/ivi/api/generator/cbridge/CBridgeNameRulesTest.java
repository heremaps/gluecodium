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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.common.NameHelper.toUpperCamelCase;
import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import java.util.List;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CppNameRules.class)
public class CBridgeNameRulesTest {

  private static final List<String> PACKAGES = asList("PKG1", "PKG2");
  private static final String INTERFACE_NAME = "TestInterface";
  private static final String TYPE_COLLECTION_NAME = "TestTypeCollection";
  private static final String STRUCT_NAME = "structName";
  public static final String METHOD_NAME = "testMethod";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface anInterface;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private TypeCollection typeCollection;

  @Mock private FStructType francaStruct;
  @Mock private FMethod francaMethod;
  private CBridgeNameRules nameRules;

  @Before
  public void setUp() {
    mockStatic(CppNameRules.class);
    when(anInterface.getPackageNames()).thenReturn(PACKAGES);
    when(anInterface.getName()).thenReturn(INTERFACE_NAME);
    when(typeCollection.getPackageNames()).thenReturn(PACKAGES);
    when(typeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(francaStruct.getName()).thenReturn(STRUCT_NAME);
    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    nameRules = new CBridgeNameRules();
  }

  @Test
  public void getStructNameCreatesProperNameForStructsInTypeCollections() {
    String expectedName =
        prependNameWithPackageAndContainer(
            toUpperCamelCase(STRUCT_NAME) + "Ref", "_", TYPE_COLLECTION_NAME);

    String actualName = nameRules.getStructRefType(typeCollection, francaStruct.getName());

    assertEquals(expectedName, actualName);
  }

  @Test
  public void getStructNameCreatesProperNameForStructsInInterfaces() {
    String expectedName = prependNameWithPackageAndInterface(toUpperCamelCase(STRUCT_NAME) + "Ref");

    String actualName = nameRules.getStructRefType(anInterface, francaStruct.getName());

    assertEquals(expectedName, actualName);
  }

  @Test
  public void getStructBaseNameCreatesProperName() {
    String expectedName = prependNameWithPackageAndInterface(toUpperCamelCase(STRUCT_NAME));

    String actualName = nameRules.getStructBaseName(anInterface, francaStruct.getName());
    assertEquals(expectedName, actualName);
  }

  @Test
  public void getMethodNameCreatesProperName() {
    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    String expectedName = prependNameWithPackageAndInterface(METHOD_NAME);

    String actualName = nameRules.getMethodName(anInterface, francaMethod);
    assertEquals(expectedName, actualName);
  }

  @Test
  public void getMethodNameDoesNotThrowExceptionWhenPackageListIsSingletonList() {
    when(anInterface.getPackageNames()).thenReturn(singletonList("PKG"));
    when(francaMethod.getName()).thenReturn(METHOD_NAME);

    nameRules.getMethodName(anInterface, francaMethod);
  }

  @Test
  public void getHeaderFileNameWithPathReturnsCorrectPath() {
    String expected = "cbridge/PKG1/PKG2/TestInterface.h";

    String actual = nameRules.getHeaderFileNameWithPath(anInterface);

    assertEquals(expected, actual);
  }

  @Test
  public void getImplementationFileNameWithPathReturnsCorrectPath() {
    String expected = "cbridge/PKG1/PKG2/TestInterface.cpp";

    String actual = nameRules.getImplementationFileNameWithPath(anInterface);

    assertEquals(expected, actual);
  }

  @Test
  public void getDelegateNameReturnsCorrectValue() {
    when(CppNameRules.getClassName(any())).thenReturn(INTERFACE_NAME);
    when(CppNameRules.getMethodName(any())).thenReturn(METHOD_NAME);
    String expected = prependNameWithPackageAndInterface(METHOD_NAME, "::");

    String actual = nameRules.getDelegateMethodName(anInterface, francaMethod);

    assertEquals(expected, actual);
  }

  @Test
  public void getBaseApiStructNameReturnsCorrectValue() {
    when(CppNameRules.getClassName(any())).thenReturn(INTERFACE_NAME);
    when(CppNameRules.getStructName(any())).thenReturn(STRUCT_NAME);
    String expected = prependNameWithPackageAndInterface(STRUCT_NAME, "::");

    String actual = nameRules.getBaseApiStructName(anInterface, francaStruct);

    assertEquals(expected, actual);
  }

  private String prependNameWithPackageAndInterface(String name) {
    return prependNameWithPackageAndInterface(name, "_");
  }

  private String prependNameWithPackageAndInterface(String name, String delimiter) {
    return prependNameWithPackageAndContainer(name, delimiter, INTERFACE_NAME);
  }

  private String prependNameWithPackageAndContainer(
      String name, String delimiter, String container) {
    return String.join(delimiter, PACKAGES.get(0), PACKAGES.get(1), container, name);
  }
}
