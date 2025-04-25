/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.model.lime.LimeElement
import com.vladsch.flexmark.ast.LinkRef
import com.vladsch.flexmark.formatter.Formatter
import com.vladsch.flexmark.util.sequence.CharSubSequence

internal class KotlinCommentsProcessor(private val referenceMap: Map<String, LimeElement>, werror: Boolean = true) :
    CommentsProcessor(Formatter.builder().build(), werror) {
    override fun processLink(
        linkNode: LinkRef,
        linkReference: String,
        limeFullName: String,
    ) {
        linkNode.reference = CharSubSequence.of(linkReference)
        linkNode.referenceOpeningMarker = CharSubSequence.of("[")
        linkNode.referenceClosingMarker = CharSubSequence.of("]")
        linkNode.firstChild?.unlink()
    }
}
