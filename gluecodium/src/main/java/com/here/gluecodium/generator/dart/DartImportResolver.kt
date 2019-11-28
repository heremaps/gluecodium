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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeTypeRef

internal class DartImportResolver(private val nameRules: NameRules) {

    fun resolveImports(limeElement: LimeElement): List<DartImport> =
        when (limeElement) {
            is LimeBasicType -> resolveBasicTypeImports(limeElement)
            is LimeTypeRef -> resolveImports(limeElement.type)
            is LimeNamedElement -> {
                val filePath =
                    (limeElement.path.head + nameRules.getName(limeElement)).joinToString("/")
                listOf(
                    DartImport(filePath)
                    //, createConversionImport(filePath) // TODO: APIGEN-1777: struct conversion
                )
            }
            else -> emptyList()
        }

    private fun resolveBasicTypeImports(limeType: LimeBasicType) =
        when (limeType.typeId) {
            LimeBasicType.TypeId.STRING -> listOf(createConversionImport("String"))
            LimeBasicType.TypeId.BLOB -> listOf(createConversionImport("List"))
            LimeBasicType.TypeId.DATE -> listOf(createConversionImport("DateTime"))
            else -> emptyList()
        }

    companion object {
        private fun createConversionImport(filePath: String) =
            DartImport(filePath + "__conversion", "__lib")
    }
}
