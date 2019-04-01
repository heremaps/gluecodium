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

package com.here.genium.generator.swift

import com.here.genium.generator.common.NameHelper
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.swift.SwiftType
import java.io.File

object SwiftNameRules {
    val TARGET_DIRECTORY = "swift" + File.separator

    fun getImplementationFileName(limeContainer: LimeContainer) =
        (TARGET_DIRECTORY +
                limeContainer.path.head.joinToString(File.separator) +
                File.separator +
                getTypeName(limeContainer.name) +
                ".swift")

    fun getMethodName(name: String) = NameHelper.toLowerCamelCase(name)

    fun getParameterName(name: String) = NameHelper.toLowerCamelCase(name)

    fun getTypeName(name: String) = NameHelper.toUpperCamelCase(name)

    fun getFieldName(name: String) = NameHelper.toLowerCamelCase(name)

    fun getEnumItemName(name: String) = NameHelper.toLowerCamelCase(name)

    fun getConstantName(name: String) = NameHelper.toLowerCamelCase(name)

    fun getPropertyName(name: String, swiftType: SwiftType) =
        when {
            swiftType === SwiftType.BOOL -> "is" + NameHelper.toUpperCamelCase(name)
            else -> NameHelper.toLowerCamelCase(name)
        }
}
