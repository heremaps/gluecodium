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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.generator.cpp.CppFullNameResolver
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class CBridgeCppNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val cppFullNameResolver: CppFullNameResolver,
    private val cppShortNameResolver: CppNameResolver
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeTypeRef -> resolveTypeRefName(element)
            is LimeBasicType, is LimeGenericType -> cppShortNameResolver.resolveName(element)
            is LimeType -> cppFullNameResolver.resolveName(element)
            is LimeFunction -> resolveFunctionName(element)
            else -> cppShortNameResolver.resolveName(element)
        }

    private fun resolveFunctionName(limeFunction: LimeFunction): String {
        val parentElement = getParentElement(limeFunction)
        return when {
            parentElement is LimeLambda -> "operator()"
            parentElement !is LimeProperty -> cppShortNameResolver.resolveName(limeFunction)
            limeFunction === parentElement.setter -> cppShortNameResolver.resolveSetterName(parentElement)
            else -> cppShortNameResolver.resolveGetterName(parentElement)
        }!!
    }

    override fun resolveGetterName(element: Any) = cppShortNameResolver.resolveGetterName(element)

    override fun resolveSetterName(element: Any) = cppShortNameResolver.resolveSetterName(element)

    override fun resolveReferenceName(element: Any) =
        when (element) {
            is LimeType -> cppShortNameResolver.resolveName(LimeDirectTypeRef(element))
            is LimeTypeRef -> resolveTypeRefName(element)
            else -> null
        }

    private fun resolveTypeRefName(limeTypeRef: LimeTypeRef) =
        cppShortNameResolver.resolveName(
            LimeDirectTypeRef(
                limeTypeRef.type.actualType,
                isNullable = limeTypeRef.isNullable
            )
        )
}
