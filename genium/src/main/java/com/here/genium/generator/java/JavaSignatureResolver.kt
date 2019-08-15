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

package com.here.genium.generator.java

import com.here.genium.generator.common.NameRules
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeSignatureResolver
import com.here.genium.model.lime.LimeTypeRef

class JavaSignatureResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules
) : LimeSignatureResolver(limeReferenceMap) {

    override fun getMethodName(limeMethod: LimeFunction) = nameRules.getName(limeMethod)

    override fun getArrayName(elementType: LimeTypeRef) = TYPE_ERASED_ARRAY

    override fun getMapName(keyType: LimeTypeRef, valueType: LimeTypeRef) = TYPE_ERASED_MAP

    override fun getSetName(elementType: LimeTypeRef) = TYPE_ERASED_SET

    companion object {
        private const val TYPE_ERASED_ARRAY = "List<>"
        private const val TYPE_ERASED_MAP = "Map<>"
        private const val TYPE_ERASED_SET = "Set<>"
    }
}
