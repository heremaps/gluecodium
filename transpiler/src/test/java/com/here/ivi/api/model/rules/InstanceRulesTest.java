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

package com.here.ivi.api.model.rules;

import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.assertTrue;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.*;

import com.here.ivi.api.model.franca.DefinedBy;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(DefinedBy.class)
public final class InstanceRulesTest {
  @Mock private FTypeDef typedef;

  @Mock private FTypeRef type;

  @Mock private FType derived;

  @Mock private DefinedBy definer;

  @Before
  public void setUp() {
    mockStatic(DefinedBy.class);
    initMocks(this);
    when(typedef.getActualType()).thenReturn(type);
  }

  @Test
  public void checkDerived() {
    when(type.getDerived()).thenReturn(derived);

    assertFalse(InstanceRules.isInstanceId(typedef));
  }

  @Test
  public void checkUndefined() {
    when(type.getPredefined()).thenReturn(FBasicTypeId.INT32);

    assertFalse(InstanceRules.isInstanceId(typedef));
  }

  @Test
  public void checkTypedefWithDifferentNameThanClass() {
    when(type.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(DefinedBy.createFromFModelElement(typedef)).thenReturn(definer);
    when(typedef.getName()).thenReturn("NotMyClass");
    when(definer.getBaseName()).thenReturn("MyClass");

    assertFalse(InstanceRules.isInstanceId(typedef));

    verifyStatic();
    DefinedBy.createFromFModelElement(typedef);
  }

  @Test
  public void checkTypedefWithSameNameAsClass() {
    when(type.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    when(DefinedBy.createFromFModelElement(typedef)).thenReturn(definer);
    when(typedef.getName()).thenReturn("MyClass");
    when(definer.getBaseName()).thenReturn("MyClass");

    assertTrue(InstanceRules.isInstanceId(typedef));

    verifyStatic();
    DefinedBy.createFromFModelElement(typedef);
  }
}
