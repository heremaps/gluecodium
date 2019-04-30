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

package com.here.genium.platform.swift

import com.vladsch.flexmark.ast.LinkRef
import com.vladsch.flexmark.formatter.Formatter
import com.vladsch.flexmark.parser.Parser
import com.vladsch.flexmark.util.ast.NodeVisitor
import com.vladsch.flexmark.util.ast.VisitHandler
import com.vladsch.flexmark.util.options.DataSet
import com.vladsch.flexmark.util.sequence.BasedSequenceImpl

/**
 * Parse markdown comments and process links
 */
class SwiftCommentsProcessor {
    private val renderer = Formatter.builder().build()
    private val parser = Parser.builder(DataSet()).build()

    fun processLinks(
        limeFullName: String,
        comment: String,
        limeToLanguage: Map<String, String>
    ): String {
        val document = parser.parse(comment.trim())
        val path = limeFullName.split(".")

        val visitor = NodeVisitor(VisitHandler(
            LinkRef::class.java
        ) { node ->
            val reference = node.reference.toString()
            for (i in path.size downTo 0) {
                val child = (path.take(i) + reference).joinToString(separator = ".")
                val element = limeToLanguage[child]
                if (element != null) {
                    node.reference = BasedSequenceImpl.of(element)
                    node.referenceOpeningMarker = BasedSequenceImpl.of("`")
                    node.referenceClosingMarker = BasedSequenceImpl.of("`")
                    node.firstChild.unlink()
                    break
                }
            }
        })

        visitor.visit(document)

        return renderer.render(document).trim()
    }
}
