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
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath

internal class LimeImportsValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel, fileNameToImports: Map<String, List<LimePath>>) =
        !fileNameToImports.entries.map {
            validateFileImports(it.key, it.value, limeModel.referenceMap)
        }.contains(false)

    private fun validateFileImports(
        fileName: String,
        imports: List<LimePath>,
        referenceMap: Map<String, LimeElement>
    ): Boolean {
        val unresolvedImports = imports.filterNot { referenceMap.containsKey(it.toString()) }
        unresolvedImports.forEach { logger.error(fileName, "import '$it' cannot be resolved") }
        return unresolvedImports.isEmpty()
    }
}
