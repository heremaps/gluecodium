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

package com.here.gluecodium.generator.common.templates

import org.trimou.handlebars.BasicSectionHelper
import org.trimou.handlebars.Options

/**
 * Section helper that concatenates the given collections and sorts the combined collection with the
 * given sorter (or the default sorter is none is specified). The section is then applied
 * sequentially to each element of the sorted combined collection, in order.<br/>
 * Usage: {{#sort collection1 \[collection2 ...\] \[sorter="sorterName"\]}}...{{/sort}}<br/>
 * Example: {{#sort classes structs}}...{{/sort}}
 * Example: {{#sort events sorter="sortByDate"}}...{{/sort}}
 */
internal class SortHelper : BasicSectionHelper() {
    val sorters = mutableMapOf<String, (List<Any>) -> List<Any>>()

    override fun execute(options: Options) {
        val sorterName = options.hash[SORTER]?.let { convertValue(it) } ?: ""
        val sorter = sorters[sorterName] ?: return
        val collection =
            options.parameters.mapNotNull { it as? List<*> }.flatten().filterNotNull()

        for (element in sorter(collection)) {
            options.push(element)
            options.fn()
            options.pop()
        }
    }

    companion object {
        private const val SORTER = "sorter"
    }
}
