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

import com.here.genium.generator.common.NameRuleSet
import com.here.genium.generator.common.NameRules
import com.here.genium.model.lime.LimeAttributeType.JAVA
import com.here.genium.model.lime.LimeAttributeValueType.NAME
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeProperty

class JavaNameRules(nameRuleSet: NameRuleSet) : NameRules(nameRuleSet) {
    override fun getName(limeElement: LimeElement) =
        getPlatformName(limeElement as? LimeNamedElement) ?: super.getName(limeElement)

    override fun getGetterName(limeProperty: LimeProperty) =
        getPlatformName(limeProperty.getter) ?: super.getGetterName(limeProperty)

    override fun getSetterName(limeProperty: LimeProperty) =
        getPlatformName(limeProperty.setter) ?: super.getSetterName(limeProperty)

    override fun getMethodName(limeMethod: LimeMethod, suffix: String?) =
        getPlatformName(limeMethod) ?: super.getMethodName(limeMethod, suffix)

    fun getImplementationClassName(limeContainer: LimeContainer) = getName(limeContainer) + "Impl"

    fun getExceptionName(limeEnum: LimeEnumeration) =
        ruleSet.getErrorName(getPlatformName(limeEnum) ?: limeEnum.name)

    private fun getPlatformName(limeElement: LimeNamedElement?) =
        limeElement?.attributes?.get(JAVA, NAME, String::class.java)
}
