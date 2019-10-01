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

package com.here.gluecodium.generator.java

import com.here.gluecodium.model.java.JavaTopLevelElement
import java.io.File

class JavaFileMapper (private val generatorName: String) {
    fun getFileName(javaElement: JavaTopLevelElement) =
        (generatorName +
                File.separator +
                formatPackageName(javaElement.javaPackage.packageNames) +
                javaElement.name +
                JAVA_FILE_SUFFIX)

    private val JAVA_FILE_SUFFIX = ".java"

    private fun formatPackageName(packageNames: List<String>) =
        when {
            packageNames.isEmpty() -> ""
            else -> packageNames.joinToString(File.separator) + File.separator
        }
}