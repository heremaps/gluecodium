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

import com.here.gluecodium.generator.cbridge.CppArrayTypeInfo
import com.here.gluecodium.generator.cbridge.CppTypeInfo

class CArray(name: String, typeInfo: CppArrayTypeInfo) : CCollectionType(name) {

    val arrayType: CppTypeInfo = typeInfo
    val elementType: CppTypeInfo = typeInfo.innerType
    val type = arrayType.functionReturnType.toString()
    @Suppress("unused")
    val innerType = elementType.functionReturnType.toString()
    @Suppress("unused")
    val argument = elementType.cType.toString()
    @Suppress("unused")
    val innerBaseApi = elementType.name

    override val returnTypeIncludes
        get() = getLastType(elementType).functionReturnType.includes +
                arrayType.functionReturnType.includes

    override val includes
        get() = getLastType(elementType).includes + arrayType.includes

    private fun getLastType(typeInfo: CppTypeInfo): CppTypeInfo =
        if (typeInfo is CppArrayTypeInfo) getLastType(typeInfo.innerType) else typeInfo
}
