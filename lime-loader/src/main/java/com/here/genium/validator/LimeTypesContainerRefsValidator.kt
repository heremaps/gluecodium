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
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeTypeRef

// Validate against referring to a type collection directly
internal class LimeTypesContainerRefsValidator(private val logger: LimeLogger) :
    LimeTypeRefsVisitor<Boolean>() {

    fun validate(limeModel: LimeModel) = !traverseModel(limeModel).contains(false)

    override fun visitTypeRef(
        parentElement: LimeNamedElement,
        limeTypeRef: LimeTypeRef?
    ): Boolean {
        if (limeTypeRef == null) {
            return true
        }

        val referredType = limeTypeRef.type
        return if (referredType is LimeContainer && referredType.type == LimeContainer.ContainerType.TYPE_COLLECTION) {
            logger.error(
                parentElement,
                "refers to `types` container ${referredType.fullName} which cannot be used as a type itself."
            )
            false
        } else true
    }
}
