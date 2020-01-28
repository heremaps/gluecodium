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

package com.here.gluecodium.generator.ffi

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class FfiNameResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules
) : NameResolver {

    private val signatureResolver = FfiSignatureResolver(limeReferenceMap, this)

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeTypeRef -> getTypeRefName(element)
            is LimeFunction -> getMangledFullName(element)
            is LimeType -> getTypeName(element)
            is LimeNamedElement -> nameRules.getName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun getTypeRefName(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        return when {
            limeTypeRef.isNullable -> OPAQUE_HANDLE_TYPE
            limeType is LimeBasicType -> getBasicTypeRefName(limeType)
            limeType is LimeEnumeration -> "uint32_t"
            else -> OPAQUE_HANDLE_TYPE
        }
    }

    private fun getTypeName(limeType: LimeType): String =
        when (val actualType = limeType.actualType) {
            is LimeList -> getListName(actualType.elementType)
            is LimeSet -> getSetName(actualType.elementType)
            is LimeMap -> getMapName(actualType.keyType, actualType.valueType)
            else -> getMangledFullName(actualType)
        }

    private fun getBasicTypeRefName(limeType: LimeBasicType) =
        when (limeType.typeId) {
            LimeBasicType.TypeId.VOID -> "void"
            LimeBasicType.TypeId.INT8 -> "int8_t"
            LimeBasicType.TypeId.UINT8 -> "uint8_t"
            LimeBasicType.TypeId.INT16 -> "int16_t"
            LimeBasicType.TypeId.UINT16 -> "uint16_t"
            LimeBasicType.TypeId.INT32 -> "int32_t"
            LimeBasicType.TypeId.UINT32 -> "uint32_t"
            LimeBasicType.TypeId.INT64 -> "int64_t"
            LimeBasicType.TypeId.UINT64 -> "uint64_t"
            LimeBasicType.TypeId.BOOLEAN -> "bool"
            LimeBasicType.TypeId.FLOAT -> "float"
            LimeBasicType.TypeId.DOUBLE -> "double"
            LimeBasicType.TypeId.STRING -> OPAQUE_HANDLE_TYPE
            LimeBasicType.TypeId.BLOB -> OPAQUE_HANDLE_TYPE
            LimeBasicType.TypeId.DATE -> "uint64_t"
        }

    private fun getListName(elementType: LimeTypeRef) = "ListOf_${getTypeName(elementType.type)}"

    private fun getSetName(elementType: LimeTypeRef) = "SetOf_${getTypeName(elementType.type)}"

    private fun getMapName(keyType: LimeTypeRef, valueType: LimeTypeRef) =
        "MapOf_${getTypeName(keyType.type)}_to_${getTypeName(valueType.type)}"

    private fun getMangledFullName(limeElement: LimeNamedElement): String {
        val prefix = when {
            limeElement.path.hasParent -> {
                val parentElement =
                    limeReferenceMap[limeElement.path.parent.toString()] as? LimeNamedElement
                    ?: throw GluecodiumExecutionException(
                        "Failed to resolve parent for element ${limeElement.fullName}"
                    )
                getMangledFullName(parentElement)
            }
            limeElement.path.head.isEmpty() -> null
            else -> limeElement.path.head.joinToString("_")
        }

        val mangledName = mangleName(nameRules.getName(limeElement))
        val fullName = listOfNotNull(prefix, mangledName).joinToString("_")

        return when (limeElement) {
            is LimeFunction -> {
                val mangledSignature = signatureResolver.getSignature(limeElement)
                    .joinToString("_") { mangleName(it) }
                if (mangledSignature.isEmpty()) fullName else "${fullName}__$mangledSignature"
            }
            else -> fullName
        }
    }

    private fun mangleName(name: String) =
        name.replace(" ", "").replace("_", "_1").replace("<", "Of_").replace(",", "_").replace(">", "")

    private class FfiSignatureResolver(
        limeReferenceMap: Map<String, LimeElement>,
        private val nameResolver: FfiNameResolver
    ) : LimeSignatureResolver(limeReferenceMap) {

        override fun getFunctionName(limeFunction: LimeFunction) =
            nameResolver.nameRules.getName(limeFunction)

        override fun getArrayName(elementType: LimeTypeRef) = nameResolver.getListName(elementType)

        override fun getSetName(elementType: LimeTypeRef) = nameResolver.getSetName(elementType)

        override fun getMapName(keyType: LimeTypeRef, valueType: LimeTypeRef) =
            nameResolver.getMapName(keyType, valueType)
    }

    companion object {
        private const val OPAQUE_HANDLE_TYPE = "FfiOpaqueHandle"
    }
}
