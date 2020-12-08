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

package com.here.gluecodium.generator.common

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeSignatureResolver

internal open class PlatformSignatureResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val platformAttributeType: LimeAttributeType,
    private val nameRules: NameRules
) : LimeSignatureResolver(limeReferenceMap) {

    override fun getAllContainerFunctions(limeContainer: LimeContainer) =
        limeContainer.functions.filterNot { it.attributes.have(platformAttributeType, LimeAttributeValueType.SKIP) }

    override fun getFunctionName(limeFunction: LimeFunction) =
        limeFunction.attributes.get(platformAttributeType, LimeAttributeValueType.NAME, String::class.java)
            ?: nameRules.getName(limeFunction)
}
