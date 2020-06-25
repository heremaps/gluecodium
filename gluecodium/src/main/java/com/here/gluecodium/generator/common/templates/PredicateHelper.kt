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
 * ifPredicate: Evaluate the (pre-registered) unary predicate with a given name on the given element
 * and execute the section if it evaluates to `true`. If the element is omitted, `this` is taken
 * instead.<br/>
 * Usage: {{#ifPredicate \[element\] "predicateName"}}...{{/ifPredicate}}<br/>
 * Example: {{#ifPredicate "fooPredicate"}}...{{/ifPredicate}}<br/>
 * Example: {{#ifPredicate type "fooPredicate"}}...{{/ifPredicate}}<br/>
 * unlessPredicate: same as above, except the the section is executed only if the predicate
 * evaluates to `false`.
 */
internal class PredicateHelper(private val equality: Boolean) : BasicSectionHelper() {
    val predicates = mutableMapOf<String, (Any) -> Boolean>()

    override fun execute(options: Options) {
        val element: Any
        val predicateName: String
        when (val firstParameter = options.parameters.firstOrNull()) {
            is String -> {
                element = options.peek() ?: return
                predicateName = firstParameter
            }
            else -> {
                element = firstParameter ?: return
                predicateName = options.parameters.getOrNull(1)?.toString() ?: return
            }
        }

        val predicate = predicates[predicateName] ?: return
        if (predicate(element) == equality) {
            options.fn()
        }
    }
}
