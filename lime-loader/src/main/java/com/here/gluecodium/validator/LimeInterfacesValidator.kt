/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel

/**
 * Validates interfaces against having @PointerEquatable attribute, which is unsupported.
 */
internal class LimeInterfacesValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allInterfaces = limeModel.referenceMap.values.filterIsInstance<LimeInterface>()
        val validationResults = allInterfaces.map { validatePointerEquatable(it) }

        return !validationResults.contains(false)
    }

    private fun validatePointerEquatable(limeInterface: LimeInterface) =
        when {
            limeInterface.attributes.have(LimeAttributeType.POINTER_EQUATABLE) -> {
                logger.error(limeInterface, "@PointerEquatable is not supported for interfaces")
                false
            }
            else -> true
        }
}
