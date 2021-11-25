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

package com.here.gluecodium

data class GluecodiumOptions(
    var idlSources: List<String> = emptyList(),
    var auxiliaryIdlSources: List<String> = emptyList(),
    var outputDir: String = "",
    var commonOutputDir: String = "",
    var generators: Set<String> = setOf(),
    var isValidatingOnly: Boolean = false,
    var isEnableCaching: Boolean = false,
    var isStrictMode: Boolean = false
)
