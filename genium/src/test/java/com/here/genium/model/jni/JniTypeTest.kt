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

package com.here.genium.model.jni

import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.java.JavaArrayType
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaReferenceType
import com.here.genium.model.java.JavaType
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class JniTypeTest(private val javaType: JavaType, private val expectedJniTypeSignature: String?) {
    @Test
    fun createJniSignatureTest() {
        val result = JniType(javaType, CppComplexTypeRef("dummy"))

        assertEquals(expectedJniTypeSignature, result.jniTypeSignature)
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf(JavaPrimitiveType.VOID, "V"),
            arrayOf(JavaPrimitiveType.INT, "I"),
            arrayOf(JavaPrimitiveType.DOUBLE, "D"),
            arrayOf(JavaPrimitiveType.FLOAT, "F"),
            arrayOf(JavaPrimitiveType.LONG, "J"),
            arrayOf(JavaPrimitiveType.BOOL, "Z"),
            arrayOf(JavaPrimitiveType.BYTE, "B"),
            arrayOf(JavaPrimitiveType.SHORT, "S"),
            arrayOf(JavaPrimitiveType.CHAR, "C"),
            arrayOf(JavaArrayType.BOOL_ARRAY, "[Z"),
            arrayOf(JavaArrayType.BYTE_ARRAY, "[B"),
            arrayOf(JavaArrayType.CHAR_ARRAY, "[C"),
            arrayOf(JavaArrayType.DOUBLE_ARRAY, "[D"),
            arrayOf(JavaArrayType.FLOAT_ARRAY, "[F"),
            arrayOf(JavaArrayType.INT_ARRAY, "[I"),
            arrayOf(JavaArrayType.LONG_ARRAY, "[J"),
            arrayOf(JavaArrayType.SHORT_ARRAY, "[S"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.BOOL), "Ljava/lang/Boolean;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.BYTE), "Ljava/lang/Byte;"),
            arrayOf(
                JavaReferenceType(JavaReferenceType.Type.CHAR),
                "Ljava/lang/Character;"
            ),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.CLASS), "Ljava/lang/Class;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.DOUBLE), "Ljava/lang/Double;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.FLOAT), "Ljava/lang/Float;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.INT), "Ljava/lang/Integer;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.LONG), "Ljava/lang/Long;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.OBJECT), "Ljava/lang/Object;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.SHORT), "Ljava/lang/Short;"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.STRING), "Ljava/lang/String;"),
            arrayOf(
                JavaReferenceType(JavaReferenceType.Type.THROWABLE),
                "Ljava/lang/Throwable;"
            ),
            arrayOf(
                JavaCustomType(
                    "myNonNestedType",
                    emptySet(),
                    listOf("nonNestedClass"),
                    listOf("nested", "package")),
                "Lnested/package/nonNestedClass;"
            ),
            arrayOf(
                JavaCustomType(
                    "myNestedType",
                    emptySet(),
                    listOf("outerClass", "innerClass"),
                    listOf("nested", "package")),
                "Lnested/package/outerClass\$innerClass;"
            )
        )
    }
}
