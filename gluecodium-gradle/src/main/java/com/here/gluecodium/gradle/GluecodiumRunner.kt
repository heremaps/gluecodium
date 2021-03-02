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

@file:Suppress("unused", "UnstableApiUsage")

package com.here.gluecodium.gradle

import com.here.gluecodium.Gluecodium
import org.gradle.api.GradleException

/**
 * Actual functionality of [GluecodiumTask], extracted into a standalone class for testability.
 */
internal class GluecodiumRunner(
    private val gluecodiumFactory: (Gluecodium.Options) -> Gluecodium = { Gluecodium(it) }
) {
    fun run(options: Gluecodium.Options) {
        val executionResult = gluecodiumFactory(options).execute()
        if (!executionResult) {
            throw GradleException("Gluecodium code generation failed. See log for details.")
        }
    }
}
