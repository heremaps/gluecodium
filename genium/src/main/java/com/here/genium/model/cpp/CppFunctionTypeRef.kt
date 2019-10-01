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

package com.here.gluecodium.model.cpp

import com.here.gluecodium.generator.cpp.CppLibraryIncludes

class CppFunctionTypeRef(
    val parameters: List<CppTypeRef>,
    val returnType: CppTypeRef
) : CppComplexTypeRef("") {

    override val name = run {
        val parametersString = parameters.joinToString(", ") {
            "const ${it.name}" + if (it.refersToValueType) "" else "&"
        }
        "::std::function<${returnType.name}($parametersString)>"
    }

    override val fullyQualifiedName = name

    override val includes
        get() = stream().flatMap { it.includes } + CppLibraryIncludes.FUNCTIONAL

    override fun stream() = parameters + returnType
}
