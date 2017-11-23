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

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
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
@PrepareForTest({NameHelper.class, DefinedBy.class, SwiftNameRules.class})
public class SwiftTypeMapperTest {

  private static final String FRANCA_NAME = "do_nuts";
  private static final String SWIFT_NAME = "nonsense";

  @Mock private FrancaDeploymentModel deploymentModel;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FStructType francaStructType;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(NameHelper.class, DefinedBy.class);
    PowerMockito.spy(SwiftNameRules.class);

    when(DefinedBy.findDefiningTypeCollection(any(FModelElement.class)))
        .thenReturn(francaTypeCollection);
  }

  @Test
  public void mapTypeWithStructTypeRefAppliesSwiftNameRules() {
    when(francaTypeRef.getDerived()).thenReturn(francaStructType);
    when(francaStructType.getName()).thenReturn(FRANCA_NAME);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(SWIFT_NAME);

    SwiftType resultType = SwiftTypeMapper.mapType(francaTypeRef, deploymentModel);

    assertTrue(resultType instanceof SwiftContainerType);
    SwiftContainerType swiftContainerType = (SwiftContainerType) resultType;
    assertEquals(SWIFT_NAME, swiftContainerType.name);

    PowerMockito.verifyStatic();
    SwiftNameRules.getClassName(FRANCA_NAME);
    PowerMockito.verifyStatic();
    SwiftNameRules.getStructName(francaStructType, deploymentModel);
  }
}
