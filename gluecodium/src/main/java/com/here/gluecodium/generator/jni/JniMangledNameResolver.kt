/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class JniMangledNameResolver(private val baseNameResolver: JniNameResolver) : NameResolver {

    override fun resolveName(element: Any) =
        when (element) {
            is LimeElement -> mangleName(baseNameResolver.resolveName(element))
            else -> mangleName(element.toString())
        }

    override fun resolveGetterName(element: Any) =
        baseNameResolver.resolveGetterName(element)?.let { mangleName(it) }

    override fun resolveSetterName(element: Any) =
        baseNameResolver.resolveSetterName(element)?.let { mangleName(it) }

    // Narrow usage:
    // * for intermediate types for "external" types with converters
    // * or for optimized list types
    override fun resolveReferenceName(element: Any) =
        when (element) {
            is LimeType, is LimeTypeRef -> mangleName(baseNameResolver.resolveReferenceName(element))
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    /**
     * JNI name mangling. See
     * https://docs.oracle.com/javase/7/docs/technotes/guides/jni/spec/design.html#wp641
     */
    private fun mangleName(name: String) =
        name.replace("_", "_1").replace(";", "_2").replace("[", "_3").replace("$", "_00024")
            .replace('.', '/').replace('/', '_')
}
