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

package com.here.gluecodium.generator.java

import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in Java generator.
 */
internal object JavaGeneratorPredicates {
    val predicates = mapOf(
        "hasAnyComment" to { CommonGeneratorPredicates.hasAnyComment(it, "Java") },
        "hasInternalAllArgsConstructor" to { limeStruct: Any ->
            limeStruct is LimeStruct && limeStruct.fields.any { it.visibility.isInternal }
        },
        "hasInternalFreeArgsConstructor" to { limeStruct: Any ->
            limeStruct is LimeStruct && limeStruct.uninitializedFields.any { it.visibility.isInternal }
        },
        "hasOwnEqualsAndHashCode" to { limeTypeRef ->
            when {
                limeTypeRef !is LimeTypeRef -> false
                limeTypeRef.isNullable -> true
                JavaImportResolver.needsNonNullAnnotation(limeTypeRef.type.actualType) -> true
                else -> false
            }
        },
        "hasStaticFunctions" to { limeInterface ->
            when {
                limeInterface !is LimeInterface -> false
                limeInterface.functions.any { it.isStatic } -> true
                limeInterface.properties.any { it.isStatic } -> true
                else -> false
            }
        },
        "needsAllFieldsConstructor" to { limeStruct: Any ->
            limeStruct is LimeStruct &&
                !limeStruct.attributes.have(LimeAttributeType.JAVA, LimeAttributeValueType.POSITIONAL_DEFAULTS) &&
                CommonGeneratorPredicates.needsAllFieldsConstructor(limeStruct)
        },
        "needsDisposer" to { limeClass: Any ->
            limeClass is LimeClass && limeClass.parentClass == null
        },
        "needsNonNullAnnotation" to { limeTypeRef ->
            limeTypeRef is LimeTypeRef && !limeTypeRef.isNullable &&
                JavaImportResolver.needsNonNullAnnotation(limeTypeRef.type.actualType)
        }
    )
}
