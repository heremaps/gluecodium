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

class LimeAsyncCallback(
    val path: LimePath,
    val attributes: LimeAttributes?,
    val parameters: List<LimeParameter>,
) {
    private val errorFieldName: String
        get() =
            attributes?.get(LimeAttributeType.ASYNC_CALLBACK_METADATA, LimeAttributeValueType.ERROR_FIELD)
                ?: throw IllegalStateException("$path: async callback must have 'ErrorField' specified")

    val errorField: LimeParameter
        get() =
            parameters.find { it.name == errorFieldName }
                ?: throw IllegalStateException("$path: no parameter named '$errorFieldName'")

    val resultFields: List<LimeParameter>
        get() = parameters.filter { it.name != errorFieldName }
}
