/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.cpp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.here.genium.generator.cpp.CppLibraryIncludes;
import com.here.genium.model.common.Include;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppTemplateTypeRefTest {

  private static final List<Include> INCLUDES =
      Arrays.asList(
          Include.Companion.createInternalInclude("a"),
          Include.Companion.createInternalInclude("b"));

  private static final CppPrimitiveTypeRef INT_TYPE_REF = CppPrimitiveTypeRef.Companion.getINT32();

  private static final CppComplexTypeRef COMPLEX_TYPE_REF =
      new CppComplexTypeRef("Custom", INCLUDES);

  private static final List<Include> ERROR_INCLUDES =
      Collections.singletonList(Include.Companion.createInternalInclude("E"));

  private static final CppComplexTypeRef ERROR_TYPE_REF =
      new CppComplexTypeRef("CustomError", ERROR_INCLUDES);

  @Test
  public void sharedPointerOfPrimitiveType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.Companion.create(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER, INT_TYPE_REF);

    assertEquals(
        CppTemplateTypeRef.TemplateClass.SHARED_POINTER, templateTypeRef.getTemplateClass());
    assertEquals(1, templateTypeRef.getTemplateParameters().size());
    assertEquals(INT_TYPE_REF, templateTypeRef.getTemplateParameters().get(0));
    assertEquals(2, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void sharedPointerOfComplexType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.Companion.create(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER, COMPLEX_TYPE_REF);

    assertEquals(
        CppTemplateTypeRef.TemplateClass.SHARED_POINTER, templateTypeRef.getTemplateClass());
    assertEquals(1, templateTypeRef.getTemplateParameters().size());
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.getTemplateParameters().get(0));
    assertEquals(3, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
  }

  @Test
  public void map() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.Companion.create(
            CppTemplateTypeRef.TemplateClass.MAP, INT_TYPE_REF, COMPLEX_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.MAP, templateTypeRef.getTemplateClass());
    assertEquals(2, templateTypeRef.getTemplateParameters().size());
    assertEquals(INT_TYPE_REF, templateTypeRef.getTemplateParameters().get(0));
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.getTemplateParameters().get(1));
    assertEquals(4, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MAP));
  }

  @Test
  public void vectorOfPrimitiveType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.Companion.create(CppTemplateTypeRef.TemplateClass.VECTOR, INT_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, templateTypeRef.getTemplateClass());
    assertEquals(1, templateTypeRef.getTemplateParameters().size());
    assertEquals(INT_TYPE_REF, templateTypeRef.getTemplateParameters().get(0));

    assertEquals(2, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.VECTOR));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void vectorOfComplexType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.Companion.create(
            CppTemplateTypeRef.TemplateClass.VECTOR, COMPLEX_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, templateTypeRef.getTemplateClass());
    assertEquals(1, templateTypeRef.getTemplateParameters().size());
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.getTemplateParameters().get(0));

    assertEquals(3, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.VECTOR));
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
  }

  @Test
  public void expected() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.Companion.create(
            "", CppTemplateTypeRef.TemplateClass.RETURN, COMPLEX_TYPE_REF, ERROR_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.RETURN, templateTypeRef.getTemplateClass());
    assertEquals(2, templateTypeRef.getTemplateParameters().size());
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.getTemplateParameters().get(0));
    assertEquals(ERROR_TYPE_REF, templateTypeRef.getTemplateParameters().get(1));

    assertEquals(4, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.RETURN));
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
    assertTrue(templateTypeRef.includes.containsAll(ERROR_INCLUDES));
  }
}
