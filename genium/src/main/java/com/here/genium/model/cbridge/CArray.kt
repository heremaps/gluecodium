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

package com.here.genium.model.cbridge

import com.here.genium.generator.cbridge.CppArrayTypeInfo
import com.here.genium.generator.cbridge.CppTypeInfo

class CArray(name: String, typeInfo: CppArrayTypeInfo) : CElement(name) {

    val arrayType: CppTypeInfo = typeInfo
    val underlyingType: CppTypeInfo = typeInfo.innerType
    val type = arrayType.functionReturnType.toString()
    val innerType = underlyingType.functionReturnType.toString()
    val argument = underlyingType.cType.toString()
    val innerBaseApi = underlyingType.name

    fun returnTypeIncludes() =
        getLastType(underlyingType).functionReturnType.includes + arrayType.functionReturnType.includes

    fun includes() = getLastType(underlyingType).includes + arrayType.includes

    private fun getLastType(typeInfo: CppTypeInfo): CppTypeInfo =
        if (typeInfo is CppArrayTypeInfo) getLastType(typeInfo.innerType) else typeInfo
}
