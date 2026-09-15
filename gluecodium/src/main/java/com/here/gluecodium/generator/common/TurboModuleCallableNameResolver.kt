/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.common

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeFunction

/**
 * Shared effective-name resolution for callables emitted by the React Native / TypeScript
 * generators.
 *
 * React Native's TurboModule codegen (and the idiomatic TypeScript wrapper) cannot express method
 * overloading: two callables that share a leaf name would collapse to a single method, silently
 * dropping the second overload. LIME already disambiguates such overloads through the existing
 * `@Dart(Name)` annotation, which both Dart and React Native need for the same reason.
 *
 * This resolver produces ONE effective name per callable and is consumed identically by all three
 * emission layers — the C++ JSI bridge, the TurboModule TypeScript spec, and the idiomatic
 * TypeScript wrapper — so a method can never exist in only one layer.
 *
 * Resolution order (mirrors design §1.1 "Shared callable-name resolution"):
 *  1. the platform base name (camelCase of the LIME leaf name); if unused, reserve and return it,
 *  2. otherwise the `@Dart(Name)` alternate name (camelCased); if it exists and is unused, reserve
 *     and return it,
 *  3. otherwise report a deterministic collision and return `null` so the caller OMITS the callable
 *     rather than silently overwriting an earlier one.
 *
 * The resolver is product-neutral: it hard-codes no product identifiers and derives every name from
 * the LIME model.
 */
object TurboModuleCallableNameResolver {
    /**
     * Resolves the effective name for [callable] against the already-[occupiedNames] set.
     *
     * On success the returned name is added to [occupiedNames] (the name is reserved). On an
     * unresolvable collision this returns `null` and reserves nothing; the caller must skip the
     * callable. A [collisionReporter], when supplied, receives a deterministic human-readable
     * description of the collision.
     */
    fun resolveEffectiveName(
        callable: LimeFunction,
        occupiedNames: MutableSet<String>,
        collisionReporter: ((String) -> Unit)? = null,
    ): String? {
        val baseName = baseName(callable)
        if (occupiedNames.add(baseName)) return baseName

        val alternateName = alternateName(callable)
        if (alternateName != null && alternateName != baseName && occupiedNames.add(alternateName)) {
            return alternateName
        }

        collisionReporter?.invoke(
            "React Native callable name collision for '${callable.path}': base name '$baseName'" +
                (if (alternateName != null) " and @Dart(Name) alternate '$alternateName'" else "") +
                " are already taken; the callable was omitted to avoid silently overwriting an " +
                "existing method. Add a unique @Dart(Name) to disambiguate the overload.",
        )
        return null
    }

    /** The platform base name: camelCase of the LIME leaf name. Constructors are always `make`. */
    fun baseName(callable: LimeFunction): String = if (callable.isConstructor) "make" else snakeToCamelCase(callable.path.name)

    /** The disambiguated alternate name from `@Dart(Name)`, camelCased, or `null` if absent. */
    private fun alternateName(callable: LimeFunction): String? =
        callable.attributes.get(LimeAttributeType.DART, LimeAttributeValueType.NAME)
            ?.let { snakeToCamelCase(it) }

    private fun snakeToCamelCase(name: String): String =
        name.split("_").mapIndexed { index, part ->
            if (index == 0) part else part.replaceFirstChar { it.uppercase() }
        }.joinToString("")
}
