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

package com.here.gluecodium.platform.swift

import com.here.gluecodium.model.swift.SwiftArray
import com.here.gluecodium.model.swift.SwiftClass
import com.here.gluecodium.model.swift.SwiftClosure
import com.here.gluecodium.model.swift.SwiftDictionary
import com.here.gluecodium.model.swift.SwiftExtension
import com.here.gluecodium.model.swift.SwiftMethod
import com.here.gluecodium.model.swift.SwiftModelElement
import com.here.gluecodium.model.swift.SwiftSet
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.model.swift.SwiftType
import com.here.gluecodium.model.swift.SwiftTypedModelElement

internal object SwiftTypeRefsCollector {
    fun expandCollectionTypeRefs(swiftType: SwiftType): List<SwiftType> =
        when (swiftType) {
            is SwiftArray -> expandCollectionTypeRefs(swiftType.elementType)
            is SwiftSet -> expandCollectionTypeRefs(swiftType.elementType)
            is SwiftDictionary -> expandCollectionTypeRefs(swiftType.keyType) +
                expandCollectionTypeRefs(swiftType.valueType)
            else -> listOf(swiftType)
        }

    fun collectTypeRefs(element: SwiftModelElement): List<SwiftType> =
        when (element) {
            is SwiftClass, is SwiftStruct, is SwiftExtension ->
                element.childElements.flatMap { collectTypeRefs(it) }
            is SwiftMethod -> element.parameters.flatMap { collectTypeRefs(it) } + element.returnType
            is SwiftClosure -> element.parameters + element.returnType
            is SwiftTypedModelElement -> listOf(element.type)
            else -> emptyList()
        }
}
