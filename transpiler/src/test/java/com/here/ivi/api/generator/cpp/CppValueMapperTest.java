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

package com.here.ivi.api.generator.cpp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.cppmodel.CppValue;
import com.here.ivi.api.model.rules.BuiltInValueRules;
import java.util.Optional;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FQualifiedElementRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CppNameRules.class, BuiltInValueRules.class})
public final class CppValueMapperTest {

  @Mock private CppIncludeResolver includeResolver;

  private final Include internalInclude = Include.createInternalInclude("nonsense");

  private CppValueMapper valueMapper;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(CppNameRules.class, BuiltInValueRules.class);
    when(BuiltInValueRules.resolveReference(any())).thenReturn(Optional.empty());

    valueMapper = new CppValueMapper(includeResolver);

    when(includeResolver.resolveInclude(any())).thenReturn(internalInclude);
  }

  @Test
  public void mapConstantValue() {
    final String inputConstantName = "SomeFancyName";
    final String outputConstantName = "desiredOutputName";

    FConstantDef fConstant = mock(FConstantDef.class);
    when(fConstant.getName()).thenReturn(inputConstantName);

    FQualifiedElementRef qualifiedElementRef = mock(FQualifiedElementRef.class);
    when(qualifiedElementRef.getElement()).thenReturn(fConstant);

    //mock nameRules
    when(CppNameRules.getConstantName(anyString())).thenReturn(outputConstantName);

    //actual test
    CppValue mappedValue = valueMapper.map(mock(CppTypeRef.class), qualifiedElementRef);

    assertEquals(mappedValue.name, outputConstantName);
    assertTrue(mappedValue.includes.contains(internalInclude));

    PowerMockito.verifyStatic(); // 1
    CppNameRules.getConstantName(inputConstantName);
  }

  @Test
  public void mapEnumerator() {
    //constant
    final CppTypeRef cppType = new CppComplexTypeRef.Builder("MyFancyType").build();
    final String inputEnumeratorName = "EnumeratorIn";
    final String outputEnumeratorName = "EnumeratorOut";
    final String outputTypeName = cppType.name + "::" + outputEnumeratorName;

    FEnumerator fEnumerator = mock(FEnumerator.class);
    when(fEnumerator.getName()).thenReturn(inputEnumeratorName);

    FQualifiedElementRef qualifiedElementRef = mock(FQualifiedElementRef.class);
    when(qualifiedElementRef.getElement()).thenReturn(fEnumerator);

    //mock nameRules
    when(CppNameRules.getEnumEntryName(anyString())).thenReturn(outputEnumeratorName);

    //actual test
    CppValue mappedValue = valueMapper.map(cppType, qualifiedElementRef);

    assertEquals(mappedValue.name, outputTypeName);
    assertTrue(mappedValue.includes.contains(internalInclude));

    PowerMockito.verifyStatic(); // 1
    CppNameRules.getEnumEntryName(inputEnumeratorName);
  }
}
