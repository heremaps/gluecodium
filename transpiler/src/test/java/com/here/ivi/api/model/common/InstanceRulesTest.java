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

package com.here.ivi.api.model.common;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.ivi.api.model.franca.DefinedBy;
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
