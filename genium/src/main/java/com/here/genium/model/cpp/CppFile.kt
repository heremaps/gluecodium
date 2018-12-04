/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

import com.here.genium.common.CollectionsHelper
import com.here.genium.generator.cpp.TopologicalSort
import com.here.genium.model.common.Include
import java.util.TreeSet

class CppFile @JvmOverloads constructor(
    val namespace: List<String>,
    val members: List<CppElement>,
    includes: Collection<Include>,
    forwardDeclarations: Collection<CppForwardDeclaration>,
    errorEnums: Collection<String>,
    var headerInclude: Include? = null
) {

    val includes = TreeSet(includes)
    @Suppress("unused")
    val forwardDeclarations = TreeSet(forwardDeclarations)
    @Suppress("unused")
    val errorEnums = TreeSet(errorEnums)

    @Suppress("unused")
    val sortedMembers: List<CppElement>
        get() = TopologicalSort(members).sort()

    val classes: List<CppClass>
        get() = CollectionsHelper.getAllOfType(members.toMutableList(), CppClass::class.java)
}
