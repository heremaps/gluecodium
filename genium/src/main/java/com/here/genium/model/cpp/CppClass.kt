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

package com.here.genium.model.cpp

import com.here.genium.generator.cpp.TopologicalSort
import com.here.genium.model.common.Comments
import com.here.genium.model.common.Include

class CppClass(
    name: String,
    fullyQualifiedName: String,
    includes: List<Include> = emptyList(),
    comment: Comments = Comments(),
    isExternal: Boolean = false,
    val members: List<CppElement> = emptyList(),
    val methods: List<CppMethod> = emptyList(),
    val inheritances: List<CppInheritance> = emptyList(),
    val isEquatable: Boolean = false,
    @Suppress("unused") val isInheritable: Boolean = false
) : CppExternableElement(name, fullyQualifiedName, includes, comment, isExternal) {

    @Suppress("unused")
    val sortedMembers
        get() = TopologicalSort(members).sort()

    override fun stream() = methods + members + inheritances
}
