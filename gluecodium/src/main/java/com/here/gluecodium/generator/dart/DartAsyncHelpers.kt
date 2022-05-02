/*
 * Copyright (C) 2016-2022 HERE Europe B.V.
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

import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeVisibility

internal object DartAsyncHelpers {
    class AsyncHelpersGroup(
        val pathKey: String,
        val lambdas: List<LimeLambda>,
        val helpers: Map<String, LimeFunction>
    )

    private const val COMPLETER_LAMBDA = "__completerLambda"
    private const val ASYNC_FUNCTION = "__async"

    fun createAsyncHelpers(rootElement: LimeNamedElement, dartNameResolver: DartNameResolver) =
        LimeTypeHelper.getAllTypes(rootElement)
            .filterIsInstance<LimeContainer>()
            .map { createAsyncHelpersGroup(it, dartNameResolver) }

    private fun createAsyncHelpersGroup(
        limeContainer: LimeContainer,
        dartNameResolver: DartNameResolver
    ): AsyncHelpersGroup {
        val lambdas = mutableListOf<LimeLambda>()
        val helpers = mutableMapOf<String, LimeFunction>()

        val asyncFunctions = limeContainer.functions.filter { it.attributes.have(ASYNC) }
        for (limeFunction in asyncFunctions) {
            val functionName = dartNameResolver.resolveName(limeFunction)
            val asyncLambda = createAsyncLambda(limeFunction, functionName).also { lambdas += it }
            helpers[limeFunction.fullName] = createAsyncHelper(limeFunction, functionName, asyncLambda)
        }

        return AsyncHelpersGroup(limeContainer.fullName, lambdas, helpers)
    }

    private fun createAsyncLambda(limeFunction: LimeFunction, functionName: String): LimeLambda {
        val limeException = limeFunction.exception
        val parameters = when {
            limeException != null -> listOf(LimeLambdaParameter(LimeBasicTypeRef(LimeBasicType.TypeId.BOOLEAN)))
            else -> emptyList()
        } + when {
            !limeFunction.returnType.isVoid -> listOf(LimeLambdaParameter(limeFunction.returnType.typeRef))
            else -> emptyList()
        } + when {
            limeException != null -> listOf(LimeLambdaParameter(limeException.errorType))
            else -> emptyList()
        }

        return LimeLambda(
            limeFunction.path.parent.child(limeFunction.name + COMPLETER_LAMBDA, limeFunction.path.disambiguator),
            LimeVisibility.INTERNAL,
            attributes = LimeAttributes.Builder().addAttribute(DART, NAME, functionName + COMPLETER_LAMBDA).build(),
            parameters = parameters
        )
    }

    private fun createAsyncHelper(limeFunction: LimeFunction, functionName: String, asyncLambda: LimeLambda): LimeFunction {
        val path = limeFunction.path.withSuffix(limeFunction.path.disambiguator + "async")
        val lambdaParameter = LimeParameter(
            path.child("_completerLambda"),
            typeRef = LimeDirectTypeRef(asyncLambda),
            attributes = LimeAttributes.Builder().addAttribute(DART, NAME, "_completerLambda").build(),
        )
        return LimeFunction(
            path,
            attributes = LimeAttributes.Builder().addAttribute(DART, NAME, "_$functionName$ASYNC_FUNCTION").build(),
            parameters = listOf(lambdaParameter) + limeFunction.parameters,
            isStatic = limeFunction.isStatic
        )
    }
}
