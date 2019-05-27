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

import com.here.genium.generator.common.NameHelper
import com.here.genium.generator.common.NameRuleSet
import com.here.genium.generator.common.NameRuleSet.Companion.ignore2
import com.here.genium.generator.common.NameRules
import com.here.genium.model.lime.LimeNamedElement
import java.io.File

class CppNameRules(
    val rootNamespace: List<String>,
    nameRuleSet: NameRuleSet = defaultRuleSet
) : NameRules(nameRuleSet) {
    fun getOutputFilePath(limeNamedElement: LimeNamedElement) =
        (rootNamespace + limeNamedElement.path.head +
                ruleSet.getTypeName(limeNamedElement.path.container)
                ).joinToString(separator = File.separator)

    companion object {
        val defaultRuleSet = NameRuleSet(
            getFieldName = NameHelper::toLowerSnakeCase,
            getParameterName = NameHelper::toLowerSnakeCase,
            getConstantName = NameHelper::toUpperSnakeCase,
            getEnumeratorName = NameHelper::toUpperSnakeCase,
            getMethodName = ignore2(NameHelper::toLowerSnakeCase),
            getSetterName = { name: String -> setterPrefix + NameHelper.toLowerSnakeCase(name) },
            getGetterName = { name: String, isBoolean: Boolean ->
                getGetterPrefix(isBoolean) + NameHelper.toLowerSnakeCase(name)
            },
            getTypeName = NameHelper::toUpperCamelCase
        )

        fun joinFullyQualifiedName(nameList: List<String>) = "::" + nameList.joinToString("::")

        fun joinFullyQualifiedName(namespace: String?, name: String) =
            when {
                namespace == null -> "::$name"
                namespace.startsWith("::") -> "$namespace::$name"
                else -> "::$namespace::$name"
            }

        private fun getGetterPrefix(isBoolean: Boolean) = if (isBoolean) "is_" else "get_"

        private const val setterPrefix = "set_"
    }
}
