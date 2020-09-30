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

package com.here.gluecodium.model.jni

import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.java.JavaArrayTypeRef
import com.here.gluecodium.model.java.JavaCustomTypeRef
import com.here.gluecodium.model.java.JavaPrimitiveTypeRef
import com.here.gluecodium.model.java.JavaReferenceTypeRef
import com.here.gluecodium.model.java.JavaTypeRef
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class JniTypeTest(private val javaType: JavaTypeRef, private val expectedJniTypeSignature: String?) {
    @Test
    fun createJniSignatureTest() {
        val result = JniType(javaType, CppComplexTypeRef("dummy"))

        assertEquals(expectedJniTypeSignature, result.jniTypeSignature)
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf(JavaPrimitiveTypeRef.VOID, "V"),
            arrayOf(JavaPrimitiveTypeRef.INT, "I"),
            arrayOf(JavaPrimitiveTypeRef.DOUBLE, "D"),
            arrayOf(JavaPrimitiveTypeRef.FLOAT, "F"),
            arrayOf(JavaPrimitiveTypeRef.LONG, "J"),
            arrayOf(JavaPrimitiveTypeRef.BOOL, "Z"),
            arrayOf(JavaPrimitiveTypeRef.BYTE, "B"),
            arrayOf(JavaPrimitiveTypeRef.SHORT, "S"),
            arrayOf(JavaPrimitiveTypeRef.CHAR, "C"),
            arrayOf(JavaArrayTypeRef.BOOL_ARRAY, "[Z"),
            arrayOf(JavaArrayTypeRef.BYTE_ARRAY, "[B"),
            arrayOf(JavaArrayTypeRef.CHAR_ARRAY, "[C"),
            arrayOf(JavaArrayTypeRef.DOUBLE_ARRAY, "[D"),
            arrayOf(JavaArrayTypeRef.FLOAT_ARRAY, "[F"),
            arrayOf(JavaArrayTypeRef.INT_ARRAY, "[I"),
            arrayOf(JavaArrayTypeRef.LONG_ARRAY, "[J"),
            arrayOf(JavaArrayTypeRef.SHORT_ARRAY, "[S"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.BOOL), "Ljava/lang/Boolean;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.BYTE), "Ljava/lang/Byte;"),
            arrayOf(
                JavaReferenceTypeRef(JavaReferenceTypeRef.Type.CHAR),
                "Ljava/lang/Character;"
            ),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.CLASS), "Ljava/lang/Class;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.DOUBLE), "Ljava/lang/Double;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.FLOAT), "Ljava/lang/Float;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.INT), "Ljava/lang/Integer;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.LONG), "Ljava/lang/Long;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.OBJECT), "Ljava/lang/Object;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.SHORT), "Ljava/lang/Short;"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.STRING), "Ljava/lang/String;"),
            arrayOf(
                JavaReferenceTypeRef(JavaReferenceTypeRef.Type.THROWABLE),
                "Ljava/lang/Throwable;"
            ),
            arrayOf(
                JavaCustomTypeRef(
                    "myNonNestedType",
                    emptySet(),
                    listOf("nonNestedClass"),
                    listOf("nested", "package")),
                "Lnested/package/nonNestedClass;"
            ),
            arrayOf(
                JavaCustomTypeRef(
                    "myNestedType",
                    emptySet(),
                    listOf("outerClass", "innerClass"),
                    listOf("nested", "package")),
                "Lnested/package/outerClass\$innerClass;"
            )
        )
    }
}
