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

package com.here.gluecodium.model.cbridge

import com.here.gluecodium.generator.cbridge.CppTypeInfo

class CStruct(
    name: String,
    val baseApiName: String,
    val mappedType: CppTypeInfo,
    val hasImmutableFields: Boolean = false,
    val fields: List<CField> = emptyList(),
    val methods: List<CFunction> = emptyList(),
    val structs: List<CStruct> = emptyList(),
    val interfaces: List<CInterface> = emptyList()
) : CType(name) {

    val type = mappedType.functionReturnType.toString()
}
