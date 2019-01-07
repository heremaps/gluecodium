/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.*;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.trimou.util.Strings;

@RunWith(PowerMockRunner.class)
@PrepareForTest({InstanceRules.class, JavaValueMapper.class})
public class JavaTypeMapperCustomTypeTest {

  private static final String TYPECOLLECTION_NAME = "typeC0Ll3ction";

  private static final String FMODEL_NAME = "this.is.A.fancy.t3sT.package";
  private static final JavaPackage JAVA_PACKAGE = new JavaPackage(Strings.split(FMODEL_NAME, "."));
  private static final JavaPackage JAVA_PACKAGE_WITH_TYPECOLLECTION_NAME =
      new JavaPackage(Strings.split(FMODEL_NAME, "."));

  private static final String INTERFACE_NAME = "INt3RfacE";
  private static final String STRUCT_NAME_INTERFACE = "StructDefinedInIface";
  private static final String STRUCT_NAME_TYPECOLLECTION = "StructDefinedIntC";
  private static final String ENUMERATION_NAME = "MyEnumName";
  private static final String ENUMERATION_NAME_INTERFACE = "MyEnumDefinedInInterface";
  private static final String ENUMERATION_NAME_TYPECOLLECTION = "MyEnumDefinedInTypeCollection";

  @Mock private FTypeCollection fTypeCollection;
  @Mock private FInterface fInterface;
  @Mock private FModel theModel;
  @Mock private FStructType francaStructType;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FTypeDef francaTypeDef;
  @Mock private FArrayType francaArrayType;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FMapType francaMapType;
  @Mock private FField francaField;
  @Mock private FTypeRef francaPrimitiveTypeRef;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final JavaType notNullAnnotation = new JavaCustomType("foo");
  private final JavaType nullableAnnotation = new JavaCustomType("bar");

  private final JavaTypeMapper typeMapper =
      new JavaTypeMapper(
          new JavaPackage(Collections.emptyList()), null, notNullAnnotation, nullableAnnotation);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(InstanceRules.class, JavaValueMapper.class);

    MockitoAnnotations.initMocks(this);

    when(theModel.getName()).thenReturn(FMODEL_NAME);

    when(fTypeCollection.getName()).thenReturn(TYPECOLLECTION_NAME);
    when(fTypeCollection.eContainer()).thenReturn(theModel);

