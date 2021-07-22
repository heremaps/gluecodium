/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

package com.here.gluecodium.generator.common

import com.here.gluecodium.Gluecodium
import com.natpryce.konfig.Configuration
import com.natpryce.konfig.ConfigurationProperties

data class GeneratorOptions(
    var werror: Set<String> = emptySet(),
    var javaPackages: List<String> = listOf(),
    var javaInternalPackages: List<String> = listOf(),
    var javaNullableAnnotation: Pair<String, List<String>>? = null,
    var javaNonNullAnnotation: Pair<String, List<String>>? = null,
    var copyrightHeaderContents: String? = null,
    var cppInternalNamespace: List<String> = emptyList(),
    var cppRootNamespace: List<String> = listOf(),
    var cppExport: String = DEFAULT_CPP_EXPORT_MACRO_NAME,
    var cppExportCommon: String? = null,
    var internalPrefix: String? = null,
    var libraryName: String = "library",
    var dartLookupErrorMessage: String =
        "Failed to resolve an FFI function. Perhaps `LibraryContext.init()` was not called.",
    var generateStubs: Boolean = false,
    var swiftExposeInternals: Boolean = false,
    var cppNameRules: Configuration = ConfigurationProperties.fromResource(
        Gluecodium::class.java,
        "/namerules/cpp.properties"
    ),
    var javaNameRules: Configuration = ConfigurationProperties.fromResource(
        Gluecodium::class.java,
        "/namerules/java.properties"
    ),
    var swiftNameRules: Configuration = ConfigurationProperties.fromResource(
        Gluecodium::class.java,
        "/namerules/swift.properties"
    ),
    var dartNameRules: Configuration = ConfigurationProperties.fromResource(
        Gluecodium::class.java,
        "/namerules/dart.properties"
    ),
    var tags: Set<String> = emptySet()
) {
    companion object {
        const val WARNING_DOC_LINKS = "DocLinks"
        const val WARNING_DEPRECATED_ATTRIBUTES = "DeprecatedAttributes"
        const val WARNING_DART_OVERLOADS = "DartOverloads"

        const val DEFAULT_CPP_EXPORT_MACRO_NAME = "_GLUECODIUM_CPP"
    }
}
