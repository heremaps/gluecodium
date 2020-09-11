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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.model.cbridge.CFunction
import com.here.gluecodium.model.cbridge.CInterface
import com.here.gluecodium.model.cbridge.CStruct
import com.here.gluecodium.model.cbridge.CType
import com.here.gluecodium.model.common.Include
import java.nio.file.Paths

object CBridgeComponents {
    val PROXY_CACHE_FILENAME = Paths.get(
        CBridgeNameRules.CBRIDGE_INTERNAL, CBridgeNameRules.INCLUDE_DIR, "CachedProxyBase.h"
    ).toString()
    val WRAPPER_CACHE_HEADER = Paths.get(
        CBridgeNameRules.CBRIDGE_INTERNAL, CBridgeNameRules.INCLUDE_DIR, "WrapperCache.h"
    ).toString()

    fun collectImplementationIncludes(cInterface: CInterface): List<Include> {
        val functions = (cInterface.functions + cInterface.inheritedFunctions).filter { !it.isSkipped }
        return functions.flatMap { collectFunctionBodyIncludes(it) } +
            cInterface.structs.flatMap { collectImplementationIncludes(it) } +
            cInterface.enums.flatMap { it.mappedType.includes } +
            cInterface.interfaces.flatMap { collectImplementationIncludes(it) + it.implementationIncludes } +
            (cInterface.selfType?.includes ?: emptyList())
    }

    private fun collectImplementationIncludes(cStruct: CStruct): List<Include> =
        cStruct.mappedType.includes + cStruct.fields.flatMap { it.type.includes } +
            cStruct.methods.flatMap { collectFunctionBodyIncludes(it) } +
            cStruct.structs.flatMap { collectImplementationIncludes(it) } +
            cStruct.interfaces.flatMap { collectImplementationIncludes(it) }

    fun collectPrivateHeaderIncludes(cInterface: CInterface): List<Include> =
        cInterface.structs.flatMap { it.mappedType.includes } +
            cInterface.interfaces.flatMap { collectPrivateHeaderIncludes(it) } +
            (cInterface.selfType?.includes ?: emptyList())

    fun collectHeaderIncludes(cInterface: CInterface): List<Include> {
        val functions = cInterface.functions.filter { !it.isSkipped }
        val includes = functions.flatMap { collectFunctionSignatureIncludes(it) } +
            cInterface.structs.flatMap { collectHeaderIncludes(it) } + cInterface.enums.flatMap { it.includes } +
            cInterface.interfaces.flatMap { collectHeaderIncludes(it) }

        return when {
            cInterface.hasEquatableType || functions.any { it.error != null } -> includes + CType.BOOL_INCLUDE
            else -> includes
        }
    }

    private fun collectHeaderIncludes(cStruct: CStruct): List<Include> =
        cStruct.fields.flatMap { it.type.functionReturnType.includes + it.type.cType.includes } +
            cStruct.methods.flatMap { collectFunctionSignatureIncludes(it) } +
            cStruct.structs.flatMap { collectHeaderIncludes(it) } +
            cStruct.interfaces.flatMap { collectHeaderIncludes(it) }

    private fun collectFunctionSignatureIncludes(function: CFunction) =
        function.parameters.flatMap { it.signatureIncludes } + function.returnType.functionReturnType.includes +
            (function.error?.functionReturnType?.includes ?: emptyList())

    private fun collectFunctionBodyIncludes(function: CFunction) =
        function.parameters.flatMap { it.mappedType.includes } + function.returnType.includes +
            function.delegateCallIncludes + (function.selfParameter?.mappedType?.includes ?: emptyList()) +
            (function.error?.includes ?: emptyList())
}
