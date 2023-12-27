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

package com.here.gluecodium.generator.common

import com.here.gluecodium.common.LimeLogger
import com.vladsch.flexmark.ast.AutoLink
import com.vladsch.flexmark.ast.Code
import com.vladsch.flexmark.ast.LinkRef
import com.vladsch.flexmark.parser.Parser
import com.vladsch.flexmark.util.ast.IRender
import com.vladsch.flexmark.util.ast.NodeVisitor
import com.vladsch.flexmark.util.ast.VisitHandler
import com.vladsch.flexmark.util.data.DataHolder
import com.vladsch.flexmark.util.data.DataSet
import com.vladsch.flexmark.util.sequence.CharSubSequence

/**
 * Parse Markdown comments and process links.
 */
abstract class CommentsProcessor(
    private val renderer: IRender,
    private val werror: Boolean,
    parserOptions: DataHolder = DataSet()
) {
    val hasError
        get() = werror && hasErrorFlag
    private var hasErrorFlag = false

    private val parser = Parser.builder(parserOptions).build()
    private val logFunction: LimeLogger.(String, String) -> Unit =
        if (werror) { elementName: String, message: String ->
            this.error(elementName, message)
        } else { elementName: String, message: String ->
            this.warning(elementName, message)
        }

    fun process(
        limeFullName: String,
        comment: String,
        limeToLanguage: Map<String, String>,
        logger: LimeLogger?
    ): String {
        val document = parser.parse(comment.trim())
        val path = limeFullName.split(".")

        val linkRefHandler = VisitHandler(LinkRef::class.java) {
            if (it.isDefined) return@VisitHandler

            val rawReference = it.reference.toString()
            val normalizedReference = normalizeReference(rawReference)
            for (i in path.size downTo 0) {
                val child = (path.take(i) + normalizedReference).joinToString(".")
                val element = limeToLanguage[child]
                if (element != null) {
                    processLink(it, element, child)
                    return@VisitHandler
                }
            }
            logger?.logFunction(limeFullName, "Failed to resolve documentation reference [$rawReference]")
            hasErrorFlag = true
        }
        val codeBlockHandler = VisitHandler(Code::class.java) {
            if (it.text.toString() == STANDART_NULL_REFERENCE) {
                it.text = CharSubSequence.of(nullReference)
            }
        }
        val autoLinkHandler = VisitHandler(AutoLink::class.java) { processAutoLink(it) }
        NodeVisitor(linkRefHandler, codeBlockHandler, autoLinkHandler).visit(document)

        val renderedDocument = renderer.render(document)
        return postRenderDocument(renderedDocument).trim()
    }

    // Normalize element reference to ensure a name match:
    // 1. Remove all spaces.
    // 2. For function overload references with signatures, reduce qualified type names to a single name component.
    private fun normalizeReference(reference: String): String {
        val result = reference.replace(" ", "")
        val signatureComponents = result.split('(')
        if (signatureComponents.size == 1) return result

        val name = signatureComponents.first()
        val signature = signatureComponents.drop(1).joinToString("")
        return name + "(" + signature.split(",").joinToString(",") { it.split('.').last() }
    }

    abstract fun processLink(linkNode: LinkRef, linkReference: String, limeFullName: String)
    open fun processAutoLink(linkNode: AutoLink) {}
    open fun postRenderDocument(renderedDocument: String): String = renderedDocument

    open val nullReference = STANDART_NULL_REFERENCE

    companion object {
        private const val STANDART_NULL_REFERENCE = "null"
    }
}