    when(fInterface.getName()).thenReturn(INTERFACE_NAME);
    when(fInterface.eContainer()).thenReturn(theModel);

    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeDef.getActualType()).thenReturn(mock(FTypeRef.class));
    when(francaTypeDef.eContainer()).thenReturn(fInterface);
    when(francaEnumerationType.getName()).thenReturn(ENUMERATION_NAME);
    when(francaPrimitiveTypeRef.getPredefined()).thenReturn(FBasicTypeId.DOUBLE);

    when(francaStructType.eContainer()).thenReturn(fInterface);
    when(francaEnumerationType.eContainer()).thenReturn(fInterface);
    when(francaArrayType.eContainer()).thenReturn(fInterface);
  }

  @Test
  public void mapStructTypeToJavaTypeInTypeCollection() {
    when(francaStructType.getName()).thenReturn(STRUCT_NAME_TYPECOLLECTION);
    when(francaStructType.eContainer()).thenReturn(fTypeCollection);
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertEquals(STRUCT_NAME_TYPECOLLECTION, result.name);
    assertTrue(result instanceof JavaCustomType);
    JavaCustomType customReturn = (JavaCustomType) result;
    assertEquals(1, customReturn.imports.size());
    assertEquals(
        JAVA_PACKAGE_WITH_TYPECOLLECTION_NAME,
        customReturn.imports.iterator().next().getJavaPackage());
    assertEquals(STRUCT_NAME_TYPECOLLECTION, customReturn.imports.iterator().next().getClassName());
    assertFalse(customReturn.isInterface());
  }

  @Test
  public void mapStructTypeToJavaTypeInInterface() {
    when(francaStructType.getName()).thenReturn(STRUCT_NAME_INTERFACE);
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertEquals(INTERFACE_NAME + "." + STRUCT_NAME_INTERFACE, result.name);
    assertTrue(result instanceof JavaCustomType);
    JavaCustomType customReturn = (JavaCustomType) result;
    assertEquals(1, customReturn.imports.size());
    assertEquals(2, customReturn.classNames.size());
    assertEquals(STRUCT_NAME_INTERFACE, customReturn.classNames.get(1));
    assertEquals(JAVA_PACKAGE, customReturn.imports.iterator().next().getJavaPackage());
    assertEquals(INTERFACE_NAME, customReturn.imports.iterator().next().getClassName());
    assertFalse(customReturn.isInterface());
  }

  @Test
  public void mapTypeDef() {
    FTypeRef mockFloatType = mock(FTypeRef.class);
    when(mockFloatType.getPredefined()).thenReturn(FBasicTypeId.FLOAT);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeDef.getName()).thenReturn("MyUsingAlias");
    when(francaTypeDef.getActualType()).thenReturn(mockFloatType);
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(false);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

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
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(theModel.getName()).thenReturn(String.join(".", packageNames));
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertTrue(result instanceof JavaCustomType);
    JavaCustomType customResult = (JavaCustomType) result;
    assertEquals(INTERFACE_NAME, customResult.name);
    assertEquals(1, customResult.imports.size());
    assertEquals(
        packageNames, customResult.imports.iterator().next().getJavaPackage().getPackageNames());
    assertTrue(customResult.isInterface());

    PowerMockito.verifyStatic();
    InstanceRules.isInstanceId(francaTypeDef);
  }

  @Test
  public void mapArray() {
    when(francaArrayType.getElementType()).thenReturn(francaTypeRef);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.STRING);

    JavaType arrayType = typeMapper.mapArray(francaArrayType);

    assertTrue(arrayType instanceof JavaTemplateType);
    JavaTemplateType templateType = (JavaTemplateType) arrayType;
    assertEquals("List<String>", templateType.name);
    assertEquals(1, templateType.classNames.size());
    assertEquals("List", templateType.classNames.get(0));

    assertFalse(templateType.imports.isEmpty());
    JavaImport javaImport = templateType.imports.iterator().next();
    assertEquals(JavaTemplateType.JAVA_UTIL, javaImport.getJavaPackage());
    assertEquals("List", javaImport.getClassName());
  }

  @Test
  public void mapArrayOfPrimitiveType() {
    when(francaArrayType.getElementType()).thenReturn(francaTypeRef);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);

    JavaType arrayType = typeMapper.mapArray(francaArrayType);

    assertTrue(arrayType instanceof JavaTemplateType);
    JavaTemplateType templateType = (JavaTemplateType) arrayType;
    assertEquals("List<Float>", templateType.name);
    assertEquals(1, templateType.classNames.size());
  }

  @Test
  public void mapFrancaEnumerationTypeInTypeCollection() {
    // arrange
    when(francaEnumerationType.getName()).thenReturn(ENUMERATION_NAME_TYPECOLLECTION);
    when(francaEnumerationType.eContainer()).thenReturn(fTypeCollection);
    when(francaTypeRef.getDerived()).thenReturn(francaEnumerationType);

    // act
    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    // assert
    assertEquals(ENUMERATION_NAME_TYPECOLLECTION, result.name);
    assertTrue(result instanceof JavaEnumType);
    JavaEnumType enumReturn = (JavaEnumType) result;
    assertEquals(1, enumReturn.imports.size());

    assertEquals(
        JAVA_PACKAGE_WITH_TYPECOLLECTION_NAME,
        enumReturn.imports.iterator().next().getJavaPackage());
    assertEquals(
        ENUMERATION_NAME_TYPECOLLECTION, enumReturn.imports.iterator().next().getClassName());
  }

  @Test
  public void mapFrancaEnumerationTypeToJavaTypeInInterface() {
    // arrange
    when(francaEnumerationType.getName()).thenReturn(ENUMERATION_NAME_INTERFACE);
    when(francaEnumerationType.eContainer()).thenReturn(fInterface);
    when(francaTypeRef.getDerived()).thenReturn(francaEnumerationType);

    // act
    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    // assert
    assertEquals(INTERFACE_NAME + "." + ENUMERATION_NAME_INTERFACE, result.name);
    assertTrue(result instanceof JavaEnumType);
    JavaEnumType enumReturn = (JavaEnumType) result;
    assertEquals(1, enumReturn.imports.size());
    assertEquals(INTERFACE_NAME + "." + ENUMERATION_NAME_INTERFACE, enumReturn.name);
    assertEquals(JAVA_PACKAGE, enumReturn.imports.iterator().next().getJavaPackage());
    assertEquals(INTERFACE_NAME, enumReturn.imports.iterator().next().getClassName());
  }

  @Test
  public void mapMap() {
    FTypeRef anotherTypeRef = mock(FTypeRef.class);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.STRING);
    when(anotherTypeRef.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);
    when(francaMapType.getValueType()).thenReturn(anotherTypeRef);

    JavaType arrayType = typeMapper.mapMap(francaMapType);

    assertTrue(arrayType instanceof JavaTemplateType);
    JavaTemplateType templateType = (JavaTemplateType) arrayType;
    assertEquals("Map<String, byte[]>", templateType.name);
    assertEquals("Map", templateType.classNames.get(0));

    assertFalse(templateType.imports.isEmpty());
    JavaImport javaImport = templateType.imports.iterator().next();
    assertEquals(JavaTemplateType.JAVA_UTIL, javaImport.getJavaPackage());
    assertEquals("Map", javaImport.getClassName());
  }

  @Test
  public void mapMapWithPrimitiveTypes() {
    FTypeRef anotherTypeRef = mock(FTypeRef.class);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);
    when(anotherTypeRef.getPredefined()).thenReturn(FBasicTypeId.UINT64);
    when(francaMapType.getKeyType()).thenReturn(francaTypeRef);
    when(francaMapType.getValueType()).thenReturn(anotherTypeRef);

    JavaType arrayType = typeMapper.mapMap(francaMapType);

    assertTrue(arrayType instanceof JavaTemplateType);
    JavaTemplateType templateType = (JavaTemplateType) arrayType;
    assertEquals("Map<Float, Long>", templateType.name);
  }

  @Test
  public void mapStructTypeRefInFieldAddsNotNullAnnotation() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(notNullAnnotation));
  }

  @Test
  public void mapEnumTypeRefInFieldAddsNotNullAnnotation() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnumerationType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(notNullAnnotation));
  }

  @Test
  public void mapArrayTypeRefInFieldAddsNotNullAnnotation() {
    when(francaArrayType.getElementType()).thenReturn(francaPrimitiveTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaArrayType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(notNullAnnotation));
  }

  @Test
  public void mapMapTypeRefInFieldAddsNotNullAnnotation() {
    when(francaMapType.getKeyType()).thenReturn(francaPrimitiveTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaPrimitiveTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaMapType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(notNullAnnotation));
  }

  @Test
  public void mapPrimitiveTypeRefInArrayFieldAddsNotNullAnnotation() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(francaField.isArray()).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(notNullAnnotation));
  }

  @Test
  public void mapInstanceTypeRefInFieldAddsNotNullAnnotation() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(true);
    when(deploymentModel.isNotNull(any())).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(notNullAnnotation));
  }

  @Test
  public void mapStructTypeRefInFieldAddsNullableAnnotation() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(deploymentModel.isNullable(any())).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(nullableAnnotation));
  }

  @Test
  public void mapEnumTypeRefInFieldAddsNullableAnnotation() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnumerationType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(deploymentModel.isNullable(any())).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(nullableAnnotation));
  }

  @Test
  public void mapArrayTypeRefInFieldAddsNullableAnnotation() {
    when(francaArrayType.getElementType()).thenReturn(francaPrimitiveTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaArrayType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(deploymentModel.isNullable(any())).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(nullableAnnotation));
  }

  @Test
  public void mapMapTypeRefInFieldAddsNullableAnnotation() {
    when(francaMapType.getKeyType()).thenReturn(francaPrimitiveTypeRef);
    when(francaMapType.getValueType()).thenReturn(francaPrimitiveTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaMapType);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(deploymentModel.isNullable(any())).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(nullableAnnotation));
  }

  @Test
  public void mapPrimitiveTypeRefInFieldAddsNullableAnnotation() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(deploymentModel.isNullable(any())).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(nullableAnnotation));
  }

  @Test
  public void mapInstanceTypeRefInFieldAddsNullableAnnotation() {
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);
    when(francaTypeRef.eContainer()).thenReturn(francaField);
    when(InstanceRules.isInstanceId(francaTypeDef)).thenReturn(true);
    when(InstanceRules.isInstanceId(francaTypeRef)).thenReturn(true);

    JavaType result = typeMapper.map(francaTypeRef, deploymentModel);

    assertNotNull(result);
    assertTrue(result.annotations.contains(nullableAnnotation));
  }
}
