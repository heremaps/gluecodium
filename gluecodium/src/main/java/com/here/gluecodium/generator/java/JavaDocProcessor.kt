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

package com.here.gluecodium.generator.java

import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeParameter
import com.vladsch.flexmark.ast.LinkRef
import com.vladsch.flexmark.ext.tables.TablesExtension
import com.vladsch.flexmark.html.HtmlRenderer
import com.vladsch.flexmark.parser.Parser
import com.vladsch.flexmark.util.data.DataHolder
import com.vladsch.flexmark.util.data.MutableDataSet
import com.vladsch.flexmark.util.sequence.CharSubSequence

/**
 * Parse Markdown comments and output JavaDoc
 */
internal class JavaDocProcessor(werror: Boolean, private val referenceMap: Map<String, LimeElement>) :
    CommentsProcessor(HtmlRenderer.builder(flexmarkOptions).build(), werror, flexmarkOptions) {
    override fun processLink(
        linkNode: LinkRef,
        linkReference: String,
        limeFullName: String,
    ) {
        val limeElement = referenceMap[fullNameToPathKey(limeFullName)]
        linkNode.chars =
            if (limeElement is LimeParameter) {
                val shortReference = linkReference.split("#").last()
                CharSubSequence.of("{@code $shortReference}")
            } else {
                CharSubSequence.of("{@link $linkReference}")
            }
        linkNode.firstChild?.unlink()
    }

    override fun postRenderDocument(renderedDocument: String) = renderedDocument.replace("</p>", "")

    /** For `LimeParameter` the position of the disambiguator suffix differs between "full path" and "full name". */
    private fun fullNameToPathKey(fullName: String): String {
        if (!fullName.contains(":")) return fullName

        val nameComponents = fullName.split(":")
        val suffix = nameComponents.last()
        if (!suffix.contains(".")) return fullName

        val suffixComponents = suffix.split(".")
        return nameComponents.first() + "." + suffixComponents.last() + ":" + suffixComponents.first()
    }

    companion object {
        internal val flexmarkOptions: DataHolder =
            MutableDataSet()
                .set(Parser.EXTENSIONS, listOf(TablesExtension.create()))
                .toImmutable()
    }
}
