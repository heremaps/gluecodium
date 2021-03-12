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

package com.here.gluecodium.generator.ffi

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeHelper

internal class FfiCppIncludeCollector(val includeResolver: FfiCppIncludeResolver) : ImportsCollector<Include> {

    override fun collectImports(limeElement: LimeNamedElement): List<Include> {
        val allTypes = LimeTypeHelper.getAllTypes(limeElement)

        val structs = allTypes.filterIsInstance<LimeStruct>()
        val containers = allTypes.filterIsInstance<LimeContainer>()
        val functions =
            containers.flatMap { it.functions } + allTypes.filterIsInstance<LimeLambda>().map { it.asFunction() } +
                containers.flatMap { it.properties }.flatMap { listOfNotNull(it.getter, it.setter) }

        return includeResolver.resolveElementImports(limeElement) +
            functions.flatMap { collectTypeRefs(it) }.flatMap { includeResolver.resolveElementImports(it) } +
            containers.flatMap { includeResolver.resolveElementImports(it) } +
            structs.flatMap { it.fields }.map { it.typeRef }.flatMap { includeResolver.resolveElementImports(it) } +
            allTypes.filterIsInstance<LimeEnumeration>().flatMap { includeResolver.resolveElementImports(it) } +
            allTypes.filterIsInstance<LimeLambda>().flatMap { includeResolver.resolveElementImports(it) }
    }

    private fun collectTypeRefs(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } +
            limeFunction.returnType.typeRef +
            listOfNotNull(limeFunction.exception?.errorType)
}
