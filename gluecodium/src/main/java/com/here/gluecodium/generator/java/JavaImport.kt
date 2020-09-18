/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.java

import kotlin.math.min

internal data class JavaImport(val packageNames: List<String>, val className: String) : Comparable<JavaImport> {

    override fun compareTo(other: JavaImport): Int {
        val minimumNameCount = min(packageNames.size, other.packageNames.size)
        for (i in 0 until minimumNameCount) {
            val comparison = packageNames[i].compareTo(other.packageNames[i])
            if (comparison != 0) return comparison
        }
        val comparison = packageNames.size.compareTo(other.packageNames.size)
        return if (comparison != 0) comparison else className.compareTo(other.className)
    }
}
