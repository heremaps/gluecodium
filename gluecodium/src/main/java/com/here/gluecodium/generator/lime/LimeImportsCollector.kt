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

package com.here.gluecodium.generator.lime

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.LimeTypesCollection

internal class LimeImportsCollector(private val importsResolver: ImportsResolver<LimePath>) : ImportsCollector<String> {
    override fun collectImports(limeElement: LimeNamedElement) =
        collectImports(limeElement.path.parent, limeElement).map { escapeImport(it) }

    private fun collectImports(context: LimePath, limeElement: LimeElement): List<LimePath> =
        when (limeElement) {
            is LimeContainerWithInheritance -> (
                limeElement.structs + limeElement.constants + limeElement.typeAliases +
                    limeElement.functions + limeElement.properties + limeElement.exceptions +
                    limeElement.classes + limeElement.interfaces + listOfNotNull(limeElement.parent)
                ).flatMap { collectImports(limeElement.path, it) }
            is LimeTypesCollection -> (
                limeElement.structs + limeElement.constants + limeElement.typeAliases + limeElement.exceptions
                ).flatMap { collectImports(limeElement.path, it) }
            is LimeStruct -> (
                limeElement.fields + limeElement.constants + limeElement.functions + limeElement.exceptions +
                    limeElement.classes + limeElement.interfaces
                ).flatMap { collectImports(limeElement.path, it) }
            is LimeFunction -> (
                limeElement.parameters + limeElement.returnType + listOfNotNull(limeElement.thrownType?.typeRef)
                ).flatMap { collectImports(context, it) }
            is LimeTypedElement -> collectImports(context, limeElement.typeRef)
            is LimeTypeAlias -> collectImports(context, limeElement.typeRef)
            is LimeReturnType -> collectImports(context, limeElement.typeRef)
            is LimeException -> collectImports(context, limeElement.errorType)
            is LimeLambda -> (
                limeElement.parameters + limeElement.returnType.typeRef
                ).flatMap { collectImports(limeElement.path, it) }
            is LimeTypeRef -> {
                val limeType = limeElement.type
                val elementPath = limeType.path
                when {
                    limeType is LimeList -> collectImports(context, limeType.elementType)
                    limeType is LimeSet -> collectImports(context, limeType.elementType)
                    limeType is LimeMap ->
                        collectImports(context, limeType.keyType) + collectImports(context, limeType.valueType)
                    elementPath == LimePath.EMPTY_PATH -> emptyList()
                    (context.allParents + context).contains(elementPath.parent) -> emptyList()
                    else -> importsResolver.resolveElementImports(limeType)
                }
            }
            else -> emptyList()
        }

    private fun escapeImport(import: LimePath) =
        (import.head + import.tail).joinToString(".") { LimeTypeHelper.escapeIdentifier(it) }
}
