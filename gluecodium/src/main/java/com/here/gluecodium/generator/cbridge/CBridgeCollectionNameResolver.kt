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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias

class CBridgeCollectionNameResolver(private val internalPrefix: String) {
    fun getCollectionName(limeType: LimeType): String = when (limeType) {
        is LimeTypeAlias -> getCollectionName(limeType.typeRef.type)
        is LimeList -> "${internalPrefix}ArrayOf_${getCollectionName(limeType.elementType.type)}"
        is LimeMap -> {
            val keyTypeName = getCollectionName(limeType.keyType.type)
            val valueTypeName = getCollectionName(limeType.valueType.type)
            "${internalPrefix}MapOf_${keyTypeName}_To_$valueTypeName"
        }
        is LimeSet -> "${internalPrefix}SetOf_${getCollectionName(limeType.elementType.type)}"
        else -> CBridgeNameRules.getTypeName(limeType)
    }
}
