/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeAttributeType.OPTIMIZED
import com.here.gluecodium.model.lime.LimeAttributeType.SERIALIZABLE
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue

internal class KotlinImportResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameResolver: KotlinNameResolver,
    internalPackage: List<String>,
    private val internalApiAnnotation: String?,
) : ImportsResolver<String> {
    val nativeBaseImport = (internalPackage + listOf("NativeBase")).joinToString(".")
    private val durationImport = (internalPackage + listOf("time", "Duration")).joinToString(".")
    private val abstractNativeListImport = (internalPackage + listOf("AbstractNativeList")).joinToString(".")
    private val internalApiAnnotationImport = (internalPackage + listOf(internalApiAnnotation)).joinToString(".")

    override fun resolveElementImports(limeElement: LimeElement): List<String> =
        when (limeElement) {
            is LimeTypeAlias -> resolveTypeRefImports(limeElement.typeRef)
            is LimeContainerWithInheritance -> resolveClassInterfaceImports(limeElement)
            is LimeStruct -> resolveStructImports(limeElement) + resolveInternalTypeImport(limeElement)
            is LimeFunction -> resolveFunctionImports(limeElement)
            is LimeLambda -> resolveLambdaImports(limeElement) + resolveInternalTypeImport(limeElement)
            is LimeConstant -> resolveTypeRefImports(limeElement.typeRef)
            is LimeField -> resolveTypeRefImports(limeElement.typeRef)
            is LimeParameter -> resolveTypeRefImports(limeElement.typeRef)
            is LimeProperty -> resolveTypeRefImports(limeElement.typeRef)
            is LimeException -> resolveTypeRefImports(limeElement.errorType) + resolveInternalTypeImport(limeElement)
            is LimeValue -> resolveValueImports(limeElement)
            is LimeEnumeration -> resolveInternalTypeImport(limeElement)
            else -> emptyList()
        }

    private fun resolveClassInterfaceImports(limeContainer: LimeContainerWithInheritance): List<String> {
        val parentImports = limeContainer.parents.flatMap { resolveTypeRefImports(it) }.toMutableList()
        if ((limeContainer is LimeClass && limeContainer.parentClass == null) ||
            (limeContainer is LimeInterface && limeContainer.path.hasParent)
        ) {
            parentImports.add(nativeBaseImport)
        }

        return parentImports + resolveInternalTypeImport(limeContainer)
    }

    private fun resolveInternalTypeImport(limeType: LimeType): List<String> {
        return when {
            internalApiAnnotation != null && (CommonGeneratorPredicates.isInternal(limeType, KOTLIN) || limeType.external?.kotlin != null) -> listOf(internalApiAnnotationImport)
            else -> emptyList()
        }
    }

    private fun resolveLambdaImports(limeLambda: LimeLambda): List<String> =
        resolveFunctionImports(limeLambda.asFunction()) +
            listOfNotNull(nativeBaseImport.takeIf { limeLambda.path.hasParent })

    private fun resolveStructImports(limeStruct: LimeStruct): List<String> =
        when {
            limeStruct.attributes.have(SERIALIZABLE) ->
                listOf(PARCEL_IMPORT, PARCELABLE_IMPORT) +
                    limeStruct.fields.mapNotNull { resolveOptionalEnumSetImport(it.typeRef.type.actualType) }
            else -> emptyList()
        }

    private fun resolveOptionalEnumSetImport(limeType: LimeType): String? {
        return if (limeType is LimeSet && limeType.elementType.type.actualType is LimeEnumeration) {
            ENUM_SET_IMPORT
        } else {
            null
        }
    }

    private fun resolveValueImports(limeValue: LimeValue?): List<String> =
        when (limeValue) {
            is LimeValue.KeyValuePair ->
                resolveValueImports(limeValue.key) + resolveValueImports(limeValue.value)
            is LimeValue.InitializerList ->
                limeValue.values.flatMap { resolveValueImports(it) } +
                    listOfNotNull(resolveOptionalEnumSetImport(limeValue.typeRef.type.actualType))
            is LimeValue.StructInitializer -> limeValue.values.flatMap { resolveValueImports(it) }
            is LimeValue.Constant -> resolveTypeRefImports(limeValue.valueRef.typeRef)
            else -> emptyList()
        }

    private fun resolveTypeRefImports(limeTypeRef: LimeTypeRef?): List<String> {
        val limeType = limeTypeRef?.type?.actualType ?: return emptyList()

        return when {
            limeType.external?.kotlin != null -> emptyList()
            limeType is LimeBasicType -> listOfNotNull(resolveBasicTypeImport(limeType.typeId))
            limeType is LimeList -> (
                resolveTypeRefImports(limeType.elementType) +
                    (if (limeTypeRef.attributes.have(OPTIMIZED)) listOf(abstractNativeListImport) else emptyList())
            )
            limeType is LimeSet -> resolveTypeRefImports(limeType.elementType)
            limeType is LimeMap -> resolveTypeRefImports(limeType.keyType) + resolveTypeRefImports(limeType.valueType)
            else -> listOfNotNull(createTopElementImport(limeType))
        }
    }

    fun createTopElementImport(limeType: LimeType): String? {
        if (nameResolver.typesWithDuplicateNames.contains(limeType.fullName)) return null

        val topElement =
            generateSequence(limeType) {
                limeReferenceMap[it.path.parent.toString()] as? LimeType
            }.last()

        val packages = nameResolver.resolvePackageNames(topElement)
        val elementName = listOf(nameResolver.resolveName(topElement))
        val importParts = packages + elementName

        if (importParts.isEmpty()) {
            return null
        }

        return (packages + elementName).joinToString(separator = ".")
    }

    private fun resolveFunctionImports(limeFunction: LimeFunction): List<String> {
        val returnTypeImports = resolveTypeRefImports(limeFunction.returnType.typeRef)
        val exceptionImports =
            limeFunction.exception?.let { resolveTypeRefImports(LimeDirectTypeRef(it)) }
        return returnTypeImports + (exceptionImports ?: emptyList())
    }

    private fun resolveBasicTypeImport(typeId: TypeId): String? =
        when (typeId) {
            TypeId.DATE -> "${JAVA_UTIL_PACKAGE}.Date"
            TypeId.DURATION -> durationImport
            TypeId.LOCALE -> "${JAVA_UTIL_PACKAGE}.Locale"
            else -> null
        }

    companion object {
        private const val JAVA_UTIL_PACKAGE = "java.util"
        private const val ENUM_SET_IMPORT = "$JAVA_UTIL_PACKAGE.EnumSet"
        private const val ANDROID_OS_PACKAGE = "android.os"
        private const val PARCELABLE_IMPORT = "$ANDROID_OS_PACKAGE.Parcelable"
        private const val PARCEL_IMPORT = "$ANDROID_OS_PACKAGE.Parcel"
    }
}
