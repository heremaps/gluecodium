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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.swift.SwiftType

class SwiftBuiltinOptionalsGenerator {
    fun generate(): List<GeneratedFile> {
        val builtinTypes = mapOf("types" to listOf(SwiftType.BOOL, SwiftType.FLOAT,
            SwiftType.DOUBLE, SwiftType.INT8, SwiftType.UINT8, SwiftType.INT16, SwiftType.UINT16,
            SwiftType.INT32, SwiftType.UINT32, SwiftType.INT64, SwiftType.UINT64))

        val content = TemplateEngine.render("swift/BuiltinOptionals", builtinTypes)
        return listOf(GeneratedFile(content, SWIFT_BUILTIN_OPTIONALS))
    }

    companion object {
        private const val SWIFT_BUILTIN_OPTIONALS = "swift/BuiltinOptionals.swift"
    }
}
