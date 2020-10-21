/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.SERIALIZABLE
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
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
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue

internal class JavaImportResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameResolver: JavaNameResolver,
    internalPackages: List<String>,
    private val nonNullAnnotation: JavaImport?,
    private val nullableAnnotation: JavaImport?
) {
    val nativeBaseImport = JavaImport(internalPackages, "NativeBase")

    fun resolveImports(limeElement: LimeNamedElement): List<JavaImport> =
        when (limeElement) {
            is LimeClass -> resolveClassImports(limeElement)
            is LimeInterface -> resolveInterfaceImports(limeElement)
            is LimeStruct -> resolveStructImports(limeElement)
            is LimeTypesCollection -> resolveContainerImports(limeElement)
            is LimeFunction -> resolveFunctionImports(limeElement)
            is LimeLambda -> resolveLambdaImports(limeElement)
            is LimeConstant -> resolveConstantImports(limeElement)
            is LimeField -> resolveTypeRefImports(limeElement.typeRef) + resolveValueImports(limeElement.defaultValue)
            is LimeParameter -> resolveTypeRefImports(limeElement.typeRef)
            is LimeProperty -> resolvePropertyImports(limeElement)
            is LimeException -> resolveTypeRefImports(limeElement.errorType, ignoreNullability = true)
            is LimeValue -> resolveValueImports(limeElement)
            else -> emptyList()
        }

    private fun resolveInterfaceImports(limeInterface: LimeInterface): List<JavaImport> {
        val containerImports = resolveContainerImports(limeInterface)
        val parentImports = resolveTypeRefImports(limeInterface.parent, ignoreNullability = true)
        val implImports = if (limeInterface.path.hasParent) resolveInheritedImports(limeInterface) else emptyList()

        return containerImports + parentImports + implImports
    }

    private fun resolveClassImports(limeClass: LimeClass): List<JavaImport> {
        val containerImports = resolveContainerImports(limeClass)
        val parentImports = resolveTypeRefImports(limeClass.parent, ignoreNullability = true) +
            when (limeClass.parent?.type?.actualType) {
                is LimeClass -> emptyList()
                else -> resolveInheritedImports(limeClass)
            }

        return containerImports + parentImports
    }

    private fun resolveLambdaImports(limeLambda: LimeLambda): List<JavaImport> {
        val isNestedDeclaration =
            limeLambda.path.hasParent && limeReferenceMap[limeLambda.path.parent.toString()] !is LimeTypesCollection
        return resolveFunctionImports(limeLambda.asFunction()) +
            listOfNotNull(nativeBaseImport.takeIf { isNestedDeclaration })
    }

    private fun resolveInheritedImports(limeContainer: LimeContainerWithInheritance) =
        (limeContainer.inheritedFunctions + limeContainer.inheritedProperties).flatMap { resolveImports(it) } +
            nativeBaseImport

    private fun resolvePropertyImports(limeProperty: LimeProperty) =
        if (limeProperty.attributes.have(JAVA, SKIP)) emptyList() else resolveTypeRefImports(limeProperty.typeRef)

    private fun resolveConstantImports(limeConstant: LimeConstant) =
        resolveTypeRefImports(limeConstant.typeRef, ignoreNullability = true) + resolveValueImports(limeConstant.value)

    private fun resolveStructImports(limeStruct: LimeStruct) =
        resolveContainerImports(limeStruct) + limeStruct.fields.flatMap { resolveImports(it) } +
            when {
                limeStruct.attributes.have(SERIALIZABLE) -> listOf(parcelImport, parcelableImport) +
                    limeStruct.fields.mapNotNull { resolveSerializationImport(it.typeRef.type.actualType) }
                else -> emptyList()
            }

    private fun resolveSerializationImport(limeType: LimeType) =
        when (limeType) {
            is LimeList -> arrayListImport
            is LimeSet -> if (limeType.elementType.type.actualType is LimeEnumeration) enumSetImport else hashSetImport
            is LimeMap -> hashMapImport
            else -> null
        }

    private fun resolveValueImports(limeValue: LimeValue?): List<JavaImport> =
        when (limeValue) {
            is LimeValue.KeyValuePair ->
                resolveValueImports(limeValue.key) + resolveValueImports(limeValue.value) + abstractMapImport
            is LimeValue.InitializerList -> limeValue.values.flatMap { resolveValueImports(it) } +
                when (val limeType = limeValue.typeRef.type.actualType) {
                    is LimeList -> listOfNotNull(arrayListImport, arraysImport.takeIf { limeValue.values.isNotEmpty() })
                    is LimeSet -> listOfNotNull(arraysImport.takeIf { limeValue.values.isNotEmpty() }) +
                        when (limeType.elementType.type.actualType) {
                            is LimeEnumeration -> enumSetImport
                            else -> hashSetImport
                        }
                    is LimeMap -> listOfNotNull(
                        hashMapImport,
                        streamImport.takeIf { limeValue.values.isNotEmpty() },
                        collectorsImport.takeIf { limeValue.values.isNotEmpty() }
                    )
                    else -> emptyList()
                }
            else -> emptyList()
        }

    private fun resolveTypeRefImports(limeTypeRef: LimeTypeRef?, ignoreNullability: Boolean = false): List<JavaImport> {
        val limeType = limeTypeRef?.type?.actualType ?: return emptyList()

        val imports = when {
            limeType.external?.java != null -> emptyList()
            limeType is LimeBasicType -> listOfNotNull(resolveBasicTypeImport(limeType.typeId))
            limeType is LimeList -> resolveTypeRefImports(limeType.elementType, ignoreNullability = true) + listImport
            limeType is LimeSet -> resolveTypeRefImports(limeType.elementType, ignoreNullability = true) + setImport
            limeType is LimeMap -> resolveTypeRefImports(limeType.keyType, ignoreNullability = true) +
                    resolveTypeRefImports(limeType.valueType, ignoreNullability = true) + mapImport
            else -> listOf(createTopElementImport(limeType))
        }
        val nullabilityImport = when {
            ignoreNullability -> null
            limeTypeRef.isNullable -> nullableAnnotation
            needsNonNullAnnotation(limeType) -> nonNullAnnotation
            else -> null
        }
        return imports + listOfNotNull(nullabilityImport)
    }

    fun createTopElementImport(limeType: LimeType): JavaImport {
        val topElement = generateSequence(limeType) {
            val parentType = limeReferenceMap[it.path.parent.toString()] as? LimeType
            if (parentType is LimeTypesCollection) null else parentType
        }.last()
        return JavaImport(nameResolver.resolvePackageNames(topElement), nameResolver.resolveName(topElement))
    }

    private fun resolveContainerImports(limeContainer: LimeContainer) =
        (limeContainer.functions + limeContainer.properties + limeContainer.structs + limeContainer.classes +
                limeContainer.interfaces + limeContainer.exceptions + limeContainer.lambdas + limeContainer.constants)
            .flatMap { resolveImports(it) }

    private fun resolveFunctionImports(limeFunction: LimeFunction): List<JavaImport> {
        if (limeFunction.attributes.have(JAVA, SKIP)) return emptyList()

        val parameterImports = limeFunction.parameters.map { it.typeRef }.flatMap { resolveTypeRefImports(it) }
        val returnTypeImports = resolveTypeRefImports(limeFunction.returnType.typeRef)
        val exceptionImports =
            limeFunction.exception?.let { resolveTypeRefImports(LimeDirectTypeRef(it), ignoreNullability = true) }
        return parameterImports + returnTypeImports + (exceptionImports ?: emptyList())
    }

    private fun resolveBasicTypeImport(typeId: TypeId) =
        when (typeId) {
            TypeId.DATE -> JavaImport(javaUtilPackage, "Date")
            TypeId.LOCALE -> JavaImport(javaUtilPackage, "Locale")
            else -> null
        }

    companion object {
        private val javaUtilPackage = listOf("java", "util")
        private val javaUtilStreamPackage = javaUtilPackage + "stream"
        private val androidOsPackage = listOf("android", "os")

        private val listImport = JavaImport(javaUtilPackage, "List")
        private val setImport = JavaImport(javaUtilPackage, "Set")
        private val mapImport = JavaImport(javaUtilPackage, "Map")
        private val abstractMapImport = JavaImport(javaUtilPackage, "AbstractMap")
        private val arrayListImport = JavaImport(javaUtilPackage, "ArrayList")
        private val hashSetImport = JavaImport(javaUtilPackage, "HashSet")
        private val enumSetImport = JavaImport(javaUtilPackage, "EnumSet")
        private val hashMapImport = JavaImport(javaUtilPackage, "HashMap")
        private val arraysImport = JavaImport(javaUtilPackage, "Arrays")

        private val streamImport = JavaImport(javaUtilStreamPackage, "Stream")
        private val collectorsImport = JavaImport(javaUtilStreamPackage, "Collectors")

        private val parcelableImport = JavaImport(androidOsPackage, "Parcelable")
        private val parcelImport = JavaImport(androidOsPackage, "Parcel")

        fun needsNonNullAnnotation(limeType: LimeType) =
            when {
                limeType !is LimeBasicType -> true
                limeType.typeId.isNumericType -> false
                limeType.typeId == TypeId.VOID || limeType.typeId == TypeId.BOOLEAN -> false
                else -> true
            }
    }
}
