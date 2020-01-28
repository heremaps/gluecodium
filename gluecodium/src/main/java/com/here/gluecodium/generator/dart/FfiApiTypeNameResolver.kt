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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeTypeRef

internal class FfiApiTypeNameResolver : NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeTypeRef -> getTypeRefName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun getTypeRefName(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        return when {
            limeType is LimeBasicType -> getBasicTypeRefName(limeType)
            limeType is LimeEnumeration -> "Uint32"
            else -> OPAQUE_HANDLE_TYPE
        }
    }

    private fun getBasicTypeRefName(limeType: LimeBasicType) =
        when (limeType.typeId) {
            LimeBasicType.TypeId.VOID -> "Void"
            LimeBasicType.TypeId.INT8 -> "Int8"
            LimeBasicType.TypeId.UINT8 -> "Uint8"
            LimeBasicType.TypeId.INT16 -> "Int16"
            LimeBasicType.TypeId.UINT16 -> "Uint16"
            LimeBasicType.TypeId.INT32 -> "Int32"
            LimeBasicType.TypeId.UINT32 -> "Uint32"
            LimeBasicType.TypeId.INT64 -> "Int64"
            LimeBasicType.TypeId.UINT64 -> "Uint64"
            LimeBasicType.TypeId.BOOLEAN -> "Uint8"
            LimeBasicType.TypeId.FLOAT -> "Float"
            LimeBasicType.TypeId.DOUBLE -> "Double"
            LimeBasicType.TypeId.STRING -> OPAQUE_HANDLE_TYPE
            LimeBasicType.TypeId.BLOB -> OPAQUE_HANDLE_TYPE
            LimeBasicType.TypeId.DATE -> "Uint64"
        }

    companion object {
        private const val OPAQUE_HANDLE_TYPE = "Pointer<Void>"
    }
}
