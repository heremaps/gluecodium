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

package com.here.gluecodium.model.lime

import com.here.gluecodium.common.CaseInsensitiveMap

enum class LimeAttributeType(
    private val tag: String,
    val defaultValueType: LimeAttributeValueType? = null
) {
    CPP("Cpp", LimeAttributeValueType.NAME),
    JAVA("Java", LimeAttributeValueType.NAME),
    SWIFT("Swift", LimeAttributeValueType.NAME),
    DART("Dart", LimeAttributeValueType.NAME),
    ASYNC("Async"),
    CACHED("Cached"),
    DEPRECATED("Deprecated", LimeAttributeValueType.MESSAGE),
    ENABLE_IF("EnableIf", LimeAttributeValueType.TAG),
    EQUATABLE("Equatable"),
    IMMUTABLE("Immutable"),
    INTERNAL("Internal"),
    NO_CACHE("NoCache"),
    OPTIMIZED("Optimized"),
    OVERLOADED("Overloaded"),
    SERIALIZABLE("Serializable"),
    SKIP("Skip", LimeAttributeValueType.TAG);

    override fun toString() = tag

    companion object {
        val fromString = values().associateByTo(CaseInsensitiveMap()) { it.tag }
    }
}
