/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.typescript

import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeModel
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.util.ServiceLoader

class TypeScriptGeneratorTest {
    private val generator = TypeScriptGenerator()

    @Test
    fun `service loader discovers typescript generator`() {
        val generators = ServiceLoader.load(Generator::class.java).toList()
        val tsGenerator = generators.find { it.shortName == "typescript" }
        assertNotNull("TypeScript generator should be discoverable via ServiceLoader", tsGenerator)
    }

    @Test
    fun `short name is typescript`() {
        assertEquals("typescript", generator.shortName)
    }

    @Test
    fun `empty model produces no files`() {
        val emptyModel = LimeModel(referenceMap = emptyMap(), topElements = emptyList())
        generator.initialize(GeneratorOptions())
        val files = generator.generate(emptyModel)
        assertTrue("Empty model should produce no files", files.isEmpty())
    }

    @Test
    fun `generator initializes without error`() {
        val options = GeneratorOptions(tags = setOf("typescript"))
        generator.initialize(options)
    }
}
