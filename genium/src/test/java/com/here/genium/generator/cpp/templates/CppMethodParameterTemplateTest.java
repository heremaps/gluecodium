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
import com.here.genium.model.cpp.CppComplexTypeRef;
import com.here.genium.model.cpp.CppParameter;
import com.here.genium.model.cpp.CppPrimitiveTypeRef;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppMethodParameterTemplateTest {

  private static final String TEMPLATE_NAME = "cpp/CppMethodParameter";

  private static final String PARAMETER_NAME = "glory";
  private static final String TYPE_NAME = "Typical";

  @Test
  public void withPrimitiveType() {
    CppParameter cppParameter = new CppParameter(PARAMETER_NAME, CppPrimitiveTypeRef.INT8);

    String result = TemplateEngine.render(TEMPLATE_NAME, cppParameter);

    assertEquals("const int8_t glory", result);
  }

  @Test
  public void withValueType() {
    CppParameter cppParameter =
        new CppParameter(PARAMETER_NAME, new CppComplexTypeRef.Builder(TYPE_NAME).build());

    String result = TemplateEngine.render(TEMPLATE_NAME, cppParameter);

    assertEquals("const Typical& glory", result);
  }
}
