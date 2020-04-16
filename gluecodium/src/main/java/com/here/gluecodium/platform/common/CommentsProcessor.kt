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

package com.here.gluecodium.platform.common

import com.here.gluecodium.common.LimeLogger
import com.vladsch.flexmark.ast.Code
import com.vladsch.flexmark.ast.LinkRef
import com.vladsch.flexmark.parser.Parser
import com.vladsch.flexmark.util.IRender
import com.vladsch.flexmark.util.ast.NodeVisitor
import com.vladsch.flexmark.util.ast.VisitHandler
import com.vladsch.flexmark.util.options.DataSet
import com.vladsch.flexmark.util.sequence.BasedSequenceImpl

/**
 * Parse Markdown comments and process links.
 */
abstract class CommentsProcessor(private val renderer: IRender) {
    private val parser = Parser.builder(DataSet()).build()

    fun process(
        limeFullName: String,
        comment: String,
        limeToLanguage: Map<String, String>,
        logger: LimeLogger
    ): String {
        val document = parser.parse(comment.trim())
        val path = limeFullName.split(".")

        val linkRefHandler = VisitHandler(LinkRef::class.java) {
            val reference = it.reference.toString().replace(" ", "")
            for (i in path.size downTo 0) {
                val child = (path.take(i) + reference).joinToString(".")
                val element = limeToLanguage[child]
                if (element != null) {
                    processLink(it, element)
                    return@VisitHandler
                }
            }
            logger.warning(limeFullName, "Failed to resolve documentation reference [$reference]")
        }
        val codeBlockHandler = VisitHandler(Code::class.java) {
            if (it.text.toString() == standardNullReference) {
                it.text = BasedSequenceImpl.of(nullReference)
            }
        }
        NodeVisitor(linkRefHandler, codeBlockHandler).visit(document)

        return renderer.render(document).trim()
    }

    abstract fun processLink(linkNode: LinkRef, linkReference: String)
    open val nullReference = standardNullReference

    companion object {
        private const val standardNullReference = "null"
    }
}
