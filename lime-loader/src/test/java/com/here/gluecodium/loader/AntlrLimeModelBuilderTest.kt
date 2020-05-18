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

package com.here.gluecodium.loader

import com.here.gluecodium.antlr.LimeParser
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class AntlrLimeModelBuilderTest {
    @MockK private lateinit var packageHeaderContext: LimeParser.PackageHeaderContext
    @MockK private lateinit var propertyContext: LimeParser.PropertyContext

    private val contextStack = MockContextStack<LimeNamedElement>()
    private val modelBuilder = AntlrLimeModelBuilder(mockk(relaxed = true), contextStack)

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        val simpleIdContext = mockk<LimeParser.SimpleIdContext>()
        every { simpleIdContext.text } returns "foo"
        every { packageHeaderContext.identifier().simpleId() } returns listOf(simpleIdContext)
        every { propertyContext.simpleId().text } returns "bar"

        modelBuilder.exitPackageHeader(packageHeaderContext)
    }

    @Test
    fun exitPropertyCreatesAccessors() {
        modelBuilder.enterProperty(propertyContext)
        modelBuilder.exitProperty(propertyContext)

        val result = contextStack.currentContext.currentResults.first() as LimeProperty
        assertFalse(result.getter.returnType.isVoid)
        assertEquals("foo.bar.get", result.getter.path.toString())
        assertEquals(1, result.setter?.parameters?.size)
        assertEquals("foo.bar.set", result.setter?.path?.toString())
    }

    @Test
    fun exitPropertyReadonlyCreatesOnlyGetter() {
        every { propertyContext.setter() } returns null

        modelBuilder.enterProperty(propertyContext)
        modelBuilder.exitProperty(propertyContext)

        val result = contextStack.currentContext.currentResults.first() as LimeProperty
        assertFalse(result.getter.returnType.isVoid)
        assertEquals("foo.bar.get", result.getter.path.toString())
        assertNull(result.setter)
    }

    @Test
    fun exitPropertyShorthandSyntaxCreatesAccessors() {
        every { propertyContext.getter() } returns null

        modelBuilder.enterProperty(propertyContext)
        modelBuilder.exitProperty(propertyContext)

        val result = contextStack.currentContext.currentResults.first() as LimeProperty
        assertFalse(result.getter.returnType.isVoid)
        assertEquals("foo.bar.get", result.getter.path.toString())
        assertEquals(1, result.setter?.parameters?.size)
        assertEquals("foo.bar.set", result.setter?.path?.toString())
    }
}
