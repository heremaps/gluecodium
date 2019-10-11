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

package com.here.gluecodium.common

import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.MockKAnnotations
import io.mockk.impl.annotations.MockK
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.util.logging.Logger

@RunWith(JUnit4::class)
class LimeLoggerTest {

    @MockK private lateinit var javaLogger: Logger
    private val namesMap = mapOf("mo.del.foo" to "FooFile.lime")

    private lateinit var limeLogger: LimeLogger

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        limeLogger = LimeLogger(javaLogger, namesMap)
    }

    @Test
    fun logErrorForContainer() {
        val limeElement = LimeClass(LimePath(listOf("mo", "del"), listOf("foo")))

        limeLogger.error(limeElement, "it happened")

        verify { javaLogger.severe("File FooFile.lime, element mo.del.foo: it happened") }
    }

    @Test
    fun logErrorForChildElement() {
        val limeElement = LimeStruct(LimePath(listOf("mo", "del"), listOf("foo", "bar")))

        limeLogger.error(limeElement, "it happened")

        verify { javaLogger.severe("File FooFile.lime, element mo.del.foo.bar: it happened") }
    }
}
