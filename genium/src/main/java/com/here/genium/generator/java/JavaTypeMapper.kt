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

package com.here.genium.generator.java

import com.here.genium.cli.GeniumExecutionException
import com.here.genium.model.java.JavaArrayType
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaEnumType
import com.here.genium.model.java.JavaExceptionType
import com.here.genium.model.java.JavaImport
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaReferenceType
import com.here.genium.model.java.JavaTemplateType
import com.here.genium.model.java.JavaType
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef

class JavaTypeMapper(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val basePackage: JavaPackage,
    private val internalPackage: JavaPackage,
    val serializationBase: JavaType?,
    private val notNullAnnotation: JavaType?,
    private val nullableAnnotation: JavaType?
) {
    val nativeBase: JavaType = JavaCustomType(NATIVE_BASE_NAME, internalPackage)

    fun applyNullability(javaType: JavaType, limeAttributes: LimeAttributes): JavaType {
        var resultType = javaType
        val isNullable = limeAttributes.have(LimeAttributeType.NULLABLE)
        if (nullableAnnotation != null && isNullable) {
            if (javaType is JavaPrimitiveType) {
                resultType = JavaReferenceType.boxPrimitiveType(javaType)
            }
            resultType.annotations.add(nullableAnnotation)
        }
        if (notNullAnnotation != null && !isNullable && needsNotNullAnnotation(javaType)) {
            resultType.annotations.add(notNullAnnotation)
        }

        return resultType
    }

    fun mapType(limeTypeRef: LimeTypeRef): JavaType {
        val limeType = limeTypeRef.type
        return when (limeType) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeTypeDef -> mapType(limeType.typeRef)
            is LimeArray -> JavaTemplateType.wrapInList(mapType(limeType.elementType))
            is LimeMap -> mapMapType(limeType)
            is LimeStruct, is LimeEnumeration -> mapCustomType(limeType)
            is LimeContainer -> {
                val packageNames =
                    basePackage.createChildPackage(limeType.path.head).packageNames
                val className = JavaNameRules.getClassName(limeType.name)
                JavaCustomType(
                    fullName = className,
                    packageNames = packageNames,
                    javaImports = listOf(JavaImport(className, JavaPackage(packageNames))),
                    isInterface = true
                )
            }
            else -> throw GeniumExecutionException("Unmapped type: " + limeType.name)
        }
    }

    private fun mapMapType(limeMap: LimeMap): JavaType {
        var keyType = mapType(limeMap.keyType)
        var valueType = mapType(limeMap.valueType)

        if (keyType is JavaPrimitiveType) {
            keyType = JavaReferenceType.boxPrimitiveType(keyType)
        }
        if (valueType is JavaPrimitiveType) {
            valueType = JavaReferenceType.boxPrimitiveType(valueType)
        }

        return JavaTemplateType.create(JavaTemplateType.TemplateClass.MAP, keyType, valueType)
    }

    fun mapCustomType(
        limeType: LimeType,
        className: String = JavaNameRules.getClassName(limeType.name)
    ): JavaType {

        if (limeType is LimeContainer) {
            val packageNames = basePackage.createChildPackage(limeType.path.head).packageNames

            return JavaCustomType(
                className,
                null,
                packageNames,
                listOf(JavaImport(className, JavaPackage(packageNames)))
            )
        }

        val parentContainer = limeReferenceMap[limeType.path.parent.toString()] as LimeContainer
        val packageNames = basePackage.createChildPackage(parentContainer.path.head).packageNames

        val importClassName: String
        val typeName: String
        val classNames = mutableListOf(className)
        if (parentContainer.type == LimeContainer.ContainerType.TYPE_COLLECTION) {
            importClassName = className
            typeName = className
        } else {
            importClassName = JavaNameRules.getClassName(parentContainer.name)
            typeName = "$importClassName.$className"
            classNames.add(0, importClassName)
        }

        val javaImport = JavaImport(importClassName, JavaPackage(packageNames))

        return when (limeType) {
            is LimeEnumeration -> JavaEnumType(typeName, classNames, packageNames, javaImport)
            else -> JavaCustomType(typeName, classNames, packageNames, listOf(javaImport))
        }
    }

    fun mapExceptionType(limeType: LimeType): JavaExceptionType {
        val exceptionName = JavaNameRules.getExceptionName(limeType.name)
        val parentContainer = limeReferenceMap[limeType.path.parent.toString()] as LimeContainer
        val javaPackage =
            JavaPackage(basePackage.createChildPackage(parentContainer.path.head).packageNames)

        val importClassName: String
        val classNames = mutableListOf(exceptionName)
        if (parentContainer.type == LimeContainer.ContainerType.TYPE_COLLECTION) {
            importClassName = exceptionName
        } else {
            importClassName = JavaNameRules.getClassName(parentContainer.name)
            classNames.add(0, importClassName)
        }

        return JavaExceptionType(
            classNames.joinToString("."),
            classNames,
            JavaImport(importClassName, javaPackage)
        )
    }

    private fun mapBasicType(limeBasicType: LimeBasicType) =
        when (limeBasicType.typeId) {
            TypeId.BOOLEAN -> JavaPrimitiveType.BOOL
            TypeId.FLOAT -> JavaPrimitiveType.FLOAT
            TypeId.DOUBLE -> JavaPrimitiveType.DOUBLE
            TypeId.INT8 -> JavaPrimitiveType.BYTE
            TypeId.INT16, TypeId.UINT8 -> JavaPrimitiveType.SHORT
            TypeId.INT32, TypeId.UINT16 -> JavaPrimitiveType.INT
            TypeId.INT64, TypeId.UINT32, TypeId.UINT64 -> JavaPrimitiveType.LONG
            TypeId.STRING -> JavaReferenceType(JavaReferenceType.Type.STRING)
            TypeId.BLOB -> JavaArrayType(JavaPrimitiveType.Type.BYTE)
            else -> JavaPrimitiveType.VOID
        }

    private fun needsNotNullAnnotation(javaType: JavaType) =
        javaType !is JavaPrimitiveType && javaType !is JavaArrayType &&
            !(javaType is JavaReferenceType && javaType.type == JavaReferenceType.Type.STRING)

    companion object {
        private const val NATIVE_BASE_NAME = "NativeBase"
    }
}
