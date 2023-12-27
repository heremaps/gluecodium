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
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction

internal class FfiCppReturnTypeNameResolver(
    private val internalNamespace: List<String>,
    private val ffiCppNameResolver: FfiCppNameResolver,
) : NameResolver {
    override fun resolveName(element: Any): String =
        when (element) {
            is LimeFunction -> resolveReturnTypeName(element)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveReturnTypeName(limeFunction: LimeFunction): String {
        val returnTypeName = ffiCppNameResolver.resolveName(limeFunction.returnType.typeRef)
        val exceptionPayload = limeFunction.exception?.errorType?.type ?: return returnTypeName

        val returnPrefix = (internalNamespace + "Return").joinToString("::")
        if (exceptionPayload.actualType !is LimeEnumeration) {
            return "$returnPrefix<$returnTypeName, ${ffiCppNameResolver.resolveName(exceptionPayload)}>"
        }

        return if (limeFunction.returnType.isVoid) {
            STD_ERROR_CODE
        } else {
            "$returnPrefix<$returnTypeName, $STD_ERROR_CODE>"
        }
    }

    companion object {
        private const val STD_ERROR_CODE = "std::error_code"
    }
}
