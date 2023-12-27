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

import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class FfiCppParameterTypeNameResolver(
    private val ffiCppNameResolver: FfiCppNameResolver,
) : NameResolver {
    override fun resolveName(element: Any): String = ffiCppNameResolver.resolveName(element) + resolveSuffix(element)

    private fun resolveSuffix(element: Any) =
        when (element) {
            is LimeTypeRef ->
                if (element.isNullable) REFERENCE_SUFFIX else resolveTypeSuffix(element.type)
            is LimeType -> resolveTypeSuffix(element)
            else -> ""
        }

    private fun resolveTypeSuffix(limeType: LimeType) =
        when (val actualType = limeType.actualType) {
            is LimeEnumeration -> ""
            is LimeBasicType ->
                when (actualType.typeId) {
                    TypeId.STRING, TypeId.BLOB, TypeId.DATE -> REFERENCE_SUFFIX
                    else -> ""
                }
            else -> REFERENCE_SUFFIX
        }

    companion object {
        private const val REFERENCE_SUFFIX = "&"
    }
}
