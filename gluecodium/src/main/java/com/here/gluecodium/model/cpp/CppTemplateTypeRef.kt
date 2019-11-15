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

import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.model.common.Include

class CppTemplateTypeRef(
    val templateClass: TemplateClass,
    includes: List<Include>,
    vararg parameters: CppTypeRef,
    namespace: String? = templateClass.namespace
) : CppComplexTypeRef(
    composeTemplateName(namespace, templateClass, parameters),
    includes
) {
    val templateParameters: List<CppTypeRef> = parameters.toList()

    enum class TemplateClass(
        val namespace: String?,
        val templateName: String
    ) {
        SHARED_POINTER("std", "shared_ptr"),
        MAP("std", "unordered_map"),
        VECTOR("std", "vector"),
        BASIC_STRING("std", "basic_string"),
        RETURN(null, "Return"),
        OPTIONAL(null, "optional"),
        SET("std", "unordered_set"),
        HASH(null, "hash")
    }

    override val childElements get() = templateParameters

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
