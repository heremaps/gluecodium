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

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.jni.JniNameRules
import com.here.gluecodium.generator.jni.JniTypeNameMapper
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.cpp.CppPrimitiveTypeRef
import com.here.gluecodium.model.cpp.CppTemplateTypeRef
import com.here.gluecodium.model.cpp.CppTypeDefRef
import com.here.gluecodium.model.cpp.CppTypeRef
import com.here.gluecodium.model.java.JavaArrayType
import com.here.gluecodium.model.java.JavaComplexType
import com.here.gluecodium.model.java.JavaPrimitiveType
import com.here.gluecodium.model.java.JavaTemplateType
import com.here.gluecodium.model.java.JavaType

class JniType(
    javaType: JavaType,
    cppType: CppTypeRef,
    val conversionIncludes: List<Include> = emptyList()
) : JniElement {

    val name = JniTypeNameMapper.map(javaType)
    val cppName = cppType.name
    val javaName = javaType.name
    val jniTypeSignature = createJniSignature(javaType)
    val cppFullyQualifiedName = getCppFullyQualifiedName(cppType)

    @Suppress("unused")
    val isJavaArray = javaType is JavaArrayType
    @Suppress("unused")
    val isComplex = javaType !is JavaPrimitiveType
    @Suppress("unused")
    val refersToValueType = cppType.refersToValueType
    @Suppress( "unused")
    val isJavaVoid = javaType === JavaPrimitiveType.VOID

    val elementType = inferElementType(javaType, cppType)

    @Suppress("unused")
    val mangledSignature: String
        get() = JniNameRules.getMangledName(jniTypeSignature)

    companion object {
        val VOID = JniType(JavaPrimitiveType.VOID, CppPrimitiveTypeRef.VOID)

        private fun createJniSignature(type: JavaType) =
            when (type) {
                is JavaPrimitiveType -> createJniSignature(type)
                is JavaArrayType -> createJniSignature(type)
                is JavaComplexType -> createJniSignature(type)
                else -> throw GluecodiumExecutionException("invalid java type: $type")
            }

        private fun createJniSignature(primitiveType: JavaPrimitiveType) =
            when (primitiveType.type) {
                JavaPrimitiveType.Type.INT -> "I"
                JavaPrimitiveType.Type.BOOL -> "Z"
                JavaPrimitiveType.Type.BYTE -> "B"
                JavaPrimitiveType.Type.CHAR -> "C"
                JavaPrimitiveType.Type.LONG -> "J"
                JavaPrimitiveType.Type.VOID -> "V"
                JavaPrimitiveType.Type.FLOAT -> "F"
                JavaPrimitiveType.Type.SHORT -> "S"
                JavaPrimitiveType.Type.DOUBLE -> "D"
            }

        private fun createJniSignature(arrayType: JavaArrayType) =
            when (arrayType.type) {
                JavaPrimitiveType.Type.INT -> "[I"
                JavaPrimitiveType.Type.BOOL -> "[Z"
                JavaPrimitiveType.Type.BYTE -> "[B"
                JavaPrimitiveType.Type.CHAR -> "[C"
                JavaPrimitiveType.Type.LONG -> "[J"
                JavaPrimitiveType.Type.FLOAT -> "[F"
                JavaPrimitiveType.Type.SHORT -> "[S"
                JavaPrimitiveType.Type.DOUBLE -> "[D"
                else -> throw GluecodiumExecutionException("invalid java primitive type: " +
                        arrayType.type)
            }

        private fun createJniSignature(complexType: JavaComplexType): String {
            val packageNames = complexType.packageNames.joinToString("/")
            val classNames = complexType.classNames.joinToString("$")
            return "L$packageNames/$classNames;"
        }

        private fun getCppFullyQualifiedName(cppTypeRef: CppTypeRef) =
            (cppTypeRef as? CppComplexTypeRef)?.fullyQualifiedName

        private fun inferElementType(javaType: JavaType, cppType: CppTypeRef): JniType? {
            if (javaType !is JavaTemplateType) {
                return null
            }
            var actualCppType = cppType
            while (actualCppType is CppTypeDefRef) {
                actualCppType = actualCppType.actualType
            }
            return JniType(
                javaType.templateParameters[0],
                (actualCppType as CppTemplateTypeRef).templateParameters[0]
            )
        }
    }
}
