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

import com.here.gluecodium.generator.common.NameRuleSet
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeTypedElement

internal class JavaNameRules(nameRuleSet: NameRuleSet) : NameRules(nameRuleSet) {
    override fun getName(limeElement: LimeElement) =
        getPlatformName(limeElement as? LimeNamedElement) ?: super.getName(limeElement)

    override fun getGetterName(limeElement: LimeTypedElement) =
        (limeElement as? LimeProperty)?.let { getPlatformName(it.getter) }
            ?: super.getGetterName(limeElement)

    override fun getSetterName(limeElement: LimeTypedElement) =
        (limeElement as? LimeProperty)?.let { getPlatformName(it.setter) }
            ?: super.getSetterName(limeElement)

    fun getName(limeLambdaParameter: LimeLambdaParameter, index: Int) =
        limeLambdaParameter.attributes.get(JAVA, NAME) ?: "p$index"

    private fun getPlatformName(limeElement: LimeNamedElement?) =
        limeElement?.attributes?.get(JAVA, NAME)

    companion object {
        fun getPackageFromImportString(importString: String) =
            importString.split('.').takeWhile { it.first().isLowerCase() }

        fun getClassNamesFromImportString(importString: String) =
            importString.split('.').dropWhile { it.first().isLowerCase() }
    }
}
