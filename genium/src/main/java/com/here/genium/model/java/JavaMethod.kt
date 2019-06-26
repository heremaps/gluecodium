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

package com.here.genium.model.java

import com.here.genium.model.common.Comments
import java.util.EnumSet
import java.util.stream.Stream

class JavaMethod(
    name: String,
    comment: Comments = Comments(),
    visibility: JavaVisibility = JavaVisibility.PUBLIC,
    val returnType: JavaType = JavaPrimitiveType.VOID,
    val returnComment: String? = null,
    val exception: JavaCustomType? = null,
    val parameters: List<JavaParameter> = emptyList(),
    val isConstructor: Boolean = false,
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

    enum class MethodQualifier constructor(private val value: String) {
        STATIC("static"),
        NATIVE("native");

        override fun toString() = value
    }

    override fun stream() = Stream.concat(
        Stream.of(returnType, exception).filter { it != null },
        Stream.concat(parameters.stream(), super.stream()))

    fun shallowCopy() = JavaMethod(
        name,
        comment,
        visibility,
        returnType,
        returnComment,
        exception,
        parameters,
        isConstructor,
        qualifiers,
        annotations
    )
}
