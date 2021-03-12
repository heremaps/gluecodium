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

package com.here.gluecodium.generator.common

import com.here.gluecodium.common.LimeTypeRefsVisitor
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class OptimizedListsCollector : LimeTypeRefsVisitor<Map<String, LimeList>>() {

    override fun visitTypeRef(parentElement: LimeNamedElement, limeTypeRef: LimeTypeRef?): Map<String, LimeList> {
        val limeType = limeTypeRef?.type?.actualType
        return when {
            limeType !is LimeList -> emptyMap()
            limeTypeRef.attributes.have(LimeAttributeType.OPTIMIZED) -> mapOf(parentElement.path.parent.toString() to limeType)
            else -> emptyMap()
        }
    }

    fun getAllOptimizedLists(limeElement: LimeNamedElement): Map<String, List<LimeList>> {
        val limeType = limeElement as? LimeType ?: return emptyMap()
        return traverseTypes(listOf(limeType)).flatMap { it.entries }.groupBy({ it.key }, { it.value })
    }
}
