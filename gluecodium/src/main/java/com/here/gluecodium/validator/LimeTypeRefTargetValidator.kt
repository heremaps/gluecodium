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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.common.LimeTypeRefsVisitor
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection

/**
 * Validate against:
 * * Referring to type collections directly.
 * * Referring to exception types from anywhere but the `throws` clause.
 */
internal class LimeTypeRefTargetValidator(private val logger: LimeLogger) :
    LimeTypeRefsVisitor<Boolean>() {

    fun validate(limeModel: LimeModel) = !traverseModel(limeModel).contains(false)

    override fun visitTypeRef(parentElement: LimeNamedElement, limeTypeRef: LimeTypeRef?): Boolean {
        val referredType = limeTypeRef?.type?.actualType
        return when {
            referredType is LimeTypesCollection -> {
                logger.error(
                    parentElement,
                    "refers to `types` container ${referredType.fullName} " +
                        "which cannot be used as a type itself."
                )
                false
            }
            referredType is LimeException &&
                (
                    parentElement !is LimeFunction ||
                        parentElement.thrownType?.typeRef?.type !== referredType
                    ) -> {
                logger.error(
                    parentElement,
                    "refers to an exception type ${referredType.fullName} " +
                        "which cannot be used outside of a `throws` clause."
                )
                false
            }
            else -> true
        }
    }
}
