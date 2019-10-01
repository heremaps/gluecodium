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

package com.here.gluecodium.loader

import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeReferenceResolver

internal class AntlrLimeReferenceResolver : LimeReferenceResolver {
    private val referenceCache: MutableMap<String, LimeElement> =
        preCacheBasicTypes()

    override fun registerElement(element: LimeNamedElement) =
        registerElement(element.path.toString(), element)

    override fun registerElement(key: String, element: LimeElement) {
        referenceCache[key] = element
    }

    override val referenceMap: Map<String, LimeElement> = referenceCache

    companion object {
        private fun preCacheBasicTypes(): MutableMap<String, LimeElement> =
            TypeId.values()
                .associateBy({ it.toString() }, { LimeBasicType(it) })
                .toMutableMap()
    }
}
