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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypedElement

internal class JniIncludeResolver(private val fileNameRules: JniFileNameRules) : ImportsResolver<Include> {

    override fun resolveElementImports(limeElement: LimeElement): List<Include> =
        when (limeElement) {
            is LimeTypeRef -> resolveElementImports(limeElement.type.actualType)
            is LimeTypedElement -> resolveElementImports(limeElement.typeRef)
            !is LimeType -> emptyList()
            is LimeList -> resolveElementImports(limeElement.elementType)
            is LimeSet -> resolveElementImports(limeElement.elementType)
            is LimeMap -> resolveElementImports(limeElement.keyType) + resolveElementImports(limeElement.valueType)
            is LimeStruct, is LimeEnumeration, is LimeContainerWithInheritance, is LimeLambda ->
                listOf(createConversionInclude(limeElement))
            else -> emptyList()
        }

    private fun createConversionInclude(limeType: LimeType): Include {
        val fileName = fileNameRules.getConversionFileName(limeType)
        return Include.createInternalInclude("$fileName.h")
    }

    companion object {
        val exceptionThrowerInclude = Include.createInternalInclude("JniExceptionThrower.h")
    }
}
