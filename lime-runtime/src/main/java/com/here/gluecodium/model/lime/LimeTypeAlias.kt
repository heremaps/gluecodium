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

package com.here.gluecodium.model.lime

/**
 * There are two different use cases that involve a type alias:
 * * creating a typealias-like element in the target language. This does not require any additional
 * information and can be done solely based on information contained in this class.
 * * handling the type alias as if it actually were the type it points to (this is necessary, for
 * example, for various type conversion routines). This needs additional information obtainable
 * through resolving the [typeRef]. A recommended way to do this is to use [actualType].
 */
class LimeTypeAlias(
    path: LimePath,
    comment: LimeComment = LimeComment(),
    attributes: LimeAttributes? = null,
    val typeRef: LimeTypeRef,
) : LimeType(path, comment, attributes) {
    override val actualType
        get() = typeRef.type.actualType
}
