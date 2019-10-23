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

package com.here.gluecodium.generator.java

import com.here.gluecodium.model.java.JavaArrayType
import com.here.gluecodium.model.java.JavaCustomType
import com.here.gluecodium.model.java.JavaEnumType
import com.here.gluecodium.model.java.JavaExceptionType
import com.here.gluecodium.model.java.JavaImport
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.java.JavaPrimitiveType
import com.here.gluecodium.model.java.JavaReferenceType
import com.here.gluecodium.model.java.JavaTemplateType
import com.here.gluecodium.model.java.JavaTemplateType.TemplateClass
import com.here.gluecodium.model.java.JavaType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection

class JavaTypeMapper(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val basePackage: JavaPackage,
    internalPackage: JavaPackage,
    val serializationBase: JavaType?,
    private val nonNullAnnotation: JavaType?,
    private val nullableAnnotation: JavaType?,
    private val nameResolver: JavaNameResolver
) {
    val nativeBase: JavaType = JavaCustomType(NATIVE_BASE_NAME, internalPackage)

    fun applyNullability(javaType: JavaType, isNullable: Boolean): JavaType {
        var resultType = javaType
        if (isNullable) {
            if (javaType is JavaPrimitiveType) {
                resultType = JavaReferenceType.boxPrimitiveType(javaType)
            }
            if (nullableAnnotation != null) {
                resultType.annotations.add(nullableAnnotation)
            }
        } else if (nonNullAnnotation != null && javaType !is JavaPrimitiveType) {
            resultType.annotations.add(nonNullAnnotation)
        }

        return resultType
    }

    fun mapType(limeTypeRef: LimeTypeRef): JavaType =
        when (val limeType = limeTypeRef.type) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeTypeAlias -> mapType(limeType.typeRef)
            is LimeList -> mapTemplateType(TemplateClass.LIST, limeType.elementType)
            is LimeMap -> mapMapType(limeType)
            is LimeContainerWithInheritance -> {
                val javaPackage = basePackage.createChildPackage(limeType.path.head)
                val classNames = nameResolver.getClassNames(limeType)
                val fullName = classNames.joinToString(".")
                JavaCustomType(
                    fullName = fullName,
                    classNames = classNames,
                    packageNames = javaPackage.packageNames,
                    imports = setOf(JavaImport(fullName, javaPackage)),
                    isInterface = true
                )
            }
            is LimeSet -> {
                val elementType = limeType.elementType
                val templateClass = when {
                    elementType.type is LimeEnumeration -> TemplateClass.ENUM_SET
                    else -> TemplateClass.SET
                }
                mapTemplateType(templateClass, elementType)
            }
            else -> mapCustomType(limeType)
        }

    fun mapParentType(limeElement: LimeNamedElement): JavaType? {
        val parentKey = limeElement.path.parent.toString()
        return when {
            limeReferenceMap.containsKey(parentKey) ->
                mapType(LimeLazyTypeRef(parentKey, limeReferenceMap))
            else -> null
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

        return JavaTemplateType.create(TemplateClass.MAP, keyType, valueType)
    }

    private fun mapTemplateType(
        templateClass: TemplateClass,
        limeTypeRef: LimeTypeRef
    ): JavaTemplateType {
        val objectElementType =
            when (val elementType = mapType(limeTypeRef)) {
                is JavaPrimitiveType -> JavaReferenceType.boxPrimitiveType(elementType)
                else -> elementType
            }
        return JavaTemplateType.create(templateClass, objectElementType)
    }

    fun mapInheritanceParent(
        limeContainer: LimeContainerWithInheritance,
        implClassName: String
    ): JavaType {
        val javaPackage = basePackage.createChildPackage(limeContainer.path.head)
        return JavaCustomType(
            fullName = implClassName,
            packageNames = javaPackage.packageNames,
            imports = setOf(JavaImport(implClassName, javaPackage))
        )
    }

    fun mapCustomType(limeType: LimeType): JavaType {
        val classNames = nameResolver.getClassNames(limeType)
        val javaPackage = basePackage.createChildPackage(limeType.path.head)

        val javaImport = JavaImport(classNames.first(), javaPackage)
        val typeName = classNames.joinToString(".")
        return when (limeType) {
            is LimeEnumeration ->
                JavaEnumType(typeName, classNames, javaPackage.packageNames, javaImport)
            else ->
                JavaCustomType(typeName, setOf(javaImport), classNames, javaPackage.packageNames)
        }
    }

    fun mapExceptionType(limeThrownType: LimeThrownType): JavaExceptionType {
        val limeException =
            LimeTypeHelper.getActualType(limeThrownType.typeRef.type) as LimeException
        val exceptionName = nameResolver.getName(limeException)
        val parentContainer =
            limeReferenceMap[limeException.path.parent.toString()] as? LimeContainer

        val importClassName: String
        val classNames: List<String>
        if (parentContainer == null || parentContainer is LimeTypesCollection) {
            importClassName = exceptionName
            classNames = listOf(exceptionName)
        } else {
            importClassName = nameResolver.getName(parentContainer)
            classNames = listOf(importClassName, exceptionName)
        }

        return JavaExceptionType(
            classNames.joinToString("."),
            JavaImport(importClassName, basePackage.createChildPackage(limeException.path.head)),
            classNames,
            mapType(limeException.errorType)
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
            TypeId.DATE -> JavaReferenceType(JavaReferenceType.Type.DATE)
            TypeId.VOID -> JavaPrimitiveType.VOID
        }

    companion object {
        private const val NATIVE_BASE_NAME = "NativeBase"
    }
}
