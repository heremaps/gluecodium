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
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.trimou.util.Strings;

@RunWith(PowerMockRunner.class)
@PrepareForTest({JavaNameRules.class, InstanceRules.class})
public class JavaTypeMapperCustomTypeTest {

  private static final String TYPECOLLECTION_NAME = "typeC0Ll3ction";

  private static final String FMODEL_NAME = "this.is.A.fancy.t3sT.package";
  private static final JavaPackage JAVA_PACKAGE = new JavaPackage(Strings.split(FMODEL_NAME, "."));
  private static final JavaPackage JAVA_PACKAGE_WITH_TYPECOLLECTION_NAME =
      new JavaPackage(Strings.split(FMODEL_NAME, "."));

  private static final String INTERFACE_NAME = "iNt3RfacE";
  private static final String STRUCT_NAME_INTERFACE = "structDefinedIn_Iface";
  private static final String STRUCT_NAME_TYPECOLLECTION = "structDefinedIn_tC";

  @Rule private final ExpectedException expectedException = ExpectedException.none();

  @Mock private FTypeCollection fTypeCollection;
  @Mock private FInterface fInterface;
  @Mock private FModel theModel;
  @Mock private FStructType structType;

  @Mock private FTypeRef francaTypeRef;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FArrayType francaArrayType;
  @Mock private FTypeRef elementType;

  private final JavaTypeMapper typeMapper =
      new JavaTypeMapper(new JavaPackage(Collections.emptyList()));

  @Before
  public void setUp() {
    PowerMockito.mockStatic(JavaNameRules.class, InstanceRules.class);

    MockitoAnnotations.initMocks(this);

    when(theModel.getName()).thenReturn(FMODEL_NAME);

    when(fTypeCollection.getName()).thenReturn(TYPECOLLECTION_NAME);
    when(fTypeCollection.eContainer()).thenReturn(theModel);

    when(fInterface.getName()).thenReturn(INTERFACE_NAME);
    when(fInterface.eContainer()).thenReturn(theModel);
  }

  @Test
  public void mapFStructTypeToJavaTypeInTypeCollection() {
    when(JavaNameRules.getClassName(STRUCT_NAME_TYPECOLLECTION))
        .thenReturn(STRUCT_NAME_TYPECOLLECTION);
    when(structType.getName()).thenReturn(STRUCT_NAME_TYPECOLLECTION);
    when(structType.eContainer()).thenReturn(fTypeCollection);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeRef.getDerived()).thenReturn(structType);

    JavaType result = typeMapper.map(francaTypeRef);

