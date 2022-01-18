/*
 * Copyright (C) 2016-2022 HERE Europe B.V.
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
 * Section helper that concatenates the given collections and filters the combined collection with the
 * given predicate. The section is then applied to the filtered combined collection as a whole.<br/>
 * Usage: {{#filter collection1 collection2 ... \[predicate="predicateName"\]}}...{{/filter}}<br/>
 * Example: {{#filter fields predicate="shouldRetain"}}...{{/filter}}
 */
internal class FilterHelper(private val predicates: Map<String, (Any) -> Boolean>) : BasicSectionHelper() {
    override fun execute(options: Options) {
        val predicateName = options.hash[PREDICATE]?.let { convertValue(it) } ?: return
        val predicate = predicates[predicateName] ?: return
        val collection = options.parameters.mapNotNull { it as? List<*> }.flatten().filterNotNull().filter(predicate)

        options.push(collection)
        options.fn()
        options.pop()
    }

    companion object {
        private const val PREDICATE = "predicate"
    }
}
