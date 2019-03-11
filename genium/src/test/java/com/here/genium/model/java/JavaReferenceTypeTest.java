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

package com.here.genium.model.java;

import static org.junit.Assert.assertEquals;

import com.here.genium.model.java.JavaReferenceType.Type;
import java.util.Collection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameter;

@RunWith(Parameterized.class)
public class JavaReferenceTypeTest {

  @Parameter public Type type;

  @Parameter(1)
  public String literalName;

  @Parameterized.Parameters
  public static Collection<?> getValues() {
    return java.util.Arrays.asList(
        new Object[][] {{Type.STRING, "string"}, {Type.THROWABLE, "Throwable"}});
  }

  @Test
  public void getLiteralName() {
    assertEquals(literalName, new JavaReferenceType(type).getLiteralName());
  }
}
