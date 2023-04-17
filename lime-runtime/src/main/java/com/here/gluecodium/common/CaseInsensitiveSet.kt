/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

class CaseInsensitiveSet(elements: Collection<String> = emptySet()) :
    HashSet<String>(elements.map { it.lowercase(Locale.getDefault()) }) {

    override fun add(element: String) = super.add(element.lowercase(Locale.getDefault()))

    override fun addAll(elements: Collection<String>) = super.addAll(elements.map { it.lowercase(Locale.getDefault()) })

    override fun remove(element: String) = super.remove(element.lowercase(Locale.getDefault()))

    override fun removeAll(elements: Collection<String>) = super.removeAll(elements.map { it.lowercase(Locale.getDefault()) }.toSet())

    override fun retainAll(elements: Collection<String>) = super.retainAll(elements.map { it.lowercase(Locale.getDefault()) }.toSet())

    override fun contains(element: String) = super.contains(element.lowercase(Locale.getDefault()))

    override fun containsAll(elements: Collection<String>) = super.containsAll(elements.map { it.lowercase(Locale.getDefault()) })
}
