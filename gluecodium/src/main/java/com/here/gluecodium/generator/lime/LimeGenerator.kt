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

package com.here.gluecodium.generator.lime

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
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

class LimeGenerator : Generator {

    override val shortName = GENERATOR_NAME

    override val needsUnfilteredModel = true

    override fun generate(limeModel: LimeModel) = limeModel.topElements.map { generate(it) }

    private fun generate(rootElement: LimeNamedElement): GeneratedFile {
        val imports =
            collectImports(rootElement.path.parent, rootElement)
                .toSet()
                .map { escapeImport(it) }
        val content = TemplateEngine.render(
            "lime/LimeFile",
            mapOf(
                "imports" to imports,
                "model" to rootElement,
                "template" to selectTemplate(rootElement)
            )
        )
        val packagePath = rootElement.path.head.joinToString(separator = "/")
        val fileName = "$GENERATOR_NAME/$packagePath/${rootElement.name}.lime"
        return GeneratedFile(content, fileName)
    }

    private fun collectImports(context: LimePath, limeElement: LimeElement): List<LimePath> =
        when (limeElement) {
            is LimeContainerWithInheritance -> (
                    limeElement.structs + limeElement.constants + limeElement.typeAliases +
                    limeElement.functions + limeElement.properties + limeElement.exceptions +
                    limeElement.classes + limeElement.interfaces + listOfNotNull(limeElement.parent)
                ).flatMap { collectImports(limeElement.path, it) }
            is LimeTypesCollection -> (
                    limeElement.structs + limeElement.constants + limeElement.typeAliases +
                    limeElement.exceptions
                ).flatMap { collectImports(limeElement.path, it) }
            is LimeStruct -> (
                    limeElement.fields + limeElement.constants + limeElement.functions
                ).flatMap { collectImports(limeElement.path, it) }
            is LimeFunction -> (
                    limeElement.parameters + limeElement.returnType +
                    listOfNotNull(limeElement.thrownType?.typeRef)
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
                    limeType is LimeMap -> collectImports(context, limeType.keyType) +
                            collectImports(context, limeType.valueType)
                    elementPath == LimePath.EMPTY_PATH -> emptyList()
                    (context.allParents + context).contains(elementPath.parent) -> emptyList()
                    else -> listOf(elementPath)
                }
            }
            else -> emptyList()
        }

    private fun selectTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeClass -> "lime/LimeClass"
            is LimeInterface -> "lime/LimeInterface"
            is LimeTypesCollection -> "lime/LimeTypesCollection"
            is LimeStruct -> "lime/LimeStruct"
            is LimeEnumeration -> "lime/LimeEnumeration"
            is LimeTypeAlias -> "lime/LimeTypeAlias"
            is LimeException -> "lime/LimeException"
            is LimeLambda -> "lime/LimeLambda"
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " +
                    limeElement::class.java.name)
        }

    private fun escapeImport(import: LimePath) =
        (import.head + import.tail).joinToString(".") { LimeTypeHelper.escapeIdentifier(it) }

    companion object {
        private const val GENERATOR_NAME = "lime"
    }
}
