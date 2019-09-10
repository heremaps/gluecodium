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

package com.here.genium.generator.jni

import com.here.genium.model.java.JavaArrayType
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaPrimitiveType.Type
import com.here.genium.model.java.JavaReferenceType
import com.here.genium.model.java.JavaType

object JniTypeNameMapper {
    /**
     * Maps from Java types to JNI type names.
     *
     * See https://docs.oracle.com/javase/7/docs/technotes/guides/jni/spec/types.html#wp428
     *
     * @param javaType Java type to convert
     * @return Equivalent JNI type name
     */
    fun map(javaType: JavaType) =
        when (javaType) {
            is JavaCustomType -> "jobject"
            is JavaReferenceType -> mapReferenceType(javaType)
            is JavaArrayType -> mapArrayType(javaType)
            is JavaPrimitiveType -> mapPrimitiveType(javaType.type)
            else -> throw IllegalArgumentException(
                "Mapping from Java type to jni type name is not possible: ${javaType.name}"
            )
        }

    private fun mapPrimitiveType(primitiveType: Type) =
        when (primitiveType) {
            Type.VOID -> "void"
            else -> "j${primitiveType.value}"
        }

    private fun mapReferenceType(refType: JavaReferenceType) =
        when (refType.type) {
            JavaReferenceType.Type.CLASS -> "jclass"
            JavaReferenceType.Type.STRING -> "jstring"
            JavaReferenceType.Type.THROWABLE -> "jthrowable"
            else -> "jobject"
        }

    private fun mapArrayType(refType: JavaArrayType) =
        when (refType.type) {
            Type.VOID -> throw IllegalArgumentException(
                "Mapping from 'void' array to a JNI type name is not possible: ${refType.name}"
            )
            else -> mapPrimitiveType(refType.type) + "Array"
        }
}
