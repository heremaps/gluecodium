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

package com.here.genium.loader

import com.here.genium.antlr.LimedocParser
import com.here.genium.antlr.LimedocParserBaseListener
import com.here.genium.model.lime.LimeComment

internal class AntlrLimedocBuilder : LimedocParserBaseListener() {

    private val commentsCollector = mutableMapOf<Pair<String, String>, LimeComment>()
    private val contentCollector = mutableListOf<Pair<String, String>>()

    val result
        get() = LimeStructuredComment(
            commentsCollector[Pair("", "")] ?: LimeComment(),
            commentsCollector
        )

    // Overrides

    override fun exitDescription(ctx: LimedocParser.DescriptionContext) {
        commentsCollector[Pair("", "")] = LimeComment(contentCollector.toList())
        contentCollector.clear()
    }

    override fun enterDescriptionMoreLines(ctx: LimedocParser.DescriptionMoreLinesContext) {
        contentCollector += "" to "\n".repeat(ctx.NL().size)
    }

    override fun exitDecriptionFirstWord(ctx: LimedocParser.DecriptionFirstWordContext) {
        contentCollector += when {
            ctx.inlineTag() != null -> convertInlineTag(ctx.inlineTag())
            else -> "" to ctx.text
        }
    }

    override fun exitDescriptionContent(ctx: LimedocParser.DescriptionContentContext) {
        contentCollector += when {
            ctx.inlineTag() != null -> convertInlineTag(ctx.inlineTag())
            else -> "" to ctx.text
        }
    }

    override fun exitBlockTag(ctx: LimedocParser.BlockTagContext) {
        val tagName = ctx.tagName().text
        val tagParameter = ctx.blockTagParameter()?.text ?: ""
        commentsCollector[Pair(tagName, tagParameter)] = LimeComment(contentCollector.toList())
        contentCollector.clear()
    }

    override fun exitBlockTagContent(ctx: LimedocParser.BlockTagContentContext) {
        contentCollector += when {
            ctx.inlineTag() != null -> convertInlineTag(ctx.inlineTag())
            else -> "" to ctx.text
        }
    }

    // Private functions

    private fun convertInlineTag(inlineTag: LimedocParser.InlineTagContext) =
        inlineTag.tagName().text to inlineTag.inlineTagContent().joinToString("") { it.text }
}
