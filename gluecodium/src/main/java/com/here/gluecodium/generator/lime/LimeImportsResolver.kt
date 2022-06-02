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

package com.here.gluecodium.generator.lime

import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue

internal class LimeImportsResolver(private val path: LimePath) : ImportsResolver<LimePath> {

    override fun resolveElementImports(limeElement: LimeElement): List<LimePath> =
        when (limeElement) {
            is LimeTypeRef -> resolveTypeImports(limeElement.type)
            is LimeValue -> resolveValueImports(limeElement)
            else -> emptyList()
        }

    private fun resolveTypeImports(limeType: LimeType): List<LimePath> =
        when {
            limeType is LimeGenericType -> resolveGenericTypeImports(limeType)
            limeType.path == LimePath.EMPTY_PATH -> emptyList()
            limeType.path.parent == path.parent -> emptyList() // same level package
            (limeType.path.allParents + limeType.path).contains(path) -> emptyList()
            else -> listOf(limeType.path)
        }

    private fun resolveGenericTypeImports(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> resolveElementImports(limeType.elementType)
            is LimeSet -> resolveElementImports(limeType.elementType)
            is LimeMap -> resolveElementImports(limeType.keyType) + resolveElementImports(limeType.valueType)
            else -> emptyList()
        }

    private fun resolveValueImports(limeValue: LimeValue): List<LimePath> =
        when (limeValue) {
            is LimeValue.KeyValuePair -> resolveValueImports(limeValue.key) + resolveValueImports(limeValue.value)
            is LimeValue.Constant -> resolveTypeImports(limeValue.valueRef.typeRef.type)
            is LimeValue.StructInitializer -> limeValue.values.flatMap { resolveValueImports(it) }
            is LimeValue.InitializerList -> limeValue.values.flatMap { resolveValueImports(it) }
            else -> emptyList()
        }
}
