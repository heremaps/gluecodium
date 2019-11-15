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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.common.Include

object CppLibraryIncludes {
    val INT_TYPES = Include.createSystemInclude("cstdint")
    val MAP = Include.createSystemInclude("unordered_map")
    val MEMORY = Include.createSystemInclude("memory")
    val STRING = Include.createSystemInclude("string")
    val VECTOR = Include.createSystemInclude("vector")
    val NEW = Include.createSystemInclude("new")
    val SYSTEM_ERROR = Include.createSystemInclude("system_error")
    val LIMITS = Include.createSystemInclude("limits")
    val CHRONO = Include.createSystemInclude("chrono")
    val SET = Include.createSystemInclude("unordered_set")
    val FUNCTIONAL = Include.createSystemInclude("functional")
    val TYPE_TRAITS = Include.createSystemInclude("type_traits")
}
