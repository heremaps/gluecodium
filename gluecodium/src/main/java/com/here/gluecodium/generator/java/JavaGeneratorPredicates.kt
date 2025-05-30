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
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in Java generator.
 */
internal object JavaGeneratorPredicates {
    val predicates =
        mapOf(
            "hasAnyComment" to { CommonGeneratorPredicates.hasAnyComment(it, "Java") },
            "hasInternalAllArgsConstructor" to { limeStruct: Any ->
                limeStruct is LimeStruct && limeStruct.fields.any { CommonGeneratorPredicates.isInternal(it, JAVA) }
            },
            "hasInternalFreeArgsConstructor" to { limeStruct: Any ->
                limeStruct is LimeStruct &&
                    limeStruct.uninitializedFields.any { CommonGeneratorPredicates.isInternal(it, JAVA) }
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
            "isExceptionSameForCtorAndHookFun" to { constructor: Any ->
                when (constructor) {
                    is LimeFunction -> CommonGeneratorPredicates.isExceptionSameForCtorAndHookFun(constructor)
                    else -> false
                }
            },
            "needsAllFieldsConstructor" to { limeStruct: Any ->
                when {
                    limeStruct !is LimeStruct -> false
                    limeStruct.external?.java?.get(LimeExternalDescriptor.CONVERTER_NAME) != null -> true
                    limeStruct.attributes.have(JAVA, LimeAttributeValueType.POSITIONAL_DEFAULTS) -> false
                    limeStruct.attributes.have(LimeAttributeType.IMMUTABLE) -> limeStruct.allFieldsConstructor == null
                    limeStruct.fieldConstructors.isEmpty() -> limeStruct.initializedFields.isEmpty()
                    else -> false
                }
            },
            "needsDisposer" to { limeClass: Any ->
                limeClass is LimeClass && limeClass.parentClass == null
            },
            "needsNonNullAnnotation" to { limeTypeRef ->
                limeTypeRef is LimeTypeRef && !limeTypeRef.isNullable &&
                    JavaImportResolver.needsNonNullAnnotation(limeTypeRef.type.actualType)
            },
        )
}
