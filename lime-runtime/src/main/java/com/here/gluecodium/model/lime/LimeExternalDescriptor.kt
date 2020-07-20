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

package com.here.gluecodium.model.lime

import com.here.gluecodium.common.CaseInsensitiveMap

class LimeExternalDescriptor private constructor(
    private val descriptors: Map<String, Map<String, String>>
) {
    val cpp
        get() = descriptors[CPP_TAG]
    val java
        get() = descriptors[JAVA_TAG]
    val swift
        get() = descriptors[SWIFT_TAG]
    val dart
        get() = descriptors[DART_TAG]

    operator fun plus(other: LimeExternalDescriptor) =
        LimeExternalDescriptor(descriptors + other.descriptors)

    override fun toString() =
        descriptors.entries.flatMap { entry ->
            entry.value.map { "${entry.key} ${it.key} \"${it.value}\"" }
        }.sorted().joinToString("\n")

    class Builder {
        private val descriptors = CaseInsensitiveMap<CaseInsensitiveMap<String>>()

        fun addValue(tag: String, name: String, value: String): Builder {
            descriptors.getOrPut(tag, { CaseInsensitiveMap() })[name] = value
            return this
        }

        fun build() = LimeExternalDescriptor(descriptors)
    }

    companion object {
        const val CPP_TAG = "cpp"
        const val JAVA_TAG = "java"
        const val SWIFT_TAG = "swift"
        const val DART_TAG = "dart"

        const val INCLUDE_NAME = "include"
        const val FRAMEWORK_NAME = "framework"
        const val IMPORT_PATH_NAME = "importPath"
        const val NAME_NAME = "name"
        const val GETTER_NAME_NAME = "getterName"
        const val SETTER_NAME_NAME = "setterName"
    }
}
