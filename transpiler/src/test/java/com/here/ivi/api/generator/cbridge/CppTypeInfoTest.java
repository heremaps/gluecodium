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

package com.here.ivi.api.generator.cbridge;

import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.common.Include;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class CppTypeInfoTest {

  private static final String PACKAGE = "TEST.PACKAGE";

  @Mock private IncludeResolver resolver;
  @Mock private FTypeCollection typeCollection;
  @Mock private FModel francaModel;
  @Mock private FStructType francaStruct;
  @Mock private Include cbridgePublicHeaderInclude;
  @Mock private Include cbridgePrivateHeaderInclude;
  @Mock private Include baseApiPublicHeaderInclude;

  @Before
  public void setUp() {
    when(francaStruct.eContainer()).thenReturn(typeCollection);
    when(typeCollection.eContainer()).thenReturn(francaModel);
    when(francaModel.getName()).thenReturn(PACKAGE);
    when(resolver.resolveInclude(any(), eq(HeaderType.CBRIDGE_PUBLIC_HEADER)))
        .thenReturn(cbridgePublicHeaderInclude);
    when(resolver.resolveInclude(any(), eq(HeaderType.CBRIDGE_PRIVATE_HEADER)))
        .thenReturn(cbridgePrivateHeaderInclude);
    when(resolver.resolveInclude(any(), eq(HeaderType.BASE_API_HEADER)))
        .thenReturn(baseApiPublicHeaderInclude);
  }

  @Test
  public void createStructTypeInfoSetsProperIncludes() {
    CppTypeInfo typeInfo = CppTypeInfo.createCustomTypeInfo(resolver, francaStruct);

    assertTrue(
        "function return type should have proper include",
        typeInfo.functionReturnType.includes.contains(cbridgePublicHeaderInclude));

    assertTrue(
        "conversion to cpp should include priv header with get_pointer function",
        typeInfo.conversionToCppIncludes.contains(cbridgePrivateHeaderInclude));
    assertTrue(
        "conversion to cpp should include base api header",
        typeInfo.conversionToCppIncludes.contains(baseApiPublicHeaderInclude));

    assertTrue(
        "conversion from cpp should include cbridge public header",
        typeInfo.conversionFromCppIncludes.contains(cbridgePublicHeaderInclude));
    assertTrue(
        "conversion from cpp should include base api header",
        typeInfo.conversionFromCppIncludes.contains(baseApiPublicHeaderInclude));
  }
}
