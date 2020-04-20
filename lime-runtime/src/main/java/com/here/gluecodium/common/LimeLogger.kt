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

package com.here.gluecodium.common

import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.model.lime.LimeNamedElement
import java.util.logging.Level
import java.util.logging.Logger

class LimeLogger(
    private val logger: Logger,
    private val elementNameToFileName: Map<String, String>
) {
    fun error(limeElement: LimeNamedElement, message: String) =
        log(Level.SEVERE, getFileName(limeElement), limeElement.fullName, message)

    fun error(elementName: String, message: String) =
        log(Level.SEVERE, getFileName(elementName), elementName, message)

    fun errorWithFileName(fileName: String, message: String) =
        log(Level.SEVERE, fileName, null, message)

    fun warning(limeElement: LimeNamedElement, message: String) =
        log(Level.WARNING, getFileName(limeElement), limeElement.fullName, message)

    fun warning(elementName: String, message: String) =
        log(Level.WARNING, getFileName(elementName), elementName, message)

    private fun log(
        logLevel: Level,
        fileName: String,
        elementName: String?,
        message: String
    ) {
        val elementInfix = elementName?.let { ", element $it" } ?: ""
        logger.log(logLevel, "File $fileName$elementInfix: $message")
    }

    private fun getFileName(limeElement: LimeNamedElement): String {
        val containerKey = (limeElement.path.head + limeElement.path.container).joinToString(".")
        return elementNameToFileName[containerKey]
            ?: throw LimeModelLoaderException(
                "Failed to resolve file name for ${limeElement.fullName} element"
            )
    }

    private fun getFileName(elementName: String): String {
        val pathComponents = elementName.split(".")
        for (i in pathComponents.size downTo 1) {
            return elementNameToFileName[pathComponents.take(i).joinToString(".")] ?: continue
        }
        throw LimeModelLoaderException("Failed to resolve file name for $elementName element")
    }
}
