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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement

internal class KotlinSyntheticResolver(
    private val referenceMap: Map<String, LimeElement>,
    private val predicate: KotlinInternalVisibilityPredicate = KotlinInternalVisibilityPredicate(referenceMap),
) : NameResolver {
    override fun resolveName(element: Any): String {
        if (element !is LimeNamedElement) {
            throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

        return when {
            predicate.isConceptuallyInternal(element) -> "@JvmSynthetic "
            else -> ""
        }
    }
}
