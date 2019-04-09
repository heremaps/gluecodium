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

package com.here.genium.model.cpp

import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppNameRules
import com.here.genium.model.common.Include

class CppTemplateTypeRef private constructor(
    fullyQualifiedName: String,
    val templateClass: TemplateClass,
    val templateParameters: List<CppTypeRef>
) : CppComplexTypeRef(fullyQualifiedName) {

    enum class TemplateClass(
        val namespace: String?,
        val templateName: String,
        val include: Include
    ) {
        SHARED_POINTER("std", "shared_ptr", CppLibraryIncludes.MEMORY),
        MAP("std", "unordered_map", CppLibraryIncludes.MAP),
        VECTOR("std", "vector", CppLibraryIncludes.VECTOR),
        BASIC_STRING("std", "basic_string", CppLibraryIncludes.STRING),
        RETURN(null, "Return", CppLibraryIncludes.RETURN),
        OPTIONAL(null, "optional", CppLibraryIncludes.OPTIONAL);
    }

    override fun stream() = templateParameters.stream()

    companion object {
        fun create(templateClass: TemplateClass, vararg parameters: CppTypeRef) =
                create(templateClass.namespace, templateClass, *parameters)

        fun create(
            namespace: List<String>?,
            templateClass: TemplateClass,
            vararg parameters: CppTypeRef
        ) = create(CppNameRules.joinFullyQualifiedName(namespace), templateClass, *parameters)

        fun create(
            namespace: String?,
            templateClass: TemplateClass,
            vararg parameters: CppTypeRef
        ): CppTemplateTypeRef {
            val parametersString = parameters.joinToString(", ") { it.name }
            val fullyQualifiedName =
                CppNameRules.joinFullyQualifiedName(namespace, templateClass.templateName)

            val templateTypeRef = CppTemplateTypeRef(
                "$fullyQualifiedName< $parametersString >", templateClass, parameters.toList()
            )
            templateTypeRef.includes.addAll(parameters.flatMap { it.includes })
            templateTypeRef.includes.add(templateClass.include)

            return templateTypeRef
        }
    }
}
