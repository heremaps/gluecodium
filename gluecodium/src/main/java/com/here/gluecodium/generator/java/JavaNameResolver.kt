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

package com.here.gluecodium.generator.java

import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypesCollection

class JavaNameResolver(
    private val nameRules: JavaNameRules,
    private val limeReferenceMap: Map<String, LimeElement>
) {
    fun getClassNames(limeType: LimeType): List<String> {
        val classNames = limeType.path.tail.dropLast(1).map { nameRules.ruleSet.getTypeName(it) } +
                nameRules.getName(limeType)
        val containerKey =
            LimePath(limeType.path.head, listOf(limeType.path.container)).toString()
        return when {
            limeReferenceMap[containerKey] is LimeTypesCollection -> classNames.drop(1)
            else -> classNames
        }
    }

    fun getName(limeElement: LimeNamedElement) = nameRules.getName(limeElement)
}
