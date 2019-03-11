/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
      Arrays.asList(Include.createInternalInclude("a"), Include.createInternalInclude("b"));

  private static final CppPrimitiveTypeRef INT_TYPE_REF = CppPrimitiveTypeRef.INT32;

  private static final CppComplexTypeRef COMPLEX_TYPE_REF =
      new CppTemplateTypeRef.Builder("Custom").includes(INCLUDES).build();

  private static final List<Include> ERROR_INCLUDES =
      Collections.singletonList(Include.createInternalInclude("E"));

  private static final CppComplexTypeRef ERROR_TYPE_REF =
      new CppTemplateTypeRef.Builder("CustomError").includes(ERROR_INCLUDES).build();

  @Test
  public void sharedPointerOfPrimitiveType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.SHARED_POINTER, INT_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.SHARED_POINTER, templateTypeRef.templateClass);
    assertEquals(1, templateTypeRef.templateParameters.size());
    assertEquals(INT_TYPE_REF, templateTypeRef.templateParameters.get(0));
    assertEquals(2, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void sharedPointerOfComplexType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER, COMPLEX_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.SHARED_POINTER, templateTypeRef.templateClass);
    assertEquals(1, templateTypeRef.templateParameters.size());
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters.get(0));
    assertEquals(3, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MEMORY));
  }

  @Test
  public void map() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.MAP, INT_TYPE_REF, COMPLEX_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.MAP, templateTypeRef.templateClass);
    assertEquals(2, templateTypeRef.templateParameters.size());
    assertEquals(INT_TYPE_REF, templateTypeRef.templateParameters.get(0));
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters.get(1));
    assertEquals(4, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MAP));
  }

  @Test
  public void vectorOfPrimitiveType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, INT_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, templateTypeRef.templateClass);
    assertEquals(1, templateTypeRef.templateParameters.size());
    assertEquals(INT_TYPE_REF, templateTypeRef.templateParameters.get(0));

    assertEquals(2, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.VECTOR));
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES));
  }

  @Test
  public void vectorOfComplexType() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, COMPLEX_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, templateTypeRef.templateClass);
    assertEquals(1, templateTypeRef.templateParameters.size());
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters.get(0));

    assertEquals(3, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.VECTOR));
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
  }

  @Test
  public void expected() {
    CppTemplateTypeRef templateTypeRef =
        CppTemplateTypeRef.create(
            "", CppTemplateTypeRef.TemplateClass.RETURN, COMPLEX_TYPE_REF, ERROR_TYPE_REF);

    assertEquals(CppTemplateTypeRef.TemplateClass.RETURN, templateTypeRef.templateClass);
    assertEquals(2, templateTypeRef.templateParameters.size());
    assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters.get(0));
    assertEquals(ERROR_TYPE_REF, templateTypeRef.templateParameters.get(1));

    assertEquals(4, templateTypeRef.includes.size());
    assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.RETURN));
    assertTrue(templateTypeRef.includes.containsAll(INCLUDES));
    assertTrue(templateTypeRef.includes.containsAll(ERROR_INCLUDES));
  }
}
