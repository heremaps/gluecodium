/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue

internal class SwiftImportsResolver : ImportsResolver<String> {
    override fun resolveElementImports(limeElement: LimeElement): List<String> =
        when (limeElement) {
            is LimeTypeRef -> resolveElementImports(limeElement.type)
            is LimeGenericType -> resolveGenericTypeImports(limeElement)
            is LimeValue -> resolveValueImports(limeElement)
            is LimeType -> listOfNotNull(getFrameworkName(limeElement))
            else -> emptyList()
        }

    private fun getFrameworkName(limeType: LimeType): String? {
        val frameworkName = limeType.external?.swift?.get(LimeExternalDescriptor.FRAMEWORK_NAME)
        return if (frameworkName.isNullOrBlank()) null else frameworkName
    }

    private fun resolveGenericTypeImports(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> resolveElementImports(limeType.elementType)
            is LimeSet -> resolveElementImports(limeType.elementType)
            is LimeMap -> resolveElementImports(limeType.keyType) + resolveElementImports(limeType.valueType)
            else -> emptyList()
        }

    private fun resolveValueImports(limeValue: LimeValue): List<String> =
        when (limeValue) {
            is LimeValue.KeyValuePair -> resolveValueImports(limeValue.key) + resolveValueImports(limeValue.value)
            is LimeValue.InitializerList -> limeValue.values.flatMap { resolveValueImports(it) }
            is LimeValue.StructInitializer -> limeValue.values.flatMap { resolveValueImports(it) }
            is LimeValue.Constant -> resolveElementImports(limeValue.valueRef.typeRef)
            else -> emptyList()
        }
}
