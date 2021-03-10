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

import com.here.gluecodium.common.LimeTypeRefsVisitor
import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef

internal class SwiftImportsCollector(private val importsResolver: ImportsResolver<String>) : ImportsCollector<String> {

    private val typesCollector = ReferredTypesCollector()

    override fun collectImports(limeElement: LimeNamedElement): List<String> {
        val allTypes = LimeTypeHelper.getAllTypes(limeElement)
        return (allTypes + typesCollector.getAllReferredTypes(allTypes))
            .flatMap { importsResolver.resolveElementImports(it) }
    }

    private class ReferredTypesCollector : LimeTypeRefsVisitor<List<LimeType>>() {
        override fun visitTypeRef(parentElement: LimeNamedElement, limeTypeRef: LimeTypeRef?): List<LimeType> =
            when (val limeType = limeTypeRef?.type?.actualType) {
                null -> emptyList()
                !is LimeGenericType -> listOf(limeType)
                is LimeList -> listOf(limeType) + visitTypeRef(parentElement, limeType.elementType)
                is LimeSet -> listOf(limeType) + visitTypeRef(parentElement, limeType.elementType)
                is LimeMap -> listOf(limeType) + visitTypeRef(parentElement, limeType.keyType) +
                    visitTypeRef(parentElement, limeType.valueType)
                else -> emptyList()
            }

        fun getAllReferredTypes(types: List<LimeType>) = traverseTypes(types).flatten()
    }
}
