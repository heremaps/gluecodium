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

package com.here.gluecodium.generator.reactnative

import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeModel
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.util.ServiceLoader

class ReactNativeGeneratorTest {
    private val generator = ReactNativeGenerator()

    @Test
    fun `service loader discovers react-native generator`() {
        val generators = ServiceLoader.load(Generator::class.java).toList()
        val rnGenerator = generators.find { it.shortName == "react-native" }
        assertNotNull("React Native generator should be discoverable via ServiceLoader", rnGenerator)
    }

    @Test
    fun `short name is react-native`() {
        assertEquals("react-native", generator.shortName)
    }

    @Test
    fun `empty model produces support files only`() {
        val emptyModel = LimeModel(referenceMap = emptyMap(), topElements = emptyList())
        generator.initialize(GeneratorOptions())
        val files = generator.generate(emptyModel)
        // An empty model produces ONLY product-neutral support files (no per-type Native*Module
        // files). The support-file set may grow as the runtime evolves, so assert the invariant
        // rather than a brittle exact count: the two foundational headers are present and NOTHING
        // module-specific is emitted.
        assertTrue(files.any { it.targetFile.name == "FfiOpaqueHandle.h" })
        assertTrue(files.any { it.targetFile.name == "FfiHandleRegistry.h" })
        assertTrue(files.none { it.targetFile.name.startsWith("Native") })
    }

    @Test
    fun `generator initializes with cpp namespace`() {
        val options = GeneratorOptions(cppRootNamespace = listOf("gluecodium", "calculator"))
        generator.initialize(options)
    }
}
