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

package com.here.genium.generator.common

class NameRuleSet(
    val getFieldName: (name: String) -> String,
    val getParameterName: (name: String) -> String,
    val getConstantName: (name: String) -> String,
    val getEnumeratorName: (name: String) -> String,
    val getMethodName: (name: String, selector: String?) -> String,
    val getTypeName: (name: String) -> String,
    val getPropertyName: (String, Boolean) -> String = ignore2(::illegal),
    val getSetterName: (name: String) -> String = ::illegal,
    val getGetterName: (name: String, Boolean) -> String = ignore2(::illegal)
) {
    companion object {

        @Suppress("UNUSED_PARAMETER")
        fun illegal(name: String): String {
            throw IllegalArgumentException()
        }

        fun ignore2(fn: (String) -> String) = { name: String, _: Any? -> fn(name) }
    }
}
