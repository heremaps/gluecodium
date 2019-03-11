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

package com.here.genium.model.common;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.genium.model.franca.DefinedBy;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(DefinedBy.class)
public final class InstanceRulesTest {

  private static final String CLASS_NAME = "MyClass";

  @Mock private FTypeDef francaTypeDef;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FType derivedType;
  @Mock private FTypeCollection typeCollection;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(DefinedBy.class);

    when(francaTypeDef.getActualType()).thenReturn(francaTypeRef);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class))).thenReturn(typeCollection);
    when(typeCollection.getName()).thenReturn(CLASS_NAME);
  }

  @Test
  public void checkDerived() {
    when(francaTypeRef.getDerived()).thenReturn(derivedType);

    assertFalse(InstanceRules.isInstanceId(francaTypeDef));
  }

  @Test
  public void checkUndefined() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT32);

    assertFalse(InstanceRules.isInstanceId(francaTypeDef));
  }

  @Test
  public void checkTypedefWithDifferentNameThanClass() {
    when(francaTypeDef.getName()).thenReturn("Not" + CLASS_NAME);

    assertFalse(InstanceRules.isInstanceId(francaTypeDef));

    verifyStatic();
    DefinedBy.findDefiningTypeCollection(francaTypeDef);
  }

  @Test
  public void checkTypedefWithSameNameAsClass() {
    when(francaTypeDef.getName()).thenReturn(CLASS_NAME);

    assertTrue(InstanceRules.isInstanceId(francaTypeDef));

    verifyStatic();
    DefinedBy.findDefiningTypeCollection(francaTypeDef);
  }
}
