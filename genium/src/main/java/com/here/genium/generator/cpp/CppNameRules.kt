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
import com.here.genium.generator.common.NameRules

object CppNameRules : NameRules {
    override fun getTypeName(base: String) = NameHelper.toUpperCamelCase(base) // MyType

    override fun getFunctionName(base: String) = NameHelper.toLowerSnakeCase(base) // do_my_stuff

    override fun getVariableName(base: String) = NameHelper.toLowerSnakeCase(base) // my_variable

    override fun getConstantName(base: String) = NameHelper.toUpperSnakeCase(base) // MY_CONSTANT

    fun getGetterPrefix(isBoolean: Boolean) = if (isBoolean) "is_" else "get_"

    val setterPrefix
        get() = "set_"

    fun joinFullyQualifiedName(nameList: List<String>) = "::" + nameList.joinToString("::")

    fun joinFullyQualifiedName(namespace: String?, name: String) =
        when {
            namespace == null -> "::$name"
            namespace.startsWith("::") -> "$namespace::$name"
            else -> "::$namespace::$name"
        }
}
