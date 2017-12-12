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

package com.here.ivi.api.generator.swift;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.rules.InstanceRules;
import com.here.ivi.api.model.swift.SwiftContainerType;
import com.here.ivi.api.model.swift.SwiftType;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({DefinedBy.class, InstanceRules.class})
public class SwiftTypeMapperTest {

  private static final String TYPE_COLLECTION_NAME = "SomeTypes";
  private static final String INTERFACE_NAME = "SomeFace";
  private static final String STRUCT_NAME = "SomeStruct";

  @Mock private FrancaDeploymentModel deploymentModel;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FInterface francaInterface;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FStructType francaStructType;
  @Mock private FTypeDef francaTypeDef;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(DefinedBy.class, InstanceRules.class);

    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);
    when(francaStructType.getName()).thenReturn(STRUCT_NAME);
    when(francaTypeDef.getName()).thenReturn(INTERFACE_NAME);

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaTypeCollection);
    when(DefinedBy.findDefiningTypeCollection(francaTypeDef)).thenReturn(francaInterface);
  }

  @Test
  public void mapTypeWithStructTypeRefCreatesStructTypeRef() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftContainerType);
    assertEquals(SwiftType.TypeCategory.STRUCT, resultType.category);
    assertEquals(STRUCT_NAME, resultType.name);
  }

  @Test
  public void mapTypeWithStructTypeRefSetsCNames() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftContainerType);
    SwiftContainerType containerType = (SwiftContainerType) resultType;
    final String expectedCName = TYPE_COLLECTION_NAME + "_" + STRUCT_NAME;
    assertEquals(expectedCName, containerType.cPrefix);
    assertEquals(expectedCName + "Ref", containerType.cType);
  }

  @Test
  public void mapTypeWithInstanceTypeRefCreatesStructTypeRef() {
    when(InstanceRules.isInstanceId(any(FTypeDef.class))).thenReturn(true);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftContainerType);
    assertEquals(SwiftType.TypeCategory.CLASS, resultType.category);
    assertEquals(INTERFACE_NAME, resultType.name);
  }

  @Test
  public void mapTypeWithInstanceTypeRefSetsCNames() {
    when(InstanceRules.isInstanceId(any(FTypeDef.class))).thenReturn(true);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftContainerType);
    SwiftContainerType containerType = (SwiftContainerType) resultType;
    final String expectedCName = INTERFACE_NAME;
    assertEquals(expectedCName, containerType.cPrefix);
    assertEquals(expectedCName + "Ref", containerType.cType);
  }
}
