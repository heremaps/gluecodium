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
import com.here.gluecodium.model.common.Include
import java.util.TreeSet

/** Collection of related methods and structs forming an interface (like a C header file)  */
class CInterface(
    name: String,
    val selfType: CppTypeInfo? = null,
    val internalNamespace: List<String>,
    val structs: List<CStruct> = emptyList(),
    val inheritedFunctions: List<CFunction> = emptyList(),
    val functions: List<CFunction> = emptyList(),
    val interfaces: List<CInterface> = emptyList(),
    val functionTableName: String? = null,
    val enums: List<CEnum> = listOf(),
    val isEquatable: Boolean = false,
    val isPointerEquatable: Boolean = false,
    @Suppress("unused") val hasTypeRepository: Boolean = false
) : CElement(name) {
    // Tree sets to keep the order of includes consistent
    val headerIncludes: TreeSet<Include> = TreeSet()
    val implementationIncludes: TreeSet<Include> = TreeSet()
    val privateHeaderIncludes: TreeSet<Include> = TreeSet()

    // only interfaces have a functionTableName
    val isInterface =
        functionTableName != null && functionTableName.isNotEmpty() && selfType != null

    val hasEquatableType = isEquatable || isPointerEquatable
}
