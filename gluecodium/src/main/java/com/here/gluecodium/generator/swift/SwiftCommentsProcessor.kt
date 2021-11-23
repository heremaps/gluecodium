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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.generator.common.CommentsProcessor
import com.vladsch.flexmark.ast.AutoLink
import com.vladsch.flexmark.ast.LinkRef
import com.vladsch.flexmark.formatter.Formatter
import com.vladsch.flexmark.parser.ParserEmulationProfile
import com.vladsch.flexmark.util.data.MutableDataSet
import com.vladsch.flexmark.util.sequence.BasedSequenceImpl

/**
 * Parse markdown comments and process links
 */
@Suppress("DEPRECATION")
class SwiftCommentsProcessor(werror: Boolean) :
    CommentsProcessor(Formatter.builder(FORMATTER_OPTIONS).build(), werror) {

    override fun processLink(linkNode: LinkRef, linkReference: String, limeFullName: String) {
        linkNode.reference = BasedSequenceImpl.of(linkReference)
        linkNode.referenceOpeningMarker = BasedSequenceImpl.of("`")
        linkNode.referenceClosingMarker = BasedSequenceImpl.of("`")
        linkNode.firstChild?.unlink()
    }

    override fun processAutoLink(linkNode: AutoLink) {
        linkNode.chars = BasedSequenceImpl.of(linkNode.chars.trim('<', '>'))
    }

    override val nullReference = "nil"

    companion object {
        private val FORMATTER_OPTIONS = MutableDataSet()
            .set(Formatter.FORMATTER_EMULATION_PROFILE, ParserEmulationProfile.PEGDOWN)
    }
}
