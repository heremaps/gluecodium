/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.common.modelbuilder

import com.here.genium.common.ContextBasedModelBuilder
import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.model.common.Comments
import com.here.genium.model.lime.LimeAttributeType.DEPRECATED
import com.here.genium.model.lime.LimeAttributeValueType.MESSAGE
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeAlias
import com.here.genium.model.lime.LimeValue

abstract class AbstractLimeBasedModelBuilder<E>(
    contextStack: ModelBuilderContextStack<E>
) : ContextBasedModelBuilder<E>(contextStack), LimeBasedModelBuilder {
    /**
     * Mapping of LIME full name to model full name.
     */
    val referenceMap = mutableMapOf<String, E>()

    override fun startBuilding(limeElement: LimeElement) = openContext()
    override fun startBuilding(limeContainer: LimeContainer) = openContext()
    override fun startBuilding(limeStruct: LimeStruct) = openContext()

    override fun finishBuilding(limeTypeDef: LimeTypeAlias) = closeContext()
    override fun finishBuilding(limeEnumerator: LimeEnumerator) = closeContext()
    override fun finishBuilding(limeConstant: LimeConstant) = closeContext()
    override fun finishBuilding(limeValue: LimeValue) = closeContext()
    override fun finishBuilding(limeException: LimeException) = closeContext()

    /**
     * Store a result which has a direct mapping to a lime model name. This is used to transform
     * links in comments from lime to language model. "Ambiguous" LIME references (i.e. when the
     * disambiguation suffix is omitted) are also allowed.
     */
    protected fun storeNamedResult(limeElement: LimeNamedElement, element: E) {
        storeResult(element)
        referenceMap[limeElement.fullName] = element
        val ambiguousKey = limeElement.path.withSuffix("").toString()
        referenceMap[ambiguousKey] = element
    }

    protected fun createComments(limeElement: LimeNamedElement, platform: String) =
        Comments(
            limeElement.comment.getFor(platform),
            limeElement.attributes.get(DEPRECATED, MESSAGE)
        )
}
