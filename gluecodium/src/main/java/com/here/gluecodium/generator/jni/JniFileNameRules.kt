/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import com.here.gluecodium.generator.java.JavaNameRules
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import java.io.File

internal class JniFileNameRules(generatorName: String, private val nameResolver: JniNameResolver) {

    private val jniPathPrefix = generatorName + File.separator + "jni" + File.separator

    fun getHeaderFilePath(fileName: String) = "$jniPathPrefix$fileName.h"

    fun getImplementationFilePath(fileName: String) = "$jniPathPrefix$fileName.cpp"

    fun getConversionFileName(limeElement: LimeNamedElement): String {
        val externalName = limeElement.external?.java?.get(NAME_NAME)
        return when {
            externalName != null -> {
                val packageNames = JavaNameRules.getPackageFromImportString(externalName)
                val classNames = JavaNameRules.getClassNamesFromImportString(externalName)
                (packageNames + classNames).joinToString("_")
            }
            else -> getElementFileNamePrefix(limeElement)
        } + JNI_CONVERSION_SUFFIX
    }

    fun getElementFileName(limeElement: LimeNamedElement) =
        getElementFileNamePrefix(limeElement) +
            if (limeElement is LimeInterface || limeElement is LimeLambda) "Impl" else ""

    private fun getElementFileNamePrefix(limeElement: LimeNamedElement) =
        nameResolver.resolveName(limeElement).replace('/', '_').replace('$', '_')

    companion object {
        // Conversion suffix has a double underscore "__" to avoid name collisions.
        private const val JNI_CONVERSION_SUFFIX = "__Conversion"
    }
}
