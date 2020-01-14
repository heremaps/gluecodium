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
import com.here.gluecodium.model.java.JavaArrayTypeRef
import com.here.gluecodium.model.java.JavaComplexTypeRef
import com.here.gluecodium.model.java.JavaPrimitiveTypeRef
import com.here.gluecodium.model.java.JavaTemplateTypeRef
import com.here.gluecodium.model.java.JavaTypeRef

class JniType(
    javaType: JavaTypeRef,
    cppType: CppTypeRef,
    val conversionIncludes: List<Include> = emptyList()
) : JniElement {

    val name = JniTypeNameMapper.map(javaType)
    val cppName = cppType.name
    val javaName = javaType.name
    val jniTypeSignature = createJniSignature(javaType)
    val cppFullyQualifiedName = getCppFullyQualifiedName(cppType)

    @Suppress("unused")
    val isJavaArray = javaType is JavaArrayTypeRef
    @Suppress("unused")
    val isComplex = javaType !is JavaPrimitiveTypeRef
    @Suppress("unused")
    val refersToValueType = cppType.refersToValueType
    @Suppress("unused")
    val isJavaVoid = javaType === JavaPrimitiveTypeRef.VOID

    val elementType = inferElementType(javaType, cppType)

    @Suppress("unused")
    val mangledSignature: String
        get() = JniNameRules.getMangledName(jniTypeSignature)

    companion object {
        val VOID = JniType(JavaPrimitiveTypeRef.VOID, CppPrimitiveTypeRef.VOID)

        private fun createJniSignature(type: JavaTypeRef) =
            when (type) {
                is JavaPrimitiveTypeRef -> createJniSignature(type)
                is JavaArrayTypeRef -> createJniSignature(type)
                is JavaComplexTypeRef -> createJniSignature(type)
                else -> throw GluecodiumExecutionException("invalid java type: $type")
            }

        private fun createJniSignature(primitiveType: JavaPrimitiveTypeRef) =
            when (primitiveType.type) {
                JavaPrimitiveTypeRef.Type.INT -> "I"
                JavaPrimitiveTypeRef.Type.BOOL -> "Z"
                JavaPrimitiveTypeRef.Type.BYTE -> "B"
                JavaPrimitiveTypeRef.Type.CHAR -> "C"
                JavaPrimitiveTypeRef.Type.LONG -> "J"
                JavaPrimitiveTypeRef.Type.VOID -> "V"
                JavaPrimitiveTypeRef.Type.FLOAT -> "F"
                JavaPrimitiveTypeRef.Type.SHORT -> "S"
                JavaPrimitiveTypeRef.Type.DOUBLE -> "D"
            }

        private fun createJniSignature(arrayType: JavaArrayTypeRef) =
            when (arrayType.type) {
                JavaPrimitiveTypeRef.Type.INT -> "[I"
                JavaPrimitiveTypeRef.Type.BOOL -> "[Z"
                JavaPrimitiveTypeRef.Type.BYTE -> "[B"
                JavaPrimitiveTypeRef.Type.CHAR -> "[C"
                JavaPrimitiveTypeRef.Type.LONG -> "[J"
                JavaPrimitiveTypeRef.Type.FLOAT -> "[F"
                JavaPrimitiveTypeRef.Type.SHORT -> "[S"
                JavaPrimitiveTypeRef.Type.DOUBLE -> "[D"
                else -> throw GluecodiumExecutionException("invalid java primitive type: " +
                        arrayType.type)
            }

        private fun createJniSignature(complexType: JavaComplexTypeRef): String {
            val packageNames = complexType.packageNames.joinToString("/")
            val classNames = complexType.classNames.joinToString("$")
            return "L$packageNames/$classNames;"
        }

        private fun getCppFullyQualifiedName(cppTypeRef: CppTypeRef) =
            (cppTypeRef as? CppComplexTypeRef)?.fullyQualifiedName

        private fun inferElementType(javaType: JavaTypeRef, cppType: CppTypeRef): JniType? {
            if (javaType !is JavaTemplateTypeRef) {
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