    assertEquals(FMODEL_NAME + "." + STRUCT_NAME_TYPECOLLECTION, result.name);
    assertTrue(result instanceof JavaCustomType);
    JavaCustomType customReturn = (JavaCustomType) result;
    assertEquals(1, customReturn.imports.size());
    assertEquals(
        JAVA_PACKAGE_WITH_TYPECOLLECTION_NAME, customReturn.imports.iterator().next().javaPackage);
    assertEquals(STRUCT_NAME_TYPECOLLECTION, customReturn.imports.iterator().next().className);
    PowerMockito.verifyStatic();
    JavaNameRules.getClassName(STRUCT_NAME_TYPECOLLECTION);
  }

  @Test
  public void mapFStructTypeToJavaTypeInInterface() {
    when(JavaNameRules.getClassName(STRUCT_NAME_INTERFACE)).thenReturn(STRUCT_NAME_INTERFACE);
    when(JavaNameRules.getClassName(INTERFACE_NAME)).thenReturn(INTERFACE_NAME);
    when(structType.getName()).thenReturn(STRUCT_NAME_INTERFACE);
    when(structType.eContainer()).thenReturn(fInterface);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeRef.getDerived()).thenReturn(structType);

    JavaType result = typeMapper.map(francaTypeRef);

    assertEquals(INTERFACE_NAME + "." + STRUCT_NAME_INTERFACE, result.name);
    assertTrue(result instanceof JavaCustomType);
    JavaCustomType customReturn = (JavaCustomType) result;
    assertEquals(1, customReturn.imports.size());
    assertEquals(STRUCT_NAME_INTERFACE, customReturn.simpleName);
    assertEquals(JAVA_PACKAGE, customReturn.imports.iterator().next().javaPackage);
    assertEquals(INTERFACE_NAME, customReturn.imports.iterator().next().className);
    PowerMockito.verifyStatic();
    JavaNameRules.getClassName(STRUCT_NAME_INTERFACE);
    PowerMockito.verifyStatic();
    JavaNameRules.getClassName(INTERFACE_NAME);
  }

  @Test
  public void mapFIntegerIntervalThrowsTranspilerException() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeRef.getDerived()).thenReturn(null);
    when(francaTypeRef.getInterval()).thenReturn(mock(FIntegerInterval.class));

    //pre-verify expected exception
    expectedException.expect(TranspilerExecutionException.class);

    //act
    typeMapper.map(francaTypeRef);
  }

  @Test
  public void mapTypeDef() {
    FTypeRef mockFloatType = mock(FTypeRef.class);
    when(mockFloatType.getPredefined()).thenReturn(FBasicTypeId.FLOAT);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeDef.getName()).thenReturn("MyUsingAlias");
    when(francaTypeDef.getActualType()).thenReturn(mockFloatType);
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(false);

    JavaType result = typeMapper.map(francaTypeRef);

    assertTrue(result instanceof JavaPrimitiveType);
    JavaPrimitiveType javaPrimitiveTypeResult = (JavaPrimitiveType) result;
    assertEquals("float", javaPrimitiveTypeResult.name);
    assertEquals(JavaPrimitiveType.FLOAT.getName(), javaPrimitiveTypeResult.type.getValue());
    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void mapInstanceTypeDef() {
    List<String> packageNames = Arrays.asList("the", "franca", "package", "names");
    String className = "MyClazz";
    when(francaTypeDef.getName()).thenReturn(className);
    when(francaTypeDef.eContainer()).thenReturn(fInterface);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(theModel.getName()).thenReturn(String.join(".", packageNames));
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(true);
    when(JavaNameRules.getClassName(INTERFACE_NAME)).thenReturn(INTERFACE_NAME);

    JavaType result = typeMapper.map(francaTypeRef);

    assertTrue(result instanceof JavaCustomType);
    JavaCustomType customResult = (JavaCustomType) result;
    assertEquals(INTERFACE_NAME, customResult.name);
    assertEquals(1, customResult.imports.size());
    assertEquals(packageNames, customResult.imports.iterator().next().javaPackage.packageNames);
    PowerMockito.verifyStatic();
    JavaNameRules.getClassName(INTERFACE_NAME);
    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void mapArray() {
    when(francaTypeRef.getDerived()).thenReturn(francaArrayType);
    when(francaArrayType.getElementType()).thenReturn(elementType);
    when(elementType.getPredefined()).thenReturn(FBasicTypeId.STRING);

    JavaType arrayType = typeMapper.map(francaTypeRef);

    assertTrue(arrayType instanceof JavaTemplateType);
    JavaTemplateType templateType = (JavaTemplateType) arrayType;
    assertEquals("List<String>", templateType.name);
    assertEquals("List<String>", templateType.simpleName);
    assertEquals(JavaTemplateType.TemplateClass.LIST, templateType.templateClass);
  }

  @Test
  public void mapArrayOfPrimitiveType() {
    when(francaTypeRef.getDerived()).thenReturn(francaArrayType);
    when(francaArrayType.getElementType()).thenReturn(elementType);
    when(elementType.getPredefined()).thenReturn(FBasicTypeId.FLOAT);

    JavaType arrayType = typeMapper.map(francaTypeRef);

    assertTrue(arrayType instanceof JavaTemplateType);
    JavaTemplateType templateType = (JavaTemplateType) arrayType;
    assertEquals("List<Float>", templateType.name);
    assertEquals("List<Float>", templateType.simpleName);
    assertEquals(JavaTemplateType.TemplateClass.LIST, templateType.templateClass);
  }
}
