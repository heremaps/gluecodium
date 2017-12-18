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

import static com.here.ivi.api.test.Assert.assertContains;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.model.cbridge.CType;
import com.here.ivi.api.model.cbridge.IncludeResolver;
import com.here.ivi.api.model.cbridge.IncludeResolver.HeaderType;
import com.here.ivi.api.model.common.Include;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CBridgeNameRules.class)
public final class CppTypeInfoTest {

  private static final String PACKAGE = "TEST.PACKAGE";
  private static final String ENUM_NAME = "MyEnum";

  @Mock private IncludeResolver resolver;
  @Mock private FTypeCollection typeCollection;
  @Mock private FModel francaModel;
  @Mock private FStructType francaStruct;
  @Mock private FEnumerationType francaEnum;

  private final Include cbridgePublicHeaderInclude = Include.createInternalInclude("foo");
  private final Include cbridgePrivateHeaderInclude = Include.createInternalInclude("bar");
  private final Include baseApiPublicHeaderInclude = Include.createInternalInclude("baz");

  @Before
  public void setUp() {
    mockStatic(CBridgeNameRules.class);
    when(francaStruct.eContainer()).thenReturn(typeCollection);
    when(typeCollection.eContainer()).thenReturn(francaModel);
    when(francaModel.getName()).thenReturn(PACKAGE);
    when(resolver.resolveInclude(any(), eq(HeaderType.CBRIDGE_PUBLIC_HEADER)))
        .thenReturn(cbridgePublicHeaderInclude);
    when(resolver.resolveInclude(any(), eq(HeaderType.CBRIDGE_PRIVATE_HEADER)))
        .thenReturn(cbridgePrivateHeaderInclude);
    when(resolver.resolveInclude(any(), eq(HeaderType.BASE_API_HEADER)))
        .thenReturn(baseApiPublicHeaderInclude);
    when(CBridgeNameRules.getEnumName(any())).thenReturn(ENUM_NAME);
  }

  @Test
  public void createStructTypeInfoSetsProperIncludes() {
    CppTypeInfo typeInfo =
        CppTypeInfo.createCustomTypeInfo(resolver, francaStruct, CppTypeInfo.TypeCategory.STRUCT);

    assertTrue(
        "function return type should have proper include",
        typeInfo.functionReturnType.includes.contains(cbridgePublicHeaderInclude));

    assertTrue(typeInfo.includes.contains(cbridgePrivateHeaderInclude));
    assertTrue(typeInfo.includes.contains(baseApiPublicHeaderInclude));
    assertTrue(typeInfo.includes.contains(cbridgePublicHeaderInclude));
  }

  @Test
  public void createErrorTypeInfoSetsProperIncludes() {
    CppTypeInfo typeInfo = CppTypeInfo.createErrorTypeInfo(resolver, francaEnum);

    assertContains(typeInfo.functionReturnType.includes, CType.BOOL_INCLUDE);
  }

  @Test
  public void createErrorTypeSetsEnumName() {
    CppTypeInfo typeInfo = CppTypeInfo.createErrorTypeInfo(resolver, francaEnum);

    assertEquals(typeInfo.functionReturnType.name, ENUM_NAME);
  }
}
