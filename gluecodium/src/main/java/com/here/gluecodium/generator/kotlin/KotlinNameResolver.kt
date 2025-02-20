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

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType.FUNCTION_NAME
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue

internal class KotlinNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val kotlinNameRules: KotlinNameRules,
    private val limeLogger: LimeLogger,
    private val commentsProcessor: CommentsProcessor,
    private val signatureResolver: KotlinSignatureResolver,
    private val basePackages: List<String>,
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {
    private val kotlinValueResolver = KotlinValueResolver(this)

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeComment -> resolveComment(element)
            is LimeValue -> resolveValue(element)
            is LimeType -> resolveTypeName(element)
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeReturnType -> resolveTypeRef(element.typeRef)
            is LimeFunction -> resolveFunctionName(element)
            is LimeNamedElement -> kotlinNameRules.getName(element)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveReferenceName(element: Any) =
        when (element) {
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeType -> resolveTypeRef(LimeDirectTypeRef(element))
            else -> null
        }

    fun resolveFullReferenceName(element: LimeNamedElement): String {
        val elementName = resolveName(element)
        if (!element.path.hasParent) {
            return (resolvePackageNames(element) + elementName).joinToString(".")
        }

        val parentElement = getParentElement(element)
        val prefix = resolveFullReferenceName(parentElement)

        return "$prefix.$elementName"
    }

    private fun resolveComment(limeComment: LimeComment): String {
        // TODO: implement me!
        return ""
    }

    private fun resolveValue(limeValue: LimeValue): String {
        return kotlinValueResolver.resolveValue(limeValue)
    }

    private fun resolveTypeName(limeType: LimeType) =
        when (val actualType = limeType.actualType) {
            is LimeBasicType -> resolveBasicType(actualType.typeId)
            else -> kotlinNameRules.getName(actualType)
        }

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "Unit"
            TypeId.INT8 -> "Byte"
            TypeId.UINT8, TypeId.INT16 -> "Short"
            TypeId.UINT16, TypeId.INT32 -> "Int"
            TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "Long"
            TypeId.BOOLEAN -> "Boolean"
            TypeId.FLOAT -> "Float"
            TypeId.DOUBLE -> "Double"
            TypeId.STRING -> "String"
            TypeId.BLOB -> "ByteArray"
            TypeId.DATE -> "Date"
            TypeId.DURATION -> "Duration"
            TypeId.LOCALE -> "Locale"
        }

    private fun resolveTypeRef(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        val externalName = limeType.external?.kotlin?.get(NAME_NAME)

        val typeString =
            when {
                externalName != null -> externalName
                limeType is LimeGenericType -> resolveGenericTypeRef(limeType)
                limeType !is LimeBasicType -> resolveNestedNames(limeType).joinToString(".")
                else -> resolveBasicType(limeType.typeId)
            }

        val suffix = if (limeTypeRef.isNullable) "?" else ""
        return typeString + suffix
    }

    private fun resolveGenericTypeRef(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "MutableList<${resolveTypeRef(limeType.elementType)}>"
            is LimeSet -> "MutableSet<${resolveTypeRef(limeType.elementType)}>"
            is LimeMap -> "MutableMap<${resolveTypeRef(limeType.keyType)}, ${resolveTypeRef(limeType.valueType)}>"
            else -> throw GluecodiumExecutionException("Unsupported element type ${limeType.javaClass.name}")
        }

    private fun resolveNestedNames(limeElement: LimeNamedElement): List<String> {
        val elementName = kotlinNameRules.getName(limeElement)
        val parentElement = if (limeElement.path.hasParent) getParentElement(limeElement) else null
        return when {
            parentElement != null -> resolveNestedNames(parentElement) + elementName
            else -> listOf(elementName)
        }
    }

    private fun resolveFunctionName(limeFunction: LimeFunction): String {
        return when (val parentElement = getParentElement(limeFunction)) {
            is LimeLambda -> parentElement.attributes.get(LimeAttributeType.KOTLIN, FUNCTION_NAME) ?: "apply"
            else -> kotlinNameRules.getName(limeFunction)
        }
    }

    fun resolvePackageNames(limeElement: LimeNamedElement) = (basePackages + limeElement.path.head).map { normalizePackageName(it) }

    companion object {
        fun normalizePackageName(name: String) = name.replace("_", "")
    }
}
