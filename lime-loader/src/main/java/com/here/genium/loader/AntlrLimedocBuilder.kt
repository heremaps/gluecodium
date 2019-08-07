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
import com.here.genium.antlr.LimedocParserListener
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.tree.ErrorNode
import org.antlr.v4.runtime.tree.TerminalNode

internal class AntlrLimedocBuilder : LimedocParserListener {

    private val commentsCollector = mutableMapOf<Pair<String, String>, String>()

    val result
        get() = LimeStructuredComment(commentsCollector[Pair("", "")] ?: "", commentsCollector)

    // Overrides

    override fun exitDescription(ctx: LimedocParser.DescriptionContext) {
        commentsCollector[Pair("", "")] = ctx.text.trim()
    }

    override fun exitBlockTag(ctx: LimedocParser.BlockTagContext) {
        val tagName = ctx.blockTagName().text
        val tagParameter = ctx.blockTagParameter()?.text ?: ""
        commentsCollector[Pair(tagName, tagParameter)] =
            ctx.blockTagContent().joinToString("") { it.text }.trim()
    }

    // Empty overrides

    override fun enterDocumentation(ctx: LimedocParser.DocumentationContext) {}

    override fun exitDocumentation(ctx: LimedocParser.DocumentationContext) {}

    override fun enterSkipWS(ctx: LimedocParser.SkipWSContext) {}

    override fun enterDocumentationContent(ctx: LimedocParser.DocumentationContentContext) {}

    override fun exitDocumentationContent(ctx: LimedocParser.DocumentationContentContext) {}

    override fun enterDescription(ctx: LimedocParser.DescriptionContext) {}

    override fun enterDescriptionLine(ctx: LimedocParser.DescriptionLineContext) {}

    override fun visitErrorNode(node: ErrorNode?) {}

    override fun exitDescriptionLine(ctx: LimedocParser.DescriptionLineContext) {}

    override fun enterDescriptionText(ctx: LimedocParser.DescriptionTextContext?) {}

    override fun exitDescriptionText(ctx: LimedocParser.DescriptionTextContext?) {}

    override fun visitTerminal(node: TerminalNode?) {}

    override fun exitSkipWS(ctx: LimedocParser.SkipWSContext) {}

    override fun enterTagSection(ctx: LimedocParser.TagSectionContext) {}

    override fun exitTagSection(ctx: LimedocParser.TagSectionContext?) {}

    override fun enterBlockTag(ctx: LimedocParser.BlockTagContext) {}

    override fun enterBlockTagName(ctx: LimedocParser.BlockTagNameContext) {}

    override fun exitBlockTagName(ctx: LimedocParser.BlockTagNameContext) {}

    override fun enterBlockTagParameter(ctx: LimedocParser.BlockTagParameterContext?) {}

    override fun exitBlockTagParameter(ctx: LimedocParser.BlockTagParameterContext?) {}

    override fun enterBlockTagContent(ctx: LimedocParser.BlockTagContentContext) {}

    override fun exitBlockTagContent(ctx: LimedocParser.BlockTagContentContext) {}

    override fun enterEveryRule(ctx: ParserRuleContext) {}

    override fun exitEveryRule(ctx: ParserRuleContext) {}
}
