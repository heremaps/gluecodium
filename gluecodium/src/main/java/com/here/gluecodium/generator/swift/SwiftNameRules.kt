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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.generator.common.NameRuleSet
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import java.io.File

class SwiftNameRules(nameRuleSet: NameRuleSet) : NameRules(nameRuleSet) {
    override fun getName(limeElement: LimeElement) =
        getPlatformName(limeElement as? LimeNamedElement) ?: super.getName(limeElement)

    override fun getPropertyName(limeProperty: LimeProperty) =
        getPlatformName(limeProperty) ?: super.getPropertyName(limeProperty)

    fun getImplementationFileName(limeElement: LimeNamedElement): String {
        val isSwiftExtension = limeElement.attributes.have(SWIFT, LimeAttributeValueType.EXTENSION)
        val suffix = if (isSwiftExtension) "__extension" else ""
        return (TARGET_DIRECTORY +
                limeElement.path.head.joinToString(File.separator) +
                File.separator +
                getName(limeElement) +
                suffix +
                ".swift")
    }

    private fun getPlatformName(limeElement: LimeNamedElement?) =
        limeElement?.attributes?.get(SWIFT, NAME)

    companion object {
        val TARGET_DIRECTORY = "swift" + File.separator
    }
}
