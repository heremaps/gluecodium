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

package com.here.genium.generator.cbridge

import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include

class CppMapTypeInfo(
    name: String,
    cType: CType,
    functionReturnType: CType,
    includes: List<Include>,
    keyType: CppTypeInfo,
    valueType: CppTypeInfo,
    enumHashType: String?
) : CppTypeInfo(name, cType, functionReturnType, CppTypeInfo.TypeCategory.MAP, includes) {

    val baseApi = createBaseApiTypeString(keyType, valueType, enumHashType)

    companion object {
        private fun createBaseApiTypeString(
            keyType: CppTypeInfo,
            valueType: CppTypeInfo,
            enumHashType: String?
        ): String {

            val stringBuilder = StringBuilder()
            stringBuilder
                .append("std::unordered_map<")
                .append(keyType.name)
                .append(", ")
                .append(valueType.name)
            if (enumHashType != null) {
                stringBuilder.append(", ").append(enumHashType)
            }
            stringBuilder.append('>')

            return stringBuilder.toString()
        }
    }
}
