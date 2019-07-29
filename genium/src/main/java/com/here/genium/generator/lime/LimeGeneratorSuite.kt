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

package com.here.genium.generator.lime

import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeTypedElement
import com.here.genium.platform.common.GeneratorSuite

class LimeGeneratorSuite : GeneratorSuite() {

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        return limeModel.containers.map {
            val imports = collectImports(it.path.parent, it).toSet()
            val content =
                TemplateEngine.render("lime/LimeFile", mapOf("imports" to imports, "model" to it))
            val packagePath = it.path.head.joinToString(separator = "/")
            val fileName = "$GENERATOR_NAME/$packagePath/${it.name}.lime"
            GeneratedFile(content, fileName)
        }
    }

    private fun collectMethods(limeContainer: LimeContainer) =
        limeContainer.methods + limeContainer.structs.flatMap { it.methods }

    private fun collectImports(context: LimePath, limeElement: LimeElement): List<LimePath> =
        when (limeElement) {
            is LimeContainer -> (limeElement.structs + limeElement.constants +
                    limeElement.typeDefs + limeElement.methods + limeElement.properties +
                    limeElement.exceptions).flatMap { collectImports(limeElement.path, it) } +
                    (limeElement.parent?.let { collectImports(context, it) } ?: emptyList())
            is LimeStruct -> (limeElement.fields + limeElement.constants +
                    limeElement.methods).flatMap { collectImports(limeElement.path, it) }
            is LimeMethod -> limeElement.parameters.flatMap { collectImports(context, it) } +
                    collectImports(context, limeElement.returnType) +
                    (limeElement.thrownType?.let { collectImports(context, it.typeRef) } ?: emptyList())
            is LimeTypedElement -> collectImports(context, limeElement.typeRef)
            is LimeTypeDef -> collectImports(context, limeElement.typeRef)
            is LimeReturnType -> collectImports(context, limeElement.typeRef)
            is LimeException -> collectImports(context, limeElement.errorEnum)
            is LimeTypeRef -> {
                val limeType = limeElement.type
                val elementPath = limeType.path
                when {
                    limeType is LimeArray -> collectImports(context, limeType.elementType)
                    limeType is LimeSet -> collectImports(context, limeType.elementType)
                    limeType is LimeMap -> collectImports(context, limeType.keyType) +
                            collectImports(context, limeType.valueType)
                    elementPath == LimePath.EMPTY_PATH -> emptyList()
                    (context.allParents + context).contains(elementPath.parent) ->
                        emptyList()
                    else -> listOf(elementPath)
                }
            }
            else -> emptyList()
        }

    override fun getName() = "com.here.LimeGenerator"

    companion object {
        const val GENERATOR_NAME = "lime"
    }
}
