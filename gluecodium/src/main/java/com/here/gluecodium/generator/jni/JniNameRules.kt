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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.model.java.JavaCustomType
import com.here.gluecodium.model.jni.JniContainer
import com.here.gluecodium.model.jni.JniTopLevelElement
import java.io.File

class JniNameRules(generatorName: String) {

    private val jniPathPrefix = generatorName + File.separator + "jni" + File.separator

    fun getHeaderFilePath(fileName: String) = jniPathPrefix + getHeaderFileName(fileName)

    fun getImplementationFilePath(fileName: String) = "$jniPathPrefix$fileName.cpp"

    companion object {
        const val JNI_HEADER_FILE_SUFFIX = ".h"
        const val JNI_CPP_PROXY_SUFFIX = "CppProxy"
        // Conversion suffix has a double underscore "__" to avoid name collisions.
        private const val JNI_CONVERSION_SUFFIX = "__Conversion"

        fun getHeaderFileName(fileName: String) = fileName + JNI_HEADER_FILE_SUFFIX

        /**
         * JNI name mangling. See
         * https://docs.oracle.com/javase/7/docs/technotes/guides/jni/spec/design.html#wp641
         */
        fun getMangledName(name: String): String {
            return name.replace("_", "_1")
                .replace(";", "_2")
                .replace("[", "_3")
                .replace("$", "_00024")
                .replace("/", "_")
        }

        fun getFullClassName(javaType: JavaCustomType) =
            (javaType.packageNames + javaType.classNames.joinToString("$")).joinToString("/")

        fun getJniClassFileName(jniContainer: JniContainer) =
            (jniContainer.javaPackage.packageNames + jniContainer.javaNames).joinToString("_")

        fun getJniStructFileName(jniElement: JniTopLevelElement) =
            (jniElement.javaPackage.packageNames + jniElement.javaName.replace("$", "_")).joinToString("_")

        fun getConversionFileName(jniElement: JniTopLevelElement) =
            getConversionFileName(jniElement.javaPackage.packageNames, jniElement.javaName.split("$"))

        fun getConversionFileName(jniContainer: JniContainer) =
            getConversionFileName(jniContainer.javaPackage.packageNames, jniContainer.javaInterfaceNames)

        fun getConversionFileName(packageNames: List<String>, classNames: List<String>) =
            (packageNames + classNames).joinToString("_") + JNI_CONVERSION_SUFFIX
    }
}
