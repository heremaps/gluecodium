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
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef

internal class DartImportResolver(
    private val nameRules: NameRules,
    private val nameResolver: DartNameResolver
) {

    fun resolveImports(limeElement: LimeElement): List<DartImport> =
        when (limeElement) {
            is LimeBasicType -> resolveBasicTypeImports(limeElement)
            is LimeTypeRef -> resolveImports(limeElement.type)
            is LimeGenericType -> emptyList() // TODO: APIGEN-1782
            is LimeNamedElement -> {
                val filePath = limeElement.path.head.joinToString("/")
                val fileName = nameRules.ruleSet.getTypeName(limeElement.path.container)
                val conversionImport = (limeElement as? LimeStruct)?.let {
                    val conversionFileName = nameResolver.resolveName(limeElement)
                    createConversionImport("$filePath/$conversionFileName")
                }
                listOfNotNull(DartImport("$filePath/$fileName"), conversionImport)
            }
            else -> emptyList()
        }

    private fun resolveBasicTypeImports(limeType: LimeBasicType) =
        when (limeType.typeId) {
            LimeBasicType.TypeId.BOOLEAN -> listOf(createConversionImport("Boolean"))
            LimeBasicType.TypeId.STRING -> listOf(createConversionImport("String"))
            LimeBasicType.TypeId.BLOB -> listOf(createConversionImport("List"))
            LimeBasicType.TypeId.DATE -> listOf(createConversionImport("DateTime"))
            else -> emptyList()
        }

    companion object {
        private const val CONVERSION_SUFFIX = "__conversion"
        private fun createConversionImport(filePath: String) =
            DartImport(filePath + CONVERSION_SUFFIX)
    }
}
