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

package com.here.genium.validator;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.franca.DefinedBy;
import java.util.Arrays;
import java.util.Collection;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.powermock.modules.junit4.PowerMockRunnerDelegate;

@RunWith(PowerMockRunner.class)
@PowerMockRunnerDelegate(Parameterized.class)
@PrepareForTest(DefinedBy.class)
public final class MapKeyValidatorPredicateTest {

  private final FBasicTypeId typeId;
  private final FType derivedType;
  private final boolean expectNull;

  @Mock private FMapType mapType;
  @Mock private FTypeRef keyTypeRef;

  public MapKeyValidatorPredicateTest(FBasicTypeId typeId, FType derivedType, boolean expectNull) {
    this.typeId = typeId;
    this.derivedType = derivedType;
    this.expectNull = expectNull;
  }

  @Parameterized.Parameters
  public static Collection<Object[]> testData() {
    return Arrays.asList(
        new Object[][] {
          {FBasicTypeId.BOOLEAN, null, true},
          {FBasicTypeId.FLOAT, null, true},
          {FBasicTypeId.DOUBLE, null, true},
          {FBasicTypeId.INT8, null, true},
          {FBasicTypeId.INT16, null, true},
          {FBasicTypeId.INT32, null, true},
          {FBasicTypeId.INT64, null, true},
          {FBasicTypeId.UINT8, null, true},
          {FBasicTypeId.UINT16, null, true},
          {FBasicTypeId.UINT32, null, true},
          {FBasicTypeId.UINT64, null, true},
          {FBasicTypeId.STRING, null, true},
          {FBasicTypeId.BYTE_BUFFER, null, false},
          {FBasicTypeId.UNDEFINED, null, false},
          {null, mock(FEnumerationType.class), true},
          {null, mock(FStructType.class), false}
        });
  }

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    FTypeCollection typeCollection = mock(FTypeCollection.class);
    PowerMockito.mockStatic(DefinedBy.class);
    when(DefinedBy.findDefiningTypeCollection(mapType)).thenReturn(typeCollection);
    when(DefinedBy.getModelName(typeCollection)).thenReturn("");
    when(typeCollection.getName()).thenReturn("");
    when(mapType.getName()).thenReturn("MyMap");
  }

  @Test
  public void validateKeyType() {
    when(keyTypeRef.getPredefined()).thenReturn(typeId);
    when(keyTypeRef.getDerived()).thenReturn(derivedType);
    when(mapType.getKeyType()).thenReturn(keyTypeRef);

    // act & assert
    if (expectNull) {
      assertNull(new MapKeyValidatorPredicate().validate(null, mapType));
    } else {
      assertNotNull(new MapKeyValidatorPredicate().validate(null, mapType));
    }
  }

  @Test
  public void validateTypeDefToKeyType() {
    when(keyTypeRef.getPredefined()).thenReturn(typeId);
    when(keyTypeRef.getDerived()).thenReturn(derivedType);

    // map typedef
    FTypeDef typeDef = mock(FTypeDef.class);
    FTypeRef typeDefRef = mock(FTypeRef.class);
    when(typeDefRef.getDerived()).thenReturn(typeDef);
    when(typeDef.getActualType()).thenReturn(keyTypeRef);
    when(mapType.getKeyType()).thenReturn(typeDefRef);

    // act & assert
    if (expectNull) {
      assertNull(new MapKeyValidatorPredicate().validate(null, mapType));
    } else {
      assertNotNull(new MapKeyValidatorPredicate().validate(null, mapType));
    }
  }
}
