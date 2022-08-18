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

package com.here.gluecodium.common

import java.util.Locale
import java.util.function.BiFunction
import java.util.function.Function

class CaseInsensitiveMap<V : Any /* mark as non-nullable */> : HashMap<String, V>() {
    override fun compute(key: String, remappingFunction: BiFunction<in String, in V?, out V?>) =
        super.compute(key.lowercase(Locale.getDefault()), remappingFunction)

    override fun computeIfAbsent(key: String, mappingFunction: Function<in String, out V>) =
        super.computeIfAbsent(key.lowercase(Locale.getDefault()), mappingFunction)

    override fun computeIfPresent(
        key: String,
        remappingFunction: BiFunction<in String, in V, out V?>
    ) = super.computeIfPresent(key.lowercase(Locale.getDefault()), remappingFunction)

    override fun containsKey(key: String) = super.containsKey(key.lowercase(Locale.getDefault()))

    override fun get(key: String) = super.get(key.lowercase(Locale.getDefault()))

    override fun getOrDefault(key: String, defaultValue: V) =
        super.getOrDefault(key.lowercase(Locale.getDefault()), defaultValue)

    override fun merge(key: String, value: V, remappingFunction: BiFunction<in V, in V, out V?>) =
        super.merge(key.lowercase(Locale.getDefault()), value, remappingFunction)

    override fun put(key: String, value: V) = super.put(key.lowercase(Locale.getDefault()), value)

    override fun putAll(from: Map<out String, V>) =
        super.putAll(from.mapKeys { it.key.lowercase(Locale.getDefault()) })

    override fun putIfAbsent(key: String, value: V) = super.putIfAbsent(key.lowercase(Locale.getDefault()), value)

    override fun remove(key: String) = super.remove(key.lowercase(Locale.getDefault()))

    override fun remove(key: String, value: V) = super.remove(key.lowercase(Locale.getDefault()), value)

    override fun replace(key: String, value: V) = super.replace(key.lowercase(Locale.getDefault()), value)

    override fun replace(key: String, oldValue: V, newValue: V) =
        super.replace(key.lowercase(Locale.getDefault()), oldValue, newValue)
}
