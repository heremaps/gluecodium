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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

internal class SwiftActualNameResolver(private val baseNameResolver: SwiftNameResolver) : NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeTypeAlias -> resolveName(element.typeRef)
            is LimeGenericType -> resolveGenericType(element)
            is LimeType -> baseNameResolver.resolveName(element)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveTypeRef(limeTypeRef: LimeTypeRef) =
        resolveName(limeTypeRef.type) + if (limeTypeRef.isNullable) "?" else ""

    private fun resolveGenericType(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "[${resolveName(limeType.elementType)}]"
            is LimeMap -> "[${resolveName(limeType.keyType)}: ${resolveName(limeType.valueType)}]"
            is LimeSet -> "Set<${resolveName(limeType.elementType)}>"
            else -> throw GluecodiumExecutionException("Unsupported element type ${limeType.javaClass.name}")
        }
}
