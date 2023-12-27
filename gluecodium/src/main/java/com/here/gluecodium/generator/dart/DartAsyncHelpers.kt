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
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeTypeHelper

internal object DartAsyncHelpers {
    class AsyncHelpersGroup(
        val pathKey: String,
        val lambdas: List<LimeLambda>,
        val helpers: Map<String, LimeFunction>,
    )

    private const val FIRST_PARAMETER_NAME = "p0"
    private const val RESULT_LAMBDA = "__resultLambda"
    private const val ERROR_LAMBDA = "__errorLambda"
    private const val ASYNC_FUNCTION = "__async"

    fun createAsyncHelpers(
        rootElement: LimeNamedElement,
        dartNameResolver: DartNameResolver,
    ) = LimeTypeHelper.getAllTypes(rootElement)
        .filterIsInstance<LimeContainer>()
        .map { createAsyncHelpersGroup(it, dartNameResolver) }

    private fun createAsyncHelpersGroup(
        limeContainer: LimeContainer,
        dartNameResolver: DartNameResolver,
    ): AsyncHelpersGroup {
        val lambdas = mutableListOf<LimeLambda>()
        val helpers = mutableMapOf<String, LimeFunction>()

        val asyncFunctions = limeContainer.functions.filter { it.attributes.have(ASYNC) }
        for (limeFunction in asyncFunctions) {
            val functionName = dartNameResolver.resolveName(limeFunction)
            val resultLambda = createResultLambda(limeFunction, functionName).also { lambdas += it }
            val errorLambda =
                limeFunction.exception
                    ?.let { createErrorLambda(limeFunction, it, functionName) }
                    ?.also { lambdas += it }
            helpers[limeFunction.fullName] = createAsyncHelper(limeFunction, functionName, resultLambda, errorLambda)
        }

        return AsyncHelpersGroup(limeContainer.fullName, lambdas, helpers)
    }

    private fun createResultLambda(
        limeFunction: LimeFunction,
        functionName: String,
    ): LimeLambda {
        val path = limeFunction.path.parent.child(limeFunction.name + RESULT_LAMBDA, limeFunction.path.disambiguator)
        return LimeLambda(
            path,
            attributes = LimeAttributes.Builder().addAttribute(DART, NAME, functionName + RESULT_LAMBDA).build(),
            parameters =
                when {
                    limeFunction.returnType.isVoid -> emptyList()
                    else ->
                        listOf(
                            LimeLambdaParameter(
                                limeFunction.returnType.typeRef,
                                path.child(FIRST_PARAMETER_NAME),
                            ),
                        )
                },
        )
    }

    private fun createErrorLambda(
        limeFunction: LimeFunction,
        limeException: LimeException,
        functionName: String,
    ): LimeLambda {
        val path = limeFunction.path.parent.child(limeFunction.name + ERROR_LAMBDA, limeFunction.path.disambiguator)
        return LimeLambda(
            path,
            attributes = LimeAttributes.Builder().addAttribute(DART, NAME, functionName + ERROR_LAMBDA).build(),
            parameters =
                listOf(
                    LimeLambdaParameter(
                        limeException.errorType,
                        path.child(FIRST_PARAMETER_NAME),
                    ),
                ),
        )
    }

    private fun createAsyncHelper(
        limeFunction: LimeFunction,
        functionName: String,
        resultLambda: LimeLambda,
        errorLambda: LimeLambda?,
    ): LimeFunction {
        val path = limeFunction.path.withSuffix(limeFunction.path.disambiguator + "async")
        val resultLambdaParameter =
            LimeParameter(
                path = path.child("_resultLambda"),
                typeRef = LimeDirectTypeRef(resultLambda),
                attributes = LimeAttributes.Builder().addAttribute(DART, NAME, "_resultLambda").build(),
            )
        val errorLambdaParameter =
            errorLambda?.let {
                LimeParameter(
                    path = path.child("_errorLambda"),
                    typeRef = LimeDirectTypeRef(errorLambda),
                    attributes = LimeAttributes.Builder().addAttribute(DART, NAME, "_errorLambda").build(),
                )
            }

        val attributes = LimeAttributes.Builder().addAttribute(DART, NAME, "_$functionName$ASYNC_FUNCTION")
        limeFunction.attributes.get(CPP, NAME)?.let { attributes.addAttribute(CPP, NAME, it) }
        return LimeFunction(
            path = path,
            attributes = attributes.build(),
            parameters = listOfNotNull(resultLambdaParameter, errorLambdaParameter) + limeFunction.parameters,
            isStatic = limeFunction.isStatic,
        )
    }
}
