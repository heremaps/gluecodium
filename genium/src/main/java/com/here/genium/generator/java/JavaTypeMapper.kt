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
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.model.common.InstanceRules
import com.here.genium.model.franca.DefinedBy
import com.here.genium.model.franca.FrancaDeploymentModel
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
import org.eclipse.emf.ecore.EObject
import org.franca.core.framework.FrancaHelpers
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FStructType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement

/**
 * Maps Franca type references to their Java counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
open class JavaTypeMapper(
    private val basePackage: JavaPackage,
    private val deploymentModel: FrancaDeploymentModel,
    val serializationBase: JavaType?,
    private val notNullAnnotation: JavaType?,
    private val nullableAnnotation: JavaType?
) {
    val nativeBase = JavaCustomType(NATIVE_BASE_NAME, basePackage)

    fun map(francaTypRef: FTypeRef): JavaType {
        var javaType = mapTypeReference(francaTypRef)

        if (FrancaTypeHelper.isImplicitArray(francaTypRef)) {
            javaType = JavaTemplateType.wrapInList(javaType)
        }
        if (nullableAnnotation != null && needsNullableAnnotation(francaTypRef)) {
            if (javaType is JavaPrimitiveType) {
                javaType = JavaReferenceType.boxPrimitiveType(javaType)
            }
            javaType.annotations.add(nullableAnnotation)
        }
        if (notNullAnnotation != null && needsNotNullAnnotation(francaTypRef)) {
            javaType.annotations.add(notNullAnnotation)
        }

        return javaType
    }

    private fun mapTypeReference(francaTypRef: FTypeRef): JavaType =
        when {
            francaTypRef.derived != null -> mapDerived(francaTypRef.derived)
            else -> mapPredefined(francaTypRef.predefined)
        }

    private fun mapDerived(francaType: FType): JavaType =
        when (francaType) {
            is FTypeDef -> mapTypeDef(francaType)
            is FArrayType -> mapArray(francaType)
            is FMapType -> mapMap(francaType)
            is FStructType -> mapCustomType(francaType)
            is FEnumerationType -> mapCustomType(francaType)
            else -> throw GeniumExecutionException("Unmapped derived type: " + francaType.name)
        }

    fun mapArray(arrayType: FArrayType) =
        JavaTemplateType.wrapInList(mapTypeReference(arrayType.elementType))

    fun mapMap(francaMapType: FMapType): JavaType {
        var keyType = mapTypeReference(francaMapType.keyType)
        var valueType = mapTypeReference(francaMapType.valueType)

        if (keyType is JavaPrimitiveType) {
            keyType = JavaReferenceType.boxPrimitiveType(keyType)
        }
        if (valueType is JavaPrimitiveType) {
            valueType = JavaReferenceType.boxPrimitiveType(valueType)
        }

        return JavaTemplateType.create(JavaTemplateType.TemplateClass.MAP, keyType, valueType)
    }

    @JvmOverloads
    fun mapCustomType(
        francaElement: FModelElement,
        className: String = JavaNameRules.getClassName(francaElement.name)
    ): JavaType {

        val typeCollection = DefinedBy.findDefiningTypeCollection(francaElement)
        val packageNames =
            basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames

        val typeName: String
        val importClassName: String

        val classNames = mutableListOf<String>()
        classNames.add(className)
        // type is nested inside defining class
        if (francaElement !is FInterface && typeCollection is FInterface) {
            importClassName = JavaNameRules.getClassName(typeCollection.getName())
            classNames.add(0, importClassName)
            typeName = "$importClassName.$className"
        } else { // non-nested type
            importClassName = className
            typeName = className
        }

        val javaImport = JavaImport(importClassName, JavaPackage(packageNames))

        return if (francaElement is FEnumerationType) {
            JavaEnumType(typeName, classNames, packageNames, javaImport)
        } else {
            JavaCustomType(
                typeName, classNames, packageNames, listOf(javaImport)
            )
        }
    }

    fun mapExceptionType(francaEnum: FEnumerationType): JavaExceptionType {
        val exceptionName = JavaNameRules.getExceptionName(francaEnum.name)
        val typeCollection = DefinedBy.findDefiningTypeCollection(francaEnum)
        val javaPackage = JavaPackage(
            basePackage
                .createChildPackage(DefinedBy.getPackages(typeCollection))
                .packageNames
        )

        val importClassName: String
        val classNames = mutableListOf<String>()
        classNames.add(exceptionName)
        // type is nested inside defining class
        if (typeCollection is FInterface) {
            importClassName = JavaNameRules.getClassName(typeCollection.getName())
            classNames.add(0, importClassName)
        } else { // non-nested type
            importClassName = exceptionName
        }

        return JavaExceptionType(
            classNames.joinToString("."),
            classNames,
            JavaImport(importClassName, javaPackage)
        )
    }

    private fun mapTypeDef(typeDef: FTypeDef) =
        if (InstanceRules.isInstanceId(typeDef)) {
            val typeCollection = DefinedBy.findDefiningTypeCollection(typeDef)
            val packageNames =
                basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames
            val className = JavaNameRules.getClassName(typeCollection.name)
            val classImport = JavaImport(className, JavaPackage(packageNames))

            JavaCustomType(className, null, packageNames, listOf(classImport), true)
        } else {
            mapTypeReference(typeDef.actualType)
        }

    private fun needsNotNullAnnotation(francaTypeRef: FTypeRef): Boolean {
        val parentElement = francaTypeRef.eContainer()
        if (!isNullableElement(parentElement)) {
            return false
        }

        val typedElement = parentElement as FTypedElement
        return !deploymentModel.isNullable(typedElement) && (typedElement.isArray ||
                InstanceRules.isInstanceId(francaTypeRef) ||
                FrancaHelpers.getActualDerived(francaTypeRef) != null)
    }

    private fun needsNullableAnnotation(francaTypeRef: FTypeRef): Boolean {
        val parentElement = francaTypeRef.eContainer()
        return isNullableElement(parentElement) &&
            deploymentModel.isNullable(parentElement as FTypedElement)
    }

    private fun isNullableElement(francaElement: EObject) =
        francaElement is FField ||
            francaElement is FArgument ||
            francaElement is FAttribute

    companion object {
        private const val NATIVE_BASE_NAME = "NativeBase"

        private fun mapPredefined(basicTypeId: FBasicTypeId) =
            when (basicTypeId) {
                FBasicTypeId.BOOLEAN -> JavaPrimitiveType.BOOL
                FBasicTypeId.FLOAT -> JavaPrimitiveType.FLOAT
                FBasicTypeId.DOUBLE -> JavaPrimitiveType.DOUBLE
                FBasicTypeId.INT8 -> JavaPrimitiveType.BYTE
                FBasicTypeId.INT16, FBasicTypeId.UINT8 -> JavaPrimitiveType.SHORT
                FBasicTypeId.INT32, FBasicTypeId.UINT16 -> JavaPrimitiveType.INT
                FBasicTypeId.INT64, FBasicTypeId.UINT32, FBasicTypeId.UINT64 ->
                    JavaPrimitiveType.LONG
                FBasicTypeId.STRING -> JavaReferenceType(JavaReferenceType.Type.STRING)
                FBasicTypeId.BYTE_BUFFER -> JavaArrayType(JavaPrimitiveType.Type.BYTE)
                else -> JavaPrimitiveType.VOID
            }
    }
}
