/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.validator;

import static junit.framework.TestCase.assertNotNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.InstanceRules;
import com.here.ivi.api.model.franca.DefinedBy;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({InstanceRules.class, DefinedBy.class})
public class MapKeyValidatorPredicateInstanceTest {

  @Mock private FMapType francaMapType;

  @Before
  public void setUp() {
    FTypeCollection typeCollection = mock(FTypeCollection.class);
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(InstanceRules.class, DefinedBy.class);
    when(DefinedBy.findDefiningTypeCollection(francaMapType)).thenReturn(typeCollection);
    when(DefinedBy.getModelName(typeCollection)).thenReturn("");
    when(typeCollection.getName()).thenReturn("");
    when(francaMapType.getName()).thenReturn("MyMap");
  }

  @Test
  public void validateAgainstInstanceKeys() {

    //arrange
    FTypeRef toOuterTypeDefRef = mock(FTypeRef.class);
    FTypeDef outerTypeDef = mock(FTypeDef.class);
    FTypeRef outerToInnerTypeDefRef = mock(FTypeRef.class);
    FTypeDef innerTypeDef = mock(FTypeDef.class);
    FTypeRef fromInnerTypeDefRef = mock(FTypeRef.class);

    when(toOuterTypeDefRef.getDerived()).thenReturn(outerTypeDef);
    when(outerTypeDef.getActualType()).thenReturn(outerToInnerTypeDefRef);
    when(outerToInnerTypeDefRef.getDerived()).thenReturn(innerTypeDef);
    when(innerTypeDef.getActualType()).thenReturn(fromInnerTypeDefRef);

    when(francaMapType.getKeyType()).thenReturn(toOuterTypeDefRef);

    PowerMockito.when(InstanceRules.isInstanceId(toOuterTypeDefRef)).thenReturn(false);
    PowerMockito.when(InstanceRules.isInstanceId(innerTypeDef)).thenReturn(true);

    //act & assert
    assertNotNull(new MapKeyValidatorPredicate().validate(null, francaMapType));
  }
}
