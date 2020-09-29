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
class JniTypeNameMapperTest(
    private val javaType: JavaTypeRef,
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
            arrayOf(JavaPrimitiveTypeRef.VOID, "void"),
            arrayOf(JavaPrimitiveTypeRef.INT, "jint"),
            arrayOf(JavaPrimitiveTypeRef.DOUBLE, "jdouble"),
            arrayOf(JavaPrimitiveTypeRef.FLOAT, "jfloat"),
            arrayOf(JavaPrimitiveTypeRef.LONG, "jlong"),
            arrayOf(JavaPrimitiveTypeRef.BOOL, "jboolean"),
            arrayOf(JavaPrimitiveTypeRef.BYTE, "jbyte"),
            arrayOf(JavaPrimitiveTypeRef.SHORT, "jshort"),
            arrayOf(JavaPrimitiveTypeRef.CHAR, "jchar"),
            arrayOf(JavaArrayTypeRef.BOOL_ARRAY, "jbooleanArray"),
            arrayOf(JavaArrayTypeRef.BYTE_ARRAY, "jbyteArray"),
            arrayOf(JavaArrayTypeRef.CHAR_ARRAY, "jcharArray"),
            arrayOf(JavaArrayTypeRef.DOUBLE_ARRAY, "jdoubleArray"),
            arrayOf(JavaArrayTypeRef.FLOAT_ARRAY, "jfloatArray"),
            arrayOf(JavaArrayTypeRef.INT_ARRAY, "jintArray"),
            arrayOf(JavaArrayTypeRef.LONG_ARRAY, "jlongArray"),
            arrayOf(JavaArrayTypeRef.SHORT_ARRAY, "jshortArray"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.BOOL), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.BYTE), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.CHAR), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.CLASS), "jclass"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.DOUBLE), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.FLOAT), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.INT), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.LONG), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.OBJECT), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.SHORT), "jobject"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.STRING), "jstring"),
            arrayOf(JavaReferenceTypeRef(JavaReferenceTypeRef.Type.THROWABLE), "jthrowable"),
            arrayOf(JavaCustomTypeRef("MyFancyType"), "jobject")
        )
    }
}
