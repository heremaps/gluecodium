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

package com.here.genium.validator

import com.here.genium.common.LimeTypeRefsVisitor
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeTypeHelper
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeTypesCollection

/**
 * Validate against:
 * * Referring to type collections directly.
 * * Referring to non-enum types from exception types.
 */
internal class LimeTypeRefTargetValidator(private val logger: LimeLogger) :
    LimeTypeRefsVisitor<Boolean>() {

    fun validate(limeModel: LimeModel) = !traverseModel(limeModel).contains(false)

    override fun visitTypeRef(parentElement: LimeNamedElement, limeTypeRef: LimeTypeRef?): Boolean {
        val referredType = limeTypeRef?.type?.let { LimeTypeHelper.getActualType(it) }
        return when {
            referredType is LimeTypesCollection -> {
                logger.error(
                    parentElement,
                    "refers to `types` container ${referredType.fullName} " +
                            "which cannot be used as a type itself."
                )
                false
            }
            parentElement is LimeException && referredType !is LimeEnumeration -> {
                logger.error(parentElement, "refers to a non-enumeration type.")
                false
            }
            else -> true
        }
    }
}
