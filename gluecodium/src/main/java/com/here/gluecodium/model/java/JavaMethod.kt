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

package com.here.gluecodium.model.java

import com.here.gluecodium.model.common.Comments
import java.util.EnumSet

class JavaMethod(
    name: String,
    comment: Comments = Comments(),
    visibility: JavaVisibility = JavaVisibility.PUBLIC,
    val returnType: JavaType = JavaPrimitiveType.VOID,
    var returnComment: String? = null,
    val exception: JavaExceptionType? = null,
    var throwsComment: String? = null,
    val parameters: List<JavaParameter> = emptyList(),
    val isConstructor: Boolean = false,
    val isGetter: Boolean = false,
    qualifiers: Set<MethodQualifier> = EnumSet.noneOf(MethodQualifier::class.java),
    annotations: Set<JavaType> = emptySet()
) : JavaElement(name) {

    val qualifiers: MutableSet<MethodQualifier> = LinkedHashSet(qualifiers)

    init {
        this.comment = comment
        this.visibility = visibility
        this.annotations.addAll(annotations)
    }

    @Suppress("unused")
    val allAnnotations
        get() = returnType.annotations + annotations

    @Suppress("unused")
    val isReturningVoid = returnType == JavaPrimitiveType.VOID

    @Suppress("unused")
    val hasComment: Boolean
        get() = !comment.isEmpty || !returnComment.isNullOrBlank() || parameters.any { !it.comment.isEmpty }

    enum class MethodQualifier constructor(private val value: String) {
        STATIC("static"),
        NATIVE("native");

        override fun toString() = value
    }

    override val childElements
        get() = listOfNotNull(returnType, exception) + parameters + super.childElements

    fun shallowCopy() = JavaMethod(
        name = name,
        comment = comment,
        visibility = visibility,
        returnType = returnType,
        returnComment = returnComment,
        exception = exception,
        parameters = parameters,
        isConstructor = isConstructor,
        isGetter = isGetter,
        qualifiers = qualifiers,
        annotations = annotations
    )
}
