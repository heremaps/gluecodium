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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.generator.common.NameRuleSet
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeNamedElement
import java.io.File

internal class CppNameRules(
    private val rootNamespace: List<String>,
    nameRuleSet: NameRuleSet,
) : NameRules(nameRuleSet) {
    fun getOutputFilePath(limeElement: LimeNamedElement): String {
        val fileName =
            limeElement.attributes.get(CPP, NAME) ?: ruleSet.getTypeName(limeElement.path.container)
        return (rootNamespace + limeElement.path.head + fileName)
            .joinToString(separator = File.separator)
    }
}
