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

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

internal class DartMangledNameResolver(
    private val regularNameResolver: DartNameResolver
) : NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeTypeRef -> resolveName(element.type)
            is LimeTypeAlias -> resolveName(element.actualType)
            is LimeType -> {
                val mangledName = mangleName(regularNameResolver.resolveName(element))
                (element.path.head + mangledName).joinToString("_")
            }
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun mangleName(name: String) =
        name.replace(" ", "")
            .replace("_", "_1")
            .replace("<", "Of_")
            .replace(",", "_")
            .replace(">", "")
}
