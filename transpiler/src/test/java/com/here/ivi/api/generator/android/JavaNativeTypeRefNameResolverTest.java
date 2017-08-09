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

package com.here.ivi.api.generator.android;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppElementWithIncludes;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class JavaNativeTypeRefNameResolverTest {

  @Mock private CppComplexTypeRef complexTypeRefResolvedName;
  @Mock private CppComplexTypeRef complexTypeRefLazyName;

  private static final List<String> qualifierElements = Arrays.asList("scope", "of", "typeRef");

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    when(complexTypeRefResolvedName.hasLazyName()).thenReturn(false);
    when(complexTypeRefLazyName.hasLazyName()).thenReturn(true);
  }

  private List<? extends CppElementWithIncludes> createCppElementList() {
    List<CppElementWithIncludes> result = new LinkedList<>();
    result.add(complexTypeRefResolvedName);
    result.add(complexTypeRefLazyName);
    return result;
  }

  @Test
  public void addTypeRefQualifierElements() {
    List<? extends CppElementWithIncludes> elements = createCppElementList();
    JavaNativeTypeRefNameResolver resolver = new JavaNativeTypeRefNameResolver();

    resolver.addTypeRefScopeNames(qualifierElements, elements);

    verify(complexTypeRefLazyName, never()).addTypeRefScopeNames(any());
    verify(complexTypeRefResolvedName, never()).addTypeRefScopeNames(any());
    verify(complexTypeRefLazyName, never()).resolveLazyName();
    verify(complexTypeRefResolvedName, never()).resolveLazyName();
  }

  @Test
  public void resolveQualifierElements() {
    List<? extends CppElementWithIncludes> elements = createCppElementList();
    JavaNativeTypeRefNameResolver resolver = new JavaNativeTypeRefNameResolver();
    List<CppComplexTypeRef> typeReferences =
        resolver.addTypeRefScopeNames(qualifierElements, elements);

    //act
    resolver.resolveLazyNames(typeReferences);

    verify(complexTypeRefLazyName, never()).addTypeRefScopeNames(any());
    verify(complexTypeRefLazyName).resolveLazyName();

    verify(complexTypeRefResolvedName, never()).addTypeRefScopeNames(any());
    verify(complexTypeRefResolvedName, never()).resolveLazyName();
  }
}
