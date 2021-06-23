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

package com.here.gluecodium.generator.ffi

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.generator.cpp.CppNameCache
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeProperty

internal class FfiCppNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    nameRules: CppNameRules,
    rootNamespace: List<String>,
    internalNamespace: List<String>
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    private val cppNameCache = CppNameCache(rootNamespace, limeReferenceMap, nameRules)
    private val cppNameResolver = CppNameResolver(
        limeReferenceMap,
        internalNamespace,
        cppNameCache,
        forceFullNames = true,
        forceFollowThrough = true
    )

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeField -> resolveFieldName(element)
            is LimeFunction -> resolveFunctionName(element)
            else -> cleanUpName(cppNameResolver.resolveName(element))
        }

    override fun resolveGetterName(element: Any) = cppNameResolver.resolveGetterName(element)

    override fun resolveSetterName(element: Any) = cppNameResolver.resolveSetterName(element)

    private fun cleanUpName(cppName: String) =
        cppName.trimStart(':').replace(" ::", " ").replace("< ", "<").replace(" >", ">").replace("<::", "<")

    private fun resolveFieldName(limeField: LimeField) =
        cppNameResolver.resolveGetterName(limeField)?.let { "$it()" } ?: cppNameResolver.resolveName(limeField)

    private fun resolveFunctionName(limeFunction: LimeFunction): String {
        val parentElement = getParentElement(limeFunction)
        return when {
            parentElement is LimeLambda -> "operator()"
            parentElement !is LimeProperty -> cppNameCache.getName(limeFunction)
            limeFunction === parentElement.getter -> cppNameCache.getGetterName(parentElement)
            limeFunction === parentElement.setter -> cppNameCache.getSetterName(parentElement)
            else -> throw GluecodiumExecutionException("Invalid property accessor ${limeFunction.path}")
        }
    }
}
