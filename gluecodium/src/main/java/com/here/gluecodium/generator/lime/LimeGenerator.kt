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
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypesCollection

internal class LimeGenerator : Generator {
    private val importsCollector = LimeImportsCollector { listOf(it.path) }

    override val shortName = "lime"

    override val needsUnfilteredModel = true

    override fun generate(limeModel: LimeModel) = limeModel.topElements.map { generate(it) }

    private fun generate(rootElement: LimeNamedElement): GeneratedFile {
        val imports = importsCollector.collectImports(rootElement)
        val content = TemplateEngine.render(
            "lime/LimeFile",
            mapOf(
                "imports" to imports.distinct().sorted(),
                "model" to rootElement,
                "template" to selectTemplate(rootElement)
            )
        )
        val packagePath = rootElement.path.head.joinToString(separator = "/")
        val fileName = "lime/$packagePath/${rootElement.name}.lime"
        return GeneratedFile(content, fileName)
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
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " + limeElement::class.java.name)
        }
}
