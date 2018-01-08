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

package com.here.ivi.api.model.cpp;

import static org.junit.Assert.*;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.common.Include;
import java.util.Set;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CppStructTest {

  @Test
  public void isBaseStructTypeAmongIncludes() {
    Include baseInclude = Include.createInternalInclude("SomeFile");
    CppInheritance baseStruct =
        new CppInheritance(
            new CppComplexTypeRef.Builder("BaseStruct").include(baseInclude).build(),
            CppInheritance.Type.Public);

    CppStruct inheritedStruct = new CppStruct("InheritedStruct");
    inheritedStruct.inheritances.add(baseStruct);

    Include actualInclude =
        CollectionsHelper.getStreamOfType(
                inheritedStruct.stream().flatMap(CppElement::streamRecursive),
                CppElementWithIncludes.class)
            .map(elementWithIncludes -> elementWithIncludes.includes)
            .flatMap(Set::stream)
            .findFirst()
            .orElse(null);

    assertSame(baseInclude, actualInclude);
  }
}
