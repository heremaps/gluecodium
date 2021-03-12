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

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef

internal class DartImportsCollector(private val importResolver: DartImportResolver) : ImportsCollector<DartImport> {

    override fun collectImports(limeElement: LimeNamedElement): List<DartImport> {
        val allTypes = LimeTypeHelper.getAllTypes(limeElement).filterNot { it is LimeTypeAlias }
        val parentTypeRefs = listOfNotNull((limeElement as? LimeContainerWithInheritance)?.parent)
        return (collectTypeRefs(allTypes) + parentTypeRefs).flatMap { importResolver.resolveElementImports(it) }
    }

    private fun collectTypeRefs(allTypes: List<LimeType>): List<LimeTypeRef> {
        val classes = allTypes.filterIsInstance<LimeContainerWithInheritance>()
        val functions = allTypes.filterIsInstance<LimeContainer>().flatMap { it.functions } +
            classes.flatMap { it.inheritedFunctions }
        val properties = classes.flatMap { it.properties + it.inheritedProperties }
        val lambdas = allTypes.filterIsInstance<LimeLambda>()
        val exceptions = allTypes.filterIsInstance<LimeException>()
        val structs = allTypes.filterIsInstance<LimeStruct>()
        return structs.flatMap { it.fields + it.constants }.map { it.typeRef } +
            functions.flatMap { collectTypeRefs(it) } + properties.map { it.typeRef } +
            lambdas.flatMap { collectTypeRefs(it.asFunction()) } +
            exceptions.map { it.errorType }
    }

    private fun collectTypeRefs(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } +
            limeFunction.returnType.typeRef +
            listOfNotNull(limeFunction.thrownType?.typeRef, limeFunction.exception?.errorType)
}
