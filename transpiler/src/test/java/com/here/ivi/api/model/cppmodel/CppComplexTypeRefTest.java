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

package com.here.ivi.api.model.cppmodel;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.common.LazyTypeRefName;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CppComplexTypeRefTest {

  private static final String TYPE_NAME_RESOLVED = "myTypeName";
  private static final String TYPE_NAME_LAZY = "myTypeNameLazy";
  private static final List<String> QUALIFIER_LAZY =
      Arrays.asList("my", "fancy", "nameSpace", "outerClassName");

  private static CppComplexTypeRef createTypeRefResolvedName() {
    return new CppComplexTypeRef.Builder(TYPE_NAME_RESOLVED).build();
  }

  private static CppComplexTypeRef createTypeRefLazyName() {
    return new CppComplexTypeRef.Builder(new LazyTypeRefName(TYPE_NAME_LAZY, QUALIFIER_LAZY))
        .build();
  }

  @Test
  public void isValueTypeFalseForComplex() {
    CppComplexTypeRef cppCustomType = createTypeRefResolvedName();

    boolean result = cppCustomType.refersToValueType();

    assertEquals(false, result);
  }

  @Test
  public void isValueTypeTrueForEnumeration() {
    CppComplexTypeRef cppCustomType =
        new CppComplexTypeRef.Builder(TYPE_NAME_LAZY).typeInfo(CppTypeInfo.Enumeration).build();

    boolean result = cppCustomType.refersToValueType();

    assertEquals(true, result);
  }

  @Test
  public void hasLazyNameWithResolvedName() {
    CppComplexTypeRef cppCustomType = createTypeRefResolvedName();

    boolean result = cppCustomType.hasLazyName();

    assertEquals(false, result);
  }

  @Test
  public void hasLazyNameWithLazyName() {
    CppComplexTypeRef cppCustomType = createTypeRefLazyName();

    boolean result = cppCustomType.hasLazyName();

    assertEquals(true, result);
  }

  @Test
  public void addTypeRefQualifiers() {
    CppComplexTypeRef cppCustomType = createTypeRefLazyName();
    List<String> typeRefQualifer = QUALIFIER_LAZY.subList(2, QUALIFIER_LAZY.size());

    cppCustomType.addTypeRefScopeNames(typeRefQualifer);

    assertEquals(cppCustomType.lazyName.typeRefScope, typeRefQualifer);
  }

  @Test
  public void resolveLazyName() {
    CppComplexTypeRef cppCustomType = createTypeRefLazyName();
    List<String> typeRefQualifer = QUALIFIER_LAZY.subList(0, 2);
    cppCustomType.addTypeRefScopeNames(typeRefQualifer);
    String expected =
        String.join("::", QUALIFIER_LAZY.subList(2, QUALIFIER_LAZY.size()))
            + "::"
            + cppCustomType.lazyName.unqualifiedTypeName;

    //act
    cppCustomType.resolveLazyName();

    assertEquals(false, cppCustomType.hasLazyName());
    assertEquals(expected, cppCustomType.name);
  }

  @Test
  public void getTextualRepresentationForResolvedName() {
    CppComplexTypeRef cppCustomType = createTypeRefResolvedName();

    //act
    String text = cppCustomType.getTextualRepresentation();

    assertEquals(cppCustomType.name, text);
  }

  @Test
  public void getTextualRepresentationForLazyName() {
    CppComplexTypeRef cppCustomType = createTypeRefLazyName();
    String expected =
        String.join("::", cppCustomType.lazyName.typeDefNestedNameSpecifier)
            + "::"
            + cppCustomType.lazyName.unqualifiedTypeName;

    //act
    String text = cppCustomType.getTextualRepresentation();

    assertEquals(expected, text);
  }
}
