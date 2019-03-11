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

package com.here.genium.model.jni;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import com.here.genium.model.cpp.CppComplexTypeRef;
import com.here.genium.model.java.JavaArrayType;
import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.java.JavaType;
import java.util.Arrays;
import java.util.Collection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

@RunWith(Parameterized.class)
public class JniTypeTest {

  private final JavaType javaType;
  private final String expectedJniTypeSignature;

  public JniTypeTest(final JavaType javaType, final String expectedJniTypeSignature) {
    this.javaType = javaType;
    this.expectedJniTypeSignature = expectedJniTypeSignature;
  }

  @Parameterized.Parameters
  public static Collection<Object[]> testData() {
    return Arrays.asList(
        new Object[][] {
          {JavaPrimitiveType.VOID, null},
          {JavaPrimitiveType.INT, "I"},
          {JavaPrimitiveType.DOUBLE, "D"},
          {JavaPrimitiveType.FLOAT, "F"},
          {JavaPrimitiveType.LONG, "J"},
          {JavaPrimitiveType.BOOL, "Z"},
          {JavaPrimitiveType.BYTE, "B"},
          {JavaPrimitiveType.SHORT, "S"},
          {JavaPrimitiveType.CHAR, "C"},
          {JavaArrayType.BOOL_ARRAY, "[Z"},
          {JavaArrayType.BYTE_ARRAY, "[B"},
          {JavaArrayType.CHAR_ARRAY, "[C"},
          {JavaArrayType.DOUBLE_ARRAY, "[D"},
          {JavaArrayType.FLOAT_ARRAY, "[F"},
          {JavaArrayType.INT_ARRAY, "[I"},
          {JavaArrayType.LONG_ARRAY, "[J"},
          {JavaArrayType.SHORT_ARRAY, "[S"},
          {new JavaReferenceType(JavaReferenceType.Type.BOOL), "Ljava/lang/Boolean;"},
          {new JavaReferenceType(JavaReferenceType.Type.BYTE), "Ljava/lang/Byte;"},
          {new JavaReferenceType(JavaReferenceType.Type.CHAR), "Ljava/lang/Character;"},
          {new JavaReferenceType(JavaReferenceType.Type.CLASS), "Ljava/lang/Class;"},
          {new JavaReferenceType(JavaReferenceType.Type.DOUBLE), "Ljava/lang/Double;"},
          {new JavaReferenceType(JavaReferenceType.Type.FLOAT), "Ljava/lang/Float;"},
          {new JavaReferenceType(JavaReferenceType.Type.INT), "Ljava/lang/Integer;"},
          {new JavaReferenceType(JavaReferenceType.Type.LONG), "Ljava/lang/Long;"},
          {new JavaReferenceType(JavaReferenceType.Type.OBJECT), "Ljava/lang/Object;"},
          {new JavaReferenceType(JavaReferenceType.Type.SHORT), "Ljava/lang/Short;"},
          {new JavaReferenceType(JavaReferenceType.Type.STRING), "Ljava/lang/String;"},
          {new JavaReferenceType(JavaReferenceType.Type.THROWABLE), "Ljava/lang/Throwable;"},
          {
            JavaCustomType.builder("myNonNestedType")
                .className("nonNestedClass")
                .packageNames(Arrays.asList("nested", "package"))
                .build(),
            "Lnested/package/nonNestedClass;"
          },
          {
            JavaCustomType.builder("myNestedType")
                .classNames(Arrays.asList("outerClass", "innerClass"))
                .packageNames(Arrays.asList("nested", "package"))
                .build(),
            "Lnested/package/outerClass$innerClass;"
          }
        });
  }

  @Test
  public void createJniSignatureTest() {

    JniType result = JniType.createType(javaType, new CppComplexTypeRef.Builder("dummy").build());

    if (expectedJniTypeSignature == null) {
      assertNull(result);
    } else {
      assertEquals(expectedJniTypeSignature, result.jniTypeSignature);
    }
  }
}
