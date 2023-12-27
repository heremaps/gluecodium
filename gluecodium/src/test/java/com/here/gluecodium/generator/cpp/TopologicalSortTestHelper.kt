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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue

internal object TopologicalSortTestHelper {
    fun createPath(name: String) = LimePath(emptyList(), listOf(name))

    fun createTypeRef(typeName: String) = LimeDirectTypeRef(object : LimeType(createPath(typeName)) {})

    fun createStruct(
        name: String,
        firstType: String,
        secondType: String,
    ): LimeStruct {
        val path = createPath(name)
        return LimeStruct(
            path = path,
            fields =
                listOf(
                    LimeField(path.child("x"), typeRef = createTypeRef(firstType)),
                    LimeField(path.child("y"), typeRef = createTypeRef(secondType)),
                ),
        )
    }

    fun createTypeAlias(
        name: String,
        typeRef: LimeTypeRef,
    ) = LimeTypeAlias(path = createPath(name), typeRef = typeRef)

    fun createConstant(typeName: String) =
        LimeConstant(
            path = createPath("fixed"),
            typeRef = createTypeRef(typeName),
            value = LimeValue.ZERO,
        )

    fun createConstantWithAliasType(): LimeConstant {
        val typeAlias = LimeTypeAlias(createPath("shortcut"), typeRef = createTypeRef("nonsense"))
        return LimeConstant(
            path = createPath("fixed"),
            typeRef = LimeDirectTypeRef(typeAlias),
            value = LimeValue.ZERO,
        )
    }
}
