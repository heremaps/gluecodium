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
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.antlr.v4.runtime.misc.ParseCancellationException
import org.antlr.v4.runtime.tree.TerminalNode
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class AntlrLimeModelBuilderTest {
    @MockK private lateinit var referenceResolver: AntlrLimeReferenceResolver

    @MockK private lateinit var packageHeaderContext: LimeParser.PackageHeaderContext

    @MockK private lateinit var propertyContext: LimeParser.PropertyContext

    private var docCommentContexts = mutableListOf<LimeParser.DocCommentContext>()

    private val contextStack = MockContextStack<LimeNamedElement>()
    private lateinit var modelBuilder: AntlrLimeModelBuilder

    private val barPath = LimePath(listOf("foo"), listOf("bar"))

    private fun pushDocComment(newComment: String) {
        val lineCommentTextNode = mockk<TerminalNode>()
        every { lineCommentTextNode.text } returns newComment

        val lineCommentOpenNode = mockk<TerminalNode>()

        val docCommentContext = mockk<LimeParser.DocCommentContext>()
        every { docCommentContext.DelimitedCommentOpen() } returns null
        every { docCommentContext.LineCommentOpen() } returns lineCommentOpenNode
        every { docCommentContext.LineCommentText() } returns lineCommentTextNode

        docCommentContexts.add(docCommentContext)
    }

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        modelBuilder = AntlrLimeModelBuilder(referenceResolver, emptyMap(), contextStack)

        val simpleIdContext = mockk<LimeParser.SimpleIdContext>()
        every { simpleIdContext.text } returns "foo"
        every { propertyContext.simpleId().text } returns "bar"
        every { propertyContext.docComment() } returns docCommentContexts
        every { referenceResolver.computeUniquePath(any()) } returns barPath
        every { packageHeaderContext.identifier().simpleId() } returns listOf(simpleIdContext)

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

    @Test(expected = ParseCancellationException::class)
    fun exitPropertyRaisesErrorWhenCommentIsNotAssociatedWithAnnotationAndAtTheSameTimeValueAnnotationIsUsed() {
        pushDocComment("A comment that shall not be here")
        pushDocComment("@value Some property")
        pushDocComment("@description Some description")

        modelBuilder.enterProperty(propertyContext)
        modelBuilder.exitProperty(propertyContext)
    }

    @Test
    fun exitPropertyStoresValueAndDescriptionWhenDefined() {
        pushDocComment("@value Some property")
        pushDocComment("@description Some description")

        modelBuilder.enterProperty(propertyContext)
        modelBuilder.exitProperty(propertyContext)

        val result = contextStack.currentContext.currentResults.first() as LimeProperty
        assertEquals(result.comment.toString(), "Some property")
        assertEquals(result.valueComment.toString(), "Some property")
        assertEquals(result.additionalDescriptionComment.toString(), "Some description")
    }

    @Test
    fun exitPropertyUsesFirstLinesAsCommentWhenValueAnnotationIsNotDefined() {
        pushDocComment("Some property")
        pushDocComment("This is old way of documenting properties")

        modelBuilder.enterProperty(propertyContext)
        modelBuilder.exitProperty(propertyContext)

        val result = contextStack.currentContext.currentResults.first() as LimeProperty
        assertEquals(result.comment.toString(), "Some property\nThis is old way of documenting properties")
        assertTrue(result.valueComment.isEmpty())
        assertTrue(result.additionalDescriptionComment.isEmpty())
    }

    @Test
    fun exactFileLocationIsThrownWhenUnknownPlaceholderCommentIsPresent() {
        pushDocComment("@value Some property belonging to {@Placeholder special_component}")
        pushDocComment("@description Some description of property that says about {@Placeholder another_component}")

        val exception =
            assertThrows(ParseCancellationException::class.java) {
                modelBuilder.enterProperty(propertyContext)
            }

        assertNotNull(exception.message)
        assertTrue(exception.message!!.contains("Invalid comment placeholder requested"))
        assertTrue(exception.message!!.startsWith("line "))
    }
}
