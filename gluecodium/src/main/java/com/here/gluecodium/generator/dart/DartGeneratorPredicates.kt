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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.IMMUTABLE
import com.here.gluecodium.model.lime.LimeAttributeValueType.POSITIONAL_DEFAULTS
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in Dart generator.
 */
internal class DartGeneratorPredicates(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val activeTags: Set<String>,
    dartNameResolver: DartNameResolver? = null
) {
    val predicates = mapOf(
        "allFieldsCtorIsPublic" to { limeStruct: Any ->
            limeStruct is LimeStruct && allFieldsCtorIsPublic(limeStruct)
        },
        "hasAnyComment" to { CommonGeneratorPredicates.hasAnyComment(it, "Dart") },
        "hasImmutableFields" to { CommonGeneratorPredicates.hasImmutableFields(it) },
        "hasSingleConstructor" to { limeContainer: Any ->
            when (limeContainer) {
                !is LimeContainer -> false
                is LimeStruct -> limeContainer.constructors.size + limeContainer.fieldConstructors.size == 1
                else -> limeContainer.constructors.size == 1
            }
        },
        "hasStaticFunctions" to { CommonGeneratorPredicates.hasStaticFunctions(it) },
        "needsAliasPrefix" to { limeType: Any ->
            when {
                limeType !is LimeType -> false
                dartNameResolver == null -> false
                else -> dartNameResolver.typesWithDuplicateNames.contains(limeType.fullName)
            }
        },
        "skipDeclaration" to { limeType: Any ->
            limeType is LimeType && limeType.external?.dart != null &&
                limeType.external?.dart?.get(LimeExternalDescriptor.CONVERTER_NAME) == null
        },
        "shouldRetain" to { limeElement: Any ->
            limeElement is LimeNamedElement && shouldRetain(limeElement)
        }
    )

    fun shouldRetain(limeElement: LimeNamedElement) =
        LimeModelSkipPredicates.shouldRetainCheckParent(limeElement, activeTags, DART, limeReferenceMap)

    companion object {
        fun allFieldsCtorIsPublic(limeStruct: LimeStruct) =
            when {
                limeStruct.constructors.isNotEmpty() -> false
                limeStruct.attributes.have(DART, POSITIONAL_DEFAULTS) -> false
                limeStruct.external?.dart?.get(LimeExternalDescriptor.CONVERTER_NAME) != null -> true
                limeStruct.attributes.have(IMMUTABLE) -> limeStruct.allFieldsConstructor == null
                limeStruct.fieldConstructors.isEmpty() -> limeStruct.initializedFields.isEmpty()
                else -> false
            }
    }
}
