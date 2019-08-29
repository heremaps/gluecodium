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

package com.here.genium.model.java

import java.util.LinkedHashSet

class JavaTemplateType private constructor(
    name: String,
    imports: Set<JavaImport>,
    templateClass: TemplateClass,
    val templateParameters: List<JavaType>
) : JavaCustomType(name, imports, listOf(templateClass.interfaceName), templateClass.packageNames) {

    val implementationType = templateClass.implementationType

    enum class TemplateClass(
        val interfaceName: String,
        javaPackage: JavaPackage,
        implementationTypeName: String
    ) {
        LIST("List", JAVA_UTIL, "ArrayList"),
        MAP("Map", JAVA_UTIL, "HashMap"),
        SET("Set", JAVA_UTIL, "HashSet"),
        ENUM_SET("Set", JAVA_UTIL, "EnumSet");

        val implementationType = JavaCustomType(
            fullName = "$implementationTypeName<>",
            packageNames = javaPackage.packageNames,
            imports = setOf(JavaImport(implementationTypeName, javaPackage))
        )
        val javaImport = JavaImport(interfaceName, javaPackage)
        val packageNames = javaPackage.packageNames
    }

    companion object {
        val JAVA_UTIL = JavaPackage(listOf("java", "util"))

        fun create(templateClass: TemplateClass, vararg parameters: JavaType): JavaTemplateType {
            val templateParameters = parameters.toList()
            val templateParametersString = templateParameters.joinToString(", ") { it.name }
            val name = "${templateClass.interfaceName}<$templateParametersString>"
            val imports = listOf(templateClass.javaImport) +
                templateParameters.flatMap { it.imports.toList() }

            return JavaTemplateType(name, LinkedHashSet(imports), templateClass, templateParameters)
        }
    }
}
