/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.model.lime

class LimeAsyncFunctionDecorator(
    val path: LimePath,
    val attributes: LimeAttributes?,
    private val asyncTaskHandleType: LimeTypeRef,
    baseFunctionParameters: List<LimeParameter> = emptyList(),
) {
    val inputParameters: List<LimeParameter> =
        baseFunctionParameters.dropLast(1)

    val asyncCallback: LimeAsyncCallback =
        (baseFunctionParameters.last().typeRef.type as? LimeLambda)?.asAsyncCallback()
            ?: throw IllegalStateException("$path: last parameter of async decorator must be async lambda")

    private val cancelFunctionName: String
        get() =
            asyncTaskHandleType.type.attributes.get(LimeAttributeType.ASYNC_TASK_HANDLE_METADATA, LimeAttributeValueType.CANCEL_FUNCTION)
                ?: throw IllegalStateException("$path: async task handle (return type) must have 'CancelFunction' specified")

    val cancelFunction: LimeFunction
        get() =
            (asyncTaskHandleType.type as? LimeContainer)?.functions?.find { it.name == cancelFunctionName }
                ?: throw IllegalStateException("$path: async task handle does not have '$cancelFunctionName()'")
}
