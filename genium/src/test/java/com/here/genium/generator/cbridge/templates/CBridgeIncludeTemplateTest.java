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

package com.here.genium.generator.cbridge.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.common.Include;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CBridgeIncludeTemplateTest {

  private String generate(Include incl) {
    return TemplateEngine.render("common/Include", incl);
  }

  @Test
  public void systemInclude() {
    Include include = Include.createSystemInclude("header.h");
    String expected = "#include <header.h>\n";

    String generated = generate(include);

    assertEquals(expected, generated);
  }

  @Test
  public void projectInclude() {
    Include include = Include.createInternalInclude("header.h");
    String expected = "#include \"header.h\"\n";

    String generated = generate(include);

    assertEquals(expected, generated);
  }
}
