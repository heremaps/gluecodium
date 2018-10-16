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

package com.here.genium.generator.swift;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.SwiftStruct;
import com.here.genium.model.swift.SwiftType;
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

    assertTrue(resultType instanceof SwiftStruct);
    assertEquals(SwiftType.TypeCategory.STRUCT, resultType.category);
    assertEquals(STRUCT_NAME, resultType.name);
  }

  @Test
  public void mapTypeWithStructTypeRefSetsCNames() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftStruct);
    SwiftStruct containerType = (SwiftStruct) resultType;
    final String expectedCName = TYPE_COLLECTION_NAME + "_" + STRUCT_NAME;
    assertEquals(expectedCName, containerType.cPrefix);
  }

  @Test
  public void mapTypeWithInstanceTypeRefCreatesStructTypeRef() {
    when(InstanceRules.isInstanceId(any(FTypeDef.class))).thenReturn(true);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftStruct);
    assertEquals(SwiftType.TypeCategory.CLASS, resultType.category);
    assertEquals(INTERFACE_NAME, resultType.name);
  }

  @Test
  public void mapTypeWithInstanceTypeRefSetsCNames() {
    when(InstanceRules.isInstanceId(any(FTypeDef.class))).thenReturn(true);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftStruct);
    SwiftStruct containerType = (SwiftStruct) resultType;
    assertEquals(INTERFACE_NAME, containerType.cPrefix);
  }
}
