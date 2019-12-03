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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.EXTENSION
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias

class SwiftNameResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: SwiftNameRules
) {
    fun getNestedNames(limeType: LimeType): List<String> {
        val parentContainer = limeReferenceMap.takeIf { limeType.path.hasParent }
            ?.get(limeType.path.parent.toString()) as? LimeContainer

        val name = nameRules.getName(limeType)
        return when {
            parentContainer?.attributes?.have(SWIFT, EXTENSION) == true ||
                    parentContainer is LimeClass -> getNestedNames(parentContainer) + name
            parentContainer is LimeInterface &&
                    (limeType is LimeTypeAlias || limeType is LimeLambda) ->
                getNestedNames(parentContainer) + name
            else -> listOf(name)
        }
    }

    fun getFullName(limeType: LimeType) = getNestedNames(limeType).joinToString(".")
}
