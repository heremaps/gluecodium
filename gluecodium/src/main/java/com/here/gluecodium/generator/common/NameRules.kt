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

package com.here.gluecodium.generator.common

import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypedElement

open class NameRules(val ruleSet: NameRuleSet) {
    open fun getName(limeElement: LimeElement) =
        when (limeElement) {
            is LimeField -> ruleSet.getFieldName(limeElement.name)
            is LimeParameter -> ruleSet.getParameterName(limeElement.name)
            is LimeConstant -> ruleSet.getConstantName(limeElement.name)
            is LimeEnumerator -> ruleSet.getEnumeratorName(limeElement.name)
            is LimeFunction -> ruleSet.getMethodName(limeElement.name)
            is LimeFieldConstructor -> ruleSet.getMethodName(limeElement.name)
            is LimeException -> ruleSet.getErrorName(limeElement.name)
            is LimeType -> ruleSet.getTypeName(limeElement.name)
            is LimeProperty -> getPropertyName(limeElement)
            else -> throw IllegalArgumentException()
        }

    open fun getPropertyName(limeProperty: LimeProperty): String {
        val type = limeProperty.typeRef.type.actualType
        return ruleSet.getPropertyName(
            limeProperty.name, type is LimeBasicType && type.typeId == LimeBasicType.TypeId.BOOLEAN
        )
    }

    open fun getGetterName(limeElement: LimeTypedElement): String {
        val type = limeElement.typeRef.type.actualType
        return ruleSet.getGetterName(
            limeElement.name, type is LimeBasicType && type.typeId == LimeBasicType.TypeId.BOOLEAN
        )
    }

    open fun getSetterName(limeElement: LimeTypedElement) =
        ruleSet.getSetterName(limeElement.name)
}
