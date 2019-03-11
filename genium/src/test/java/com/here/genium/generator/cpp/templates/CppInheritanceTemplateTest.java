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

package com.here.genium.generator.cpp.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.cpp.CppClass;
import com.here.genium.model.cpp.CppComplexTypeRef;
import com.here.genium.model.cpp.CppInheritance;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppInheritanceTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppInheritance";

  private final CppClass cppClass = new CppClass("Classy");
  private final CppInheritance cppInheritance =
      new CppInheritance(
          new CppComplexTypeRef.Builder("Typical").build(), CppInheritance.Type.Public);

  @Test
  public void noInheritances() {
    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    assertEquals("", result);
  }

  @Test
  public void oneInheritance() {
    cppClass.inheritances.add(cppInheritance);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    assertEquals(": public Typical", result);
  }

  @Test
  public void twoInheritances() {
    CppInheritance anotherCppInheritance =
        new CppInheritance(
            new CppComplexTypeRef.Builder("Nonsense").build(), CppInheritance.Type.Private);
    cppClass.inheritances.add(cppInheritance);
    cppClass.inheritances.add(anotherCppInheritance);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppClass);

    assertEquals(": public Typical, private Nonsense", result);
  }
}
