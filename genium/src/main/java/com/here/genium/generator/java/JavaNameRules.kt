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

package com.here.genium.generator.java

import com.here.genium.generator.common.NameHelper
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaTopLevelElement
import com.here.genium.model.java.JavaType
import java.io.File

class JavaNameRules(private val generatorName: String) {
    fun getFileName(javaElement: JavaTopLevelElement) =
        (generatorName +
            File.separator +
            formatPackageName(javaElement.javaPackage.packageNames) +
            javaElement.name +
            JAVA_FILE_SUFFIX)

    companion object {
        private const val JAVA_FILE_SUFFIX = ".java"

        private fun formatPackageName(packageNames: List<String>) =
            when {
                packageNames.isEmpty() -> ""
                else -> packageNames.joinToString(File.separator) + File.separator
            }

        fun getClassName(base: String) = NameHelper.toUpperCamelCase(base)

        fun getImplementationClassName(base: String) = getClassName(base) + "Impl"

        fun getMethodName(base: String, selector: String) =
            NameHelper.toLowerCamelCase(base) + NameHelper.toUpperCamelCase(selector)

        fun getGetterName(base: String, javaType: JavaType): String {
            val prefix = if (javaType === JavaPrimitiveType.BOOL) "is" else "get"
            return prefix + NameHelper.toUpperCamelCase(base)
        }

        fun getSetterName(base: String) = "set" + NameHelper.toUpperCamelCase(base)

        fun getArgumentName(base: String) = NameHelper.toLowerCamelCase(base)

        fun getConstantName(base: String) = NameHelper.toUpperSnakeCase(base)

        fun getFieldName(base: String) = NameHelper.toLowerCamelCase(base)

        fun getExceptionName(base: String) = getClassName(base) + "Exception"

        fun getPackageName(base: String) = base.replace("_", "")
    }
}
