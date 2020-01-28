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

internal class FfiDartTypeNameResolver : NameResolver {

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
            limeType is LimeEnumeration -> "int"
            else -> OPAQUE_HANDLE_TYPE
        }
    }

    private fun getBasicTypeRefName(limeType: LimeBasicType) =
        when (limeType.typeId) {
            LimeBasicType.TypeId.VOID -> "void"
            LimeBasicType.TypeId.INT8 -> "int"
            LimeBasicType.TypeId.UINT8 -> "int"
            LimeBasicType.TypeId.INT16 -> "int"
            LimeBasicType.TypeId.UINT16 -> "int"
            LimeBasicType.TypeId.INT32 -> "int"
            LimeBasicType.TypeId.UINT32 -> "int"
            LimeBasicType.TypeId.INT64 -> "int"
            LimeBasicType.TypeId.UINT64 -> "int"
            LimeBasicType.TypeId.BOOLEAN -> "int"
            LimeBasicType.TypeId.FLOAT -> "double"
            LimeBasicType.TypeId.DOUBLE -> "double"
            LimeBasicType.TypeId.STRING -> OPAQUE_HANDLE_TYPE
            LimeBasicType.TypeId.BLOB -> OPAQUE_HANDLE_TYPE
            LimeBasicType.TypeId.DATE -> "int"
        }

    companion object {
        private const val OPAQUE_HANDLE_TYPE = "Pointer<Void>"
    }
}
