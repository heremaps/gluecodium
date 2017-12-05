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

package com.here.ivi.api.generator.java;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.javamodel.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({DefinedBy.class, JavaNameRules.class, JavaValueMapper.class})
public class JavaTypeMapperMapErrorTest {
  private static final JavaPackage TEST_JAVA_PACKAGE =
      new JavaPackage(Arrays.asList("com", "here", "SomeImport"));

  @Mock private FEnumerationType fEnumerationType;
  @Mock private FTypeCollection fTypeCollection;
  @Mock private FInterface fInterface;

  private final JavaTypeMapper typeMapper = new JavaTypeMapper(TEST_JAVA_PACKAGE);

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(DefinedBy.class, JavaNameRules.class, JavaValueMapper.class);

    when(fEnumerationType.getName()).thenReturn("enumerator");
    when(fTypeCollection.getName()).thenReturn("typeCollection");
    when(JavaNameRules.getExceptionName(any())).thenCallRealMethod();
  }

  @Test
  public void mapErrorClassForTypeCollection() {
    when(DefinedBy.findDefiningTypeCollection(fEnumerationType)).thenReturn(fTypeCollection);
    when(JavaNameRules.getClassName(fEnumerationType.getName())).thenReturn("EnumJavaName");

    JavaExceptionClass result = typeMapper.mapErrorClass(fEnumerationType);

    assertNotNull(result);
    assertEquals("EnumJavaNameException", result.name);
    assertEquals(TEST_JAVA_PACKAGE, result.javaPackage);
    assertEquals("EnumJavaName", result.enumTypeRef.name);
    assertEquals("[EnumJavaName]", result.enumTypeRef.classNames.toString());
    assertEquals(TEST_JAVA_PACKAGE.packageNames, result.enumTypeRef.packageNames);
    assertEquals(1, result.enumTypeRef.imports.size());
    List<JavaImport> imports = new ArrayList<>(result.enumTypeRef.imports);
    assertEquals("EnumJavaName", imports.get(0).className);
    assertEquals(TEST_JAVA_PACKAGE, imports.get(0).javaPackage);
  }

  @Test
  public void mapErrorClassForFInterface() {
    when(DefinedBy.findDefiningTypeCollection(fEnumerationType)).thenReturn(fInterface);
    when(JavaNameRules.getClassName(fEnumerationType.getName())).thenReturn("EnumJavaName");
    when(JavaNameRules.getClassName(fInterface.getName())).thenReturn("fInterfaceJavaName");

    JavaExceptionClass result = typeMapper.mapErrorClass(fEnumerationType);

    assertNotNull(result);
    assertEquals("EnumJavaNameException", result.name);
    assertEquals(TEST_JAVA_PACKAGE, result.javaPackage);
    assertEquals("fInterfaceJavaName.EnumJavaName", result.enumTypeRef.name);
    assertEquals("[fInterfaceJavaName, EnumJavaName]", result.enumTypeRef.classNames.toString());
    assertEquals(TEST_JAVA_PACKAGE.packageNames, result.enumTypeRef.packageNames);
    assertEquals(1, result.enumTypeRef.imports.size());
    List<JavaImport> imports = new ArrayList<>(result.enumTypeRef.imports);
    assertEquals("fInterfaceJavaName", imports.get(0).className);
    assertEquals(TEST_JAVA_PACKAGE, imports.get(0).javaPackage);
  }
}
