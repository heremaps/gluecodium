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

package com.here.gluecodium.model.swift

class SwiftDictionary(
    val keyType: SwiftType,
    val valueType: SwiftType,
    cPrefix: String,
    publicName: String = composePublicName(keyType, valueType)
) : SwiftType("", cPrefix, null, TypeCategory.DICTIONARY, publicName, false) {

    override fun withAlias(aliasName: String) =
        SwiftDictionary(keyType, valueType, cPrefix, aliasName)

    override fun stream() = super.stream() + keyType + valueType

    companion object {
        private fun composePublicName(keyType: SwiftType, valueType: SwiftType) =
            "[" + keyType.publicName + ": " + valueType.publicName + "]"
    }
}
