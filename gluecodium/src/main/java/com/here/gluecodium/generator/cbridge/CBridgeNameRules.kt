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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeNamedElement
import java.io.File

internal object CBridgeNameRules {
    const val CBRIDGE_PUBLIC = "cbridge"
    const val CBRIDGE_INTERNAL = "cbridge_internal"

    private fun getName(limeElement: LimeNamedElement) =
        mangleName(getPlatformName(limeElement) ?: NameHelper.toUpperCamelCase(limeElement.name))

    fun mangleName(name: String) = name.replace(".", "_1")

    private fun getPlatformName(limeElement: LimeNamedElement?) = limeElement?.attributes?.get(SWIFT, NAME)

    fun createPath(
        limeElement: LimeNamedElement,
        rootNamespace: List<String>,
        subfolder: String,
        suffix: String,
        infix: String = if (limeElement.attributes.have(SWIFT, LimeAttributeValueType.EXTENSION)) "__extension" else ""
    ): String {
        val fileName = "cbridge_" + getName(limeElement) + infix + suffix
        return (
            listOf(CBRIDGE_PUBLIC, subfolder) + rootNamespace + limeElement.path.head + fileName
            ).joinToString(File.separator)
    }
}
