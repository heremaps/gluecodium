/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.generator.dart.DartImport.ImportType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeType

internal abstract class DartImportResolverBase(
    limeReferenceMap: Map<String, LimeElement>,
    private val nameResolver: DartNameResolver,
    private val srcPath: String,
) : ReferenceMapBasedResolver(limeReferenceMap), ImportsResolver<DartImport> {
    protected fun resolveExternalImport(
        limeElement: LimeElement,
        key: String,
        useAlias: Boolean,
    ): DartImport? {
        val importPath = (limeElement as? LimeNamedElement)?.external?.dart?.get(key) ?: return null
        val components = importPath.split(':')
        val alias = if (useAlias) DartNameResolver.computeAlias(importPath) else null
        return when (components.first()) {
            "dart" -> DartImport(components.last(), importType = ImportType.SYSTEM, asAlias = alias)
            "package" -> DartImport(components.last().removeSuffix(".dart"), asAlias = alias)
            else ->
                DartImport(
                    components.last().removeSuffix(".dart"),
                    importType = ImportType.RELATIVE,
                    asAlias = alias,
                )
        }
    }

    protected fun createImport(limeElement: LimeNamedElement): DartImport {
        val filePath = limeElement.path.head.joinToString("/")
        val fileName = nameResolver.resolveFileName(getTopElement(limeElement))
        val alias =
            when {
                limeElement !is LimeType -> null
                nameResolver.typesWithDuplicateNames.contains(limeElement.fullName) ->
                    limeElement.path.head.joinToString("_")
                else -> null
            }
        return DartImport("$srcPath/$filePath/$fileName", asAlias = alias)
    }

    private fun getTopElement(limeElement: LimeNamedElement) =
        generateSequence(limeElement) {
            limeReferenceMap[it.path.parent.toString()] as? LimeNamedElement
        }.last()
}
