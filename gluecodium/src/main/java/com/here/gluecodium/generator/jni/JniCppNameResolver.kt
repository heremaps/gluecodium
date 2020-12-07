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
import com.here.gluecodium.generator.cpp.Cpp2NameResolver
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * Auxiliary name resolver for the JNI generator. Resolves C++ names, while substituting type aliases with their actual
 * types.
 */
internal class JniCppNameResolver(private val cppNameResolver: Cpp2NameResolver) : NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeReturnType -> resolveName(element.typeRef)
            is LimeTypeRef ->
                resolveElementName(LimeDirectTypeRef(element.type.actualType, isNullable = element.isNullable))
            is LimeTypeAlias -> resolveElementName(element.actualType)
            is LimeNamedElement -> resolveElementName(element)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveGetterName(element: Any) = cppNameResolver.resolveGetterName(element)
    override fun resolveSetterName(element: Any) = cppNameResolver.resolveSetterName(element)
    override fun resolveReferenceName(element: Any) = cppNameResolver.resolveReferenceName(element)

    private fun resolveElementName(element: Any) = cppNameResolver.resolveName(element)
}
