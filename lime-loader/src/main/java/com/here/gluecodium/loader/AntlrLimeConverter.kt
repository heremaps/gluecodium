/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.loader

import com.here.gluecodium.antlr.LimeParser
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes

internal object AntlrLimeConverter {

    fun convertAnnotations(annotations: List<LimeParser.AnnotationContext>): LimeAttributes {
        val attributes = LimeAttributes.Builder()
        annotations.forEach {
            val attributeType = convertAnnotationType(it)
            attributes.addAttribute(attributeType)
            it.annotationValue().forEach { valueContext ->
                attributes.addAttribute(
                    attributeType,
                    convertAnnotationValueType(valueContext, attributeType),
                    convertAnnotationValue(valueContext)
                )
            }
        }
        return attributes.build()
    }

    private fun convertAnnotationType(ctx: LimeParser.AnnotationContext) =
        when (val id = ctx.simpleId().text) {
            "Cpp" -> LimeAttributeType.CPP
            "Dart" -> LimeAttributeType.DART
            "Deprecated" -> LimeAttributeType.DEPRECATED
            "Equatable" -> LimeAttributeType.EQUATABLE
            "Immutable" -> LimeAttributeType.IMMUTABLE
            "Java" -> LimeAttributeType.JAVA
            "PointerEquatable" -> LimeAttributeType.POINTER_EQUATABLE
            "Swift" -> LimeAttributeType.SWIFT
            "Serializable" -> LimeAttributeType.SERIALIZABLE
            else -> throw LimeLoadingException("Unsupported annotation: '$id'")
        }

    private fun convertAnnotationValueType(
        ctx: LimeParser.AnnotationValueContext,
        attributeType: LimeAttributeType
    ): LimeAttributeValueType {
        val id = ctx.simpleId()?.text
            ?: return attributeType.defaultValueType
                ?: throw LimeLoadingException("Annotation type $attributeType does not support values")
        return when (id) {
            "Name" -> LimeAttributeValueType.NAME
            "Accessors" -> LimeAttributeValueType.ACCESSORS
            "Builder" -> LimeAttributeValueType.BUILDER
            "Const" -> LimeAttributeValueType.CONST
            "Extension" -> LimeAttributeValueType.EXTENSION
            "FunctionName" -> LimeAttributeValueType.FUNCTION_NAME
            "Label" -> LimeAttributeValueType.LABEL
            "ObjC" -> LimeAttributeValueType.OBJC
            "Message" -> LimeAttributeValueType.MESSAGE
            "Default" -> LimeAttributeValueType.DEFAULT
            "ExternalType" -> LimeAttributeValueType.EXTERNAL_TYPE
            "ExternalName" -> LimeAttributeValueType.EXTERNAL_NAME
            "ExternalGetter" -> LimeAttributeValueType.EXTERNAL_GETTER
            "ExternalSetter" -> LimeAttributeValueType.EXTERNAL_SETTER
            else -> throw LimeLoadingException("Unsupported annotation value: '$id'")
        }
    }

    private fun convertAnnotationValue(valueContext: LimeParser.AnnotationValueContext): Any {
        val literals = valueContext.stringLiteral()
        return when {
            literals.isEmpty() -> true
            literals.size == 1 -> convertStringLiteral(literals.first())
            else -> literals.map { convertStringLiteral(it) }
        }
    }

    private fun convertStringLiteral(ctx: LimeParser.StringLiteralContext) =
        when {
            ctx.singleLineStringLiteral() != null ->
                convertSingleLineStringLiteral(ctx.singleLineStringLiteral())
            ctx.multiLineStringLiteral() != null ->
                convertMultiLineStringLiteral(ctx.multiLineStringLiteral())
            else -> throw LimeLoadingException("Unsupported string literal: '$ctx'")
        }

    fun convertSingleLineStringLiteral(ctx: LimeParser.SingleLineStringLiteralContext) =
        ctx.singleLineStringContent().joinToString(separator = "") {
            it.LineStrText()?.text ?: convertEscapedChar(it.LineStrEscapedChar().text)
        }

    private fun convertEscapedChar(escapedChar: String) =
        when (escapedChar) {
            "\\t" -> "\t"
            "\\b" -> "\b"
            "\\r" -> "\r"
            "\\n" -> "\n"
            "\\\"" -> "\""
            "\\\\" -> "\\"
            else -> throw LimeLoadingException("Unsupported escape sequence: '$escapedChar'")
        }

    private fun convertMultiLineStringLiteral(ctx: LimeParser.MultiLineStringLiteralContext) =
        ctx.multiLineStringContent().joinToString(separator = "") {
            it.MultiLineStrText()?.text ?: it.MultiLineStringQuote().text
        }
}
