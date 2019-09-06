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

package com.here.genium.generator.jni

import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.jni.JniContainer
import com.here.genium.model.jni.JniStruct
import java.io.File

class JniNameRules(generatorName: String) {

    private val jniPathPrefix = generatorName + File.separator + "jni" + File.separator

    fun getHeaderFilePath(fileName: String) = jniPathPrefix + getHeaderFileName(fileName)

    fun getImplementationFilePath(fileName: String) =
        jniPathPrefix + fileName + JNI_IMPLEMENTATION_FILE_SUFFIX

    companion object {
        private const val JNI_HEADER_FILE_SUFFIX = ".h"
        private const val JNI_IMPLEMENTATION_FILE_SUFFIX = ".cpp"
        const val JNI_ENUM_CONVERSION_NAME = "EnumConversion"
        const val JNI_STRUCT_CONVERSION_NAME = "StructConversion"
        const val JNI_INSTANCE_CONVERSION_NAME = "InstanceConversion"
        const val JNI_PROXY_CONVERSION_NAME = "ProxyConversion"
        const val JNI_CPP_PROXY_SUFFIX = "CppProxy"

        fun getHeaderFileName(fileName: String): String {
            return fileName + JNI_HEADER_FILE_SUFFIX
        }

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
            (jniContainer.javaPackages + jniContainer.javaNames).joinToString("_")

        fun getJniStructFileName(jniContainer: JniContainer, jniStruct: JniStruct) =
            (jniContainer.javaPackages + jniStruct.javaStructName.replace("$", "_")).joinToString("_")
    }
}
