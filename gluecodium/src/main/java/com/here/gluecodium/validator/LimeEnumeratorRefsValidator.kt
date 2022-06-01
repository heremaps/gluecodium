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
import com.here.gluecodium.common.LimeValuesVisitor
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeValue

/* Validates all enumerator references by trying to resolve each one and reporting any resulting
 * exceptions as validation failures.
 */
internal class LimeEnumeratorRefsValidator(private val logger: LimeLogger) :
    LimeValuesVisitor<Boolean>() {

    fun validate(limeModel: LimeModel) = !traverseModel(limeModel).contains(false)

    override fun visitValue(parentElement: LimeNamedElement, limeValue: LimeValue?): Boolean {
        if (limeValue !is LimeValue.Constant) {
            return true
        }

        return try {
            limeValue.valueRef.element
            true
        } catch (e: LimeModelLoaderException) {
            logger.error(parentElement, e.message ?: "")
            false
        }
    }
}
