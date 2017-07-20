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

package com.here.ivi.api.generator.common.java;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaType;
import java.util.Collections;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
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
@PrepareForTest(JavaNameRules.class)
public class JavaTypeMapperCustomTypeTest {
  private static final String TYPECOLLECTION_NAME = "typeC0Ll3ction";

  private static final String FMODEL_NAME = "this.is.A.fancy.t3sT.package";
  private static final String PACKAGE_WITH_TYPECOLLECTION = FMODEL_NAME + "." + TYPECOLLECTION_NAME;
  private static final JavaPackage JAVA_PACKAGE = new JavaPackage(Strings.split(FMODEL_NAME, "."));
  private static final JavaPackage JAVA_PACKAGE_WITH_TYPECOLLECTION_NAME =
      new JavaPackage(Strings.split(PACKAGE_WITH_TYPECOLLECTION, "."));

  private static final String INTERFACE_NAME = "iNt3RfacE";
  private static final String STRUCT_NAME_INTERFACE = "structDefinedIn_Iface";
  private static final String STRUCT_NAME_TYPECOLLECTION = "structDefinedIn_tC";

  @Mock private static FTypeCollection fTypeCollection;
  @Mock private static FInterface fInterface;
  @Mock private static FModel theModel;
  @Mock private static FStructType structType;

  @Mock private FTypeRef francaTypeRef;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(JavaNameRules.class);
    MockitoAnnotations.initMocks(this);

    when(theModel.getName()).thenReturn(FMODEL_NAME);

    when(fTypeCollection.getName()).thenReturn(TYPECOLLECTION_NAME);
    when(fTypeCollection.eContainer()).thenReturn(theModel);

    when(fInterface.getName()).thenReturn(INTERFACE_NAME);
    when(fInterface.eContainer()).thenReturn(theModel);
  }

  @Test
  public void mapFStructTypeToJavaType_TypeCollection() {

    //static mocks
    when(JavaNameRules.getClassName(STRUCT_NAME_TYPECOLLECTION))
        .thenReturn(STRUCT_NAME_TYPECOLLECTION);
    //non static mocks
    when(structType.getName()).thenReturn(STRUCT_NAME_TYPECOLLECTION);
    when(structType.eContainer()).thenReturn(fTypeCollection);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeRef.getDerived()).thenReturn(structType);

    //act
    JavaType result = JavaTypeMapper.map(new JavaPackage(Collections.emptyList()), francaTypeRef);

    //assert & verify
    assertEquals(STRUCT_NAME_TYPECOLLECTION, result.getName());
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
  public void mapFStructTypeToJavaType_Interface() {

    //static mocks
    when(JavaNameRules.getClassName(STRUCT_NAME_INTERFACE)).thenReturn(STRUCT_NAME_INTERFACE);

    when(JavaNameRules.getClassName(INTERFACE_NAME)).thenReturn(INTERFACE_NAME);

    //non static mocks
    when(structType.getName()).thenReturn(STRUCT_NAME_INTERFACE);
    when(structType.eContainer()).thenReturn(fInterface);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(francaTypeRef.getDerived()).thenReturn(structType);

    //act
    JavaType result = JavaTypeMapper.map(new JavaPackage(Collections.emptyList()), francaTypeRef);

    //assert & verify
    assertEquals(INTERFACE_NAME + "." + STRUCT_NAME_INTERFACE, result.getName());
    assertTrue(result instanceof JavaCustomType);
    JavaCustomType customReturn = (JavaCustomType) result;
    assertEquals(1, customReturn.imports.size());
    assertEquals(JAVA_PACKAGE, customReturn.imports.iterator().next().javaPackage);
    assertEquals(INTERFACE_NAME, customReturn.imports.iterator().next().className);

    PowerMockito.verifyStatic();
    JavaNameRules.getClassName(STRUCT_NAME_INTERFACE);

    PowerMockito.verifyStatic();
    JavaNameRules.getClassName(INTERFACE_NAME);
  }
}
