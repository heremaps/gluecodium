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

package com.here.gluecodium.generator.ffi

import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeTypeRef

internal class FfiSignatureResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules
) : LimeSignatureResolver(limeReferenceMap) {

    override fun getFunctionName(limeFunction: LimeFunction) = nameRules.getName(limeFunction)

    override fun getArrayName(elementType: LimeTypeRef) =
        "ListOf_${nameRules.getName(elementType.type)}"

    override fun getMapName(keyType: LimeTypeRef, valueType: LimeTypeRef) =
        "MapOf_${nameRules.getName(keyType.type)}_to_${nameRules.getName(valueType.type)}"

    override fun getSetName(elementType: LimeTypeRef) =
        "SetOf_${nameRules.getName(elementType.type)}"
}
