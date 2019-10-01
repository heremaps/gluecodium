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
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.model.common.Include

class CppTemplateTypeRef(
    val templateClass: TemplateClass,
    vararg parameters: CppTypeRef,
    namespace: String? = templateClass.namespace
) : CppComplexTypeRef(
    composeTemplateName(namespace, templateClass, parameters),
    parameters.flatMap { it.includes } + templateClass.includes
) {
    val templateParameters: List<CppTypeRef> = parameters.toList()

    enum class TemplateClass(
        val namespace: String?,
        val templateName: String,
        val includes: List<Include>
    ) {
        SHARED_POINTER("std", "shared_ptr", listOf(CppLibraryIncludes.MEMORY)),
        MAP("std", "unordered_map", listOf(CppLibraryIncludes.MAP, CppLibraryIncludes.MAP_HASH)),
        VECTOR("std", "vector", listOf(CppLibraryIncludes.VECTOR, CppLibraryIncludes.VECTOR_HASH)),
        BASIC_STRING("std", "basic_string", listOf(CppLibraryIncludes.STRING)),
        RETURN(null, "Return", listOf(CppLibraryIncludes.RETURN)),
        OPTIONAL(null, "optional", listOf(CppLibraryIncludes.OPTIONAL)),
        SET("std", "unordered_set", listOf(CppLibraryIncludes.SET, CppLibraryIncludes.SET_HASH)),
        HASH(null, "hash", listOf(CppLibraryIncludes.HASH))
    }

    override fun stream() = templateParameters

    companion object {
        private fun composeTemplateName(
            namespace: String?,
            templateClass: TemplateClass,
            parameters: Array<out CppTypeRef>
        ): String {
            val fullyQualifiedName =
                CppNameRules.joinFullyQualifiedName(namespace, templateClass.templateName)
            val parametersString = parameters.joinToString(", ") { it.name }
            return "$fullyQualifiedName< $parametersString >"
        }
    }
}
