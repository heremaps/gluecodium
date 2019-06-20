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

package com.here.genium.franca

import org.franca.core.franca.FAnnotationType
import org.franca.core.franca.FModelElement

object CommentHelper {
    fun getDescription(francaElement: FModelElement) =
        getFrancaAnnotation(francaElement, FAnnotationType.DESCRIPTION) ?: ""

    fun getDeprecationMessage(francaElement: FModelElement) =
        getFrancaAnnotation(francaElement, FAnnotationType.DEPRECATED)

    private fun getFrancaAnnotation(
        francaElement: FModelElement,
        annotationType: FAnnotationType
    ): String? {
        val annotationBlock = francaElement.comment ?: return null
        val commentLines = annotationBlock
                .elements
                .filter { it.type == annotationType }
                .flatMap { it.comment.lines() }
        if (commentLines.isEmpty()) {
            return null
        }

        // Franca already trims first line so use only remaining lines to determine indent
        return (commentLines.take(1) + commentLines.drop(1).joinToString("\n").trimIndent())
            .joinToString("\n").trimEnd()
    }
}
