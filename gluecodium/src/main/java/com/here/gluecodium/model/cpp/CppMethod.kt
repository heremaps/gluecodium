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

package com.here.gluecodium.model.cpp

import com.here.gluecodium.model.common.Comments
import java.util.EnumSet

class CppMethod(
    name: String,
    fullyQualifiedName: String = name,
    comment: Comments = Comments(),
    val returnType: CppTypeRef = CppPrimitiveTypeRef.VOID,
    var returnComment: String? = null,
    val errorType: CppTypeRef? = null,
    var errorComment: String? = null,
    val isNotNull: Boolean = false,
    val parameters: List<CppParameter> = emptyList(),
    val specifiers: Set<Specifier> = EnumSet.noneOf(Specifier::class.java),
    val qualifiers: Set<Qualifier> = EnumSet.noneOf(Qualifier::class.java)
) : CppElementWithComment(name, fullyQualifiedName, comment = comment) {

    enum class Specifier(private val text: String) {
        STATIC("static"),
        VIRTUAL("virtual");

        override fun toString() = text
    }

    enum class Qualifier(private val text: String) {
        CONST("const"),
        PURE_VIRTUAL("= 0");

        override fun toString() = text
    }

    @Suppress("unused")
    fun hasComment() = !comment.isEmpty ||
        hasReturnComment() ||
        parameters.stream().anyMatch(CppParameter::hasComment)

    private fun hasReturnComment() = !returnComment.isNullOrEmpty() || isNotNull

    @Suppress("unused")
    val isReturningVoid = returnType == CppPrimitiveTypeRef.VOID

    override val childElements
        get() = listOf(returnType) + parameters

    fun copy(
        parameters: List<CppParameter>? = null,
        specifiers: Set<Specifier>? = null,
        qualifiers: Set<Qualifier>? = null
    ) =
        CppMethod(
            name,
            fullyQualifiedName,
            comment,
            returnType,
            returnComment,
            errorType,
            errorComment,
            isNotNull,
            parameters ?: this.parameters,
            specifiers ?: this.specifiers,
            qualifiers ?: this.qualifiers
        )

    val isStatic
        get() = specifiers.contains(Specifier.STATIC)
}
