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
import com.here.genium.model.lime.LimeGenericType
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeModelLoaderException
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeTypeRef
import java.util.logging.Logger

/* Validates all type references by trying to resolve each one and reporting any resulting
 * exceptions as validation failures.
 */
internal class LimeTypeRefsValidator(private val logger: Logger)
    : LimeTypeRefsVisitor<Boolean>() {

    fun validate(limeModel: LimeModel) = !traverseModel(limeModel).contains(false)

    override fun visitTypeRef(parentElement: LimeNamedElement, limeTypeRef: LimeTypeRef?): Boolean {
        if (limeTypeRef == null) {
            return true
        }

        val referredType = validateTypeRef(parentElement, limeTypeRef)
        return when (referredType) {
            null -> false
            is LimeGenericType ->
                !referredType.childTypes.map { visitTypeRef(parentElement, it) }.contains(false)
            else -> true
        }
    }

    private fun validateTypeRef(parentElement: LimeNamedElement, limeTypeRef: LimeTypeRef) =
        try {
            limeTypeRef.type
        } catch (e: LimeModelLoaderException) {
            logger.severe("${parentElement.fullName}: ${e.message}")
            null
        }
}
