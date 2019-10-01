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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.model.java.JavaArrayType
import com.here.gluecodium.model.java.JavaCustomType
import com.here.gluecodium.model.java.JavaPrimitiveType
import com.here.gluecodium.model.java.JavaReferenceType
import com.here.gluecodium.model.java.JavaType
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class JniTypeNameMapperTest(
    private val javaType: JavaType,
    private val expectedJniTypeName: String
) {
    @Test
    fun mapTypeName() {
        // Act
        val result = JniTypeNameMapper.map(javaType)

        // Assert
        assertEquals(expectedJniTypeName, result)
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData(): Collection<Array<Any>> = listOf(
            arrayOf(JavaPrimitiveType.VOID, "void"),
            arrayOf(JavaPrimitiveType.INT, "jint"),
            arrayOf(JavaPrimitiveType.DOUBLE, "jdouble"),
            arrayOf(JavaPrimitiveType.FLOAT, "jfloat"),
            arrayOf(JavaPrimitiveType.LONG, "jlong"),
            arrayOf(JavaPrimitiveType.BOOL, "jboolean"),
            arrayOf(JavaPrimitiveType.BYTE, "jbyte"),
            arrayOf(JavaPrimitiveType.SHORT, "jshort"),
            arrayOf(JavaPrimitiveType.CHAR, "jchar"),
            arrayOf(JavaArrayType.BOOL_ARRAY, "jbooleanArray"),
            arrayOf(JavaArrayType.BYTE_ARRAY, "jbyteArray"),
            arrayOf(JavaArrayType.CHAR_ARRAY, "jcharArray"),
            arrayOf(JavaArrayType.DOUBLE_ARRAY, "jdoubleArray"),
            arrayOf(JavaArrayType.FLOAT_ARRAY, "jfloatArray"),
            arrayOf(JavaArrayType.INT_ARRAY, "jintArray"),
            arrayOf(JavaArrayType.LONG_ARRAY, "jlongArray"),
            arrayOf(JavaArrayType.SHORT_ARRAY, "jshortArray"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.BOOL), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.BYTE), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.CHAR), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.CLASS), "jclass"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.DOUBLE), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.FLOAT), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.INT), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.LONG), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.OBJECT), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.SHORT), "jobject"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.STRING), "jstring"),
            arrayOf(JavaReferenceType(JavaReferenceType.Type.THROWABLE), "jthrowable"),
            arrayOf(JavaCustomType("MyFancyType"), "jobject")
        )
    }
}
