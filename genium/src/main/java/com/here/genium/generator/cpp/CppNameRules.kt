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

package com.here.genium.generator.cpp

import com.here.genium.generator.common.NameRuleSet
import com.here.genium.generator.common.NameRules
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeContainer
import java.io.File

class CppNameRules(
    private val rootNamespace: List<String>,
    nameRuleSet: NameRuleSet
) : NameRules(nameRuleSet) {

    fun getOutputFilePath(limeElement: LimeContainer): String {
        val platformName =
            limeElement.attributes.get(LimeAttributeType.CPP_NAME, String::class.java)
        val fileName = platformName ?: ruleSet.getTypeName(limeElement.path.container)
        return (rootNamespace + limeElement.path.head + fileName)
            .joinToString(separator = File.separator)
    }

    companion object {
        fun joinFullyQualifiedName(nameList: List<String>) = "::" + nameList.joinToString("::")

        fun joinFullyQualifiedName(namespace: String?, name: String) =
            when {
                namespace == null -> "::$name"
                namespace.startsWith("::") -> "$namespace::$name"
                else -> "::$namespace::$name"
            }
    }
}
