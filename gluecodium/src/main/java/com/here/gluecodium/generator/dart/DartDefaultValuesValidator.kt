/*
 * Copyright (C) 2016-2024 HERE Europe B.V.
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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.IMMUTABLE
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue

class DartDefaultValuesValidator(private val logger: LimeLogger) {
    fun validate(referenceMap: Map<String, LimeElement>): Boolean {
        val allStructs = referenceMap.values.filterIsInstance<LimeStruct>()
        return !allStructs.map { validatePositionalDefaults(it) }.contains(false)
    }

    private fun validatePositionalDefaults(limeStruct: LimeStruct): Boolean {
        if (!limeStruct.attributes.have(DART, LimeAttributeValueType.POSITIONAL_DEFAULTS)) {
            return true
        }

        var result = true
        for (field in limeStruct.initializedFields) {
            // Types other than BLOB and custom LimeStructs provide const constructors.
            val basicType = field.typeRef.type as? LimeBasicType
            if (field.typeRef.type !is LimeStruct && (basicType?.typeId != LimeBasicType.TypeId.BLOB)) {
                continue
            }

            // Custom immutable types provide const constructors.
            if (field.typeRef.type.attributes.have(IMMUTABLE)) {
                continue
            }

            // If the type does not provide const constructor, then generated 'PositionalDefaults' constructor
            // will utilize optional field to avoid compilation errors.
            // However, if the user uses 'nullable type' and wants to set value that is different from 'null' as the
            // default one, then if somebody passed 'null' to the generated constructor, then it wouldn't be honored.
            //
            // Do not allow users to do that.
            if (field.typeRef.isNullable && field.defaultValue!! !is LimeValue.Null) {
                logger.error(field, "$NULLABLE_ERROR_REASON; please check $DOCS_LINK")
                result = false
            }
        }

        return result
    }

    companion object {
        const val NULLABLE_ERROR_REASON =
            "For '@PositionalDefaults' structs, nullable fields that do not provide" +
                " const constructors must use 'null' default value"
        const val DOCS_LINK = "https://github.com/heremaps/gluecodium/blob/master/docs/lime_attributes.md#dart-specific-attributes"
    }
}
