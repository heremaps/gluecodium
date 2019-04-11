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

package com.here.genium.loader

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeNamedElement
import org.franca.core.franca.FTypeRef

class LimeReferenceResolver {
    private val referenceCache: MutableMap<String, LimeElement> =
        preCacheBasicTypes()

    fun registerElement(element: LimeNamedElement) =
        registerElement(element.path.toString(), element)

    fun registerElement(key: String, element: LimeElement) {
        referenceCache[key] = element
    }

    val referenceMap: Map<String, LimeElement> = referenceCache

    companion object {
        fun getTypeKey(francaTypeRef: FTypeRef): String =
            when {
                francaTypeRef.derived != null -> FrancaTypeHelper.getFullName(francaTypeRef.derived)
                else -> francaTypeRef.predefined.name
            }

        fun getArrayKey(elementTypeKey: String) = "[$elementTypeKey]"

        fun getMapKey(keyTypeKey: String, valueTypeKey: String) = "[$keyTypeKey:$valueTypeKey]"

        fun getChildKey(parentTypeRef: FTypeRef, childName: String) =
            getTypeKey(parentTypeRef) + "." + childName

        private fun preCacheBasicTypes(): MutableMap<String, LimeElement> {
            val basicTypes: MutableMap<String, LimeElement> = TypeId.values()
                .associateBy(TypeId::name, ::LimeBasicType)
                .toMutableMap()
            basicTypes["UNDEFINED"] = LimeBasicType(TypeId.VOID)
            basicTypes["BYTE_BUFFER"] = LimeBasicType(TypeId.BLOB)
            return basicTypes
        }
    }
}
