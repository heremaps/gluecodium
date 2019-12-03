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

import com.here.gluecodium.model.java.JavaArrayTypeRef
import com.here.gluecodium.model.java.JavaCustomTypeRef
import com.here.gluecodium.model.java.JavaEnumTypeRef
import com.here.gluecodium.model.java.JavaExceptionTypeRef
import com.here.gluecodium.model.java.JavaImport
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.java.JavaPrimitiveTypeRef
import com.here.gluecodium.model.java.JavaReferenceTypeRef
import com.here.gluecodium.model.java.JavaTemplateTypeRef
import com.here.gluecodium.model.java.JavaTemplateTypeRef.TemplateClass
import com.here.gluecodium.model.java.JavaTypeRef
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
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection

class JavaTypeMapper(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val basePackage: JavaPackage,
    internalPackage: JavaPackage,
    val serializationBase: JavaTypeRef?,
    private val nonNullAnnotation: JavaTypeRef?,
    private val nullableAnnotation: JavaTypeRef?,
    private val nameResolver: JavaNameResolver
) {
    val nativeBase: JavaTypeRef = JavaCustomTypeRef(NATIVE_BASE_NAME, internalPackage)

    fun applyNullability(javaType: JavaTypeRef, isNullable: Boolean): JavaTypeRef {
        var resultType = javaType
        if (isNullable) {
            if (javaType is JavaPrimitiveTypeRef) {
                resultType = JavaReferenceTypeRef.boxPrimitiveType(javaType)
            }
            if (nullableAnnotation != null) {
                resultType.annotations.add(nullableAnnotation)
            }
        } else if (nonNullAnnotation != null && javaType !is JavaPrimitiveTypeRef) {
            resultType.annotations.add(nonNullAnnotation)
        }

        return resultType
    }

    fun mapType(limeTypeRef: LimeTypeRef): JavaTypeRef =
        when (val limeType = limeTypeRef.type) {
            is LimeBasicType -> mapBasicType(limeType)
            is LimeTypeAlias -> mapType(limeType.typeRef)
            is LimeList -> mapTemplateType(TemplateClass.LIST, limeType.elementType)
            is LimeMap -> mapMapType(limeType)
            is LimeContainerWithInheritance -> {
                val javaPackage = basePackage.createChildPackage(limeType.path.head)
                val classNames = nameResolver.getClassNames(limeType)
                val fullName = classNames.joinToString(".")
                JavaCustomTypeRef(
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

    fun mapParentType(limeElement: LimeNamedElement): JavaTypeRef? {
        val parentKey = limeElement.path.parent.toString()
        return when {
            limeReferenceMap.containsKey(parentKey) ->
                mapType(LimeLazyTypeRef(parentKey, limeReferenceMap))
            else -> null
        }
    }

    private fun mapMapType(limeMap: LimeMap): JavaTypeRef {
        var keyType = mapType(limeMap.keyType)
        var valueType = mapType(limeMap.valueType)

        if (keyType is JavaPrimitiveTypeRef) {
            keyType = JavaReferenceTypeRef.boxPrimitiveType(keyType)
        }
        if (valueType is JavaPrimitiveTypeRef) {
            valueType = JavaReferenceTypeRef.boxPrimitiveType(valueType)
        }

        return JavaTemplateTypeRef.create(TemplateClass.MAP, keyType, valueType)
    }

    private fun mapTemplateType(
        templateClass: TemplateClass,
        limeTypeRef: LimeTypeRef
    ): JavaTemplateTypeRef {
        val objectElementType =
            when (val elementType = mapType(limeTypeRef)) {
                is JavaPrimitiveTypeRef -> JavaReferenceTypeRef.boxPrimitiveType(elementType)
                else -> elementType
            }
        return JavaTemplateTypeRef.create(templateClass, objectElementType)
    }

    fun mapInheritanceParent(
        limeContainer: LimeContainerWithInheritance,
        implClassName: String
    ): JavaTypeRef {
        val javaPackage = basePackage.createChildPackage(limeContainer.path.head)
        return JavaCustomTypeRef(
            fullName = implClassName,
            packageNames = javaPackage.packageNames,
            imports = setOf(JavaImport(implClassName, javaPackage))
        )
    }

    fun mapCustomType(limeType: LimeType): JavaTypeRef {
        val classNames = nameResolver.getClassNames(limeType)
        val javaPackage = basePackage.createChildPackage(limeType.path.head)

        val javaImport = JavaImport(classNames.first(), javaPackage)
        val typeName = classNames.joinToString(".")
        return when (limeType) {
            is LimeEnumeration ->
                JavaEnumTypeRef(typeName, classNames, javaPackage.packageNames, javaImport)
            else ->
                JavaCustomTypeRef(typeName, setOf(javaImport), classNames, javaPackage.packageNames)
        }
    }

    fun mapExceptionType(limeThrownType: LimeThrownType): JavaExceptionTypeRef {
        val limeException =
            limeThrownType.typeRef.type.actualType as LimeException
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

        return JavaExceptionTypeRef(
            classNames.joinToString("."),
            JavaImport(importClassName, basePackage.createChildPackage(limeException.path.head)),
            classNames,
            mapType(limeException.errorType)
        )
    }

    private fun mapBasicType(limeBasicType: LimeBasicType) =
        when (limeBasicType.typeId) {
            TypeId.BOOLEAN -> JavaPrimitiveTypeRef.BOOL
            TypeId.FLOAT -> JavaPrimitiveTypeRef.FLOAT
            TypeId.DOUBLE -> JavaPrimitiveTypeRef.DOUBLE
            TypeId.INT8 -> JavaPrimitiveTypeRef.BYTE
            TypeId.INT16, TypeId.UINT8 -> JavaPrimitiveTypeRef.SHORT
            TypeId.INT32, TypeId.UINT16 -> JavaPrimitiveTypeRef.INT
            TypeId.INT64, TypeId.UINT32, TypeId.UINT64 -> JavaPrimitiveTypeRef.LONG
            TypeId.STRING -> JavaReferenceTypeRef(JavaReferenceTypeRef.Type.STRING)
            TypeId.BLOB -> JavaArrayTypeRef(JavaPrimitiveTypeRef.Type.BYTE)
            TypeId.DATE -> JavaReferenceTypeRef(JavaReferenceTypeRef.Type.DATE)
            TypeId.VOID -> JavaPrimitiveTypeRef.VOID
        }

    companion object {
        private const val NATIVE_BASE_NAME = "NativeBase"
    }
}
