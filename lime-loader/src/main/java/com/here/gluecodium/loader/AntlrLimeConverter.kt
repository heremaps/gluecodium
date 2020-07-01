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
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CPP_TAG
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.GETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.INCLUDE_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.SETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimePath

internal object AntlrLimeConverter {

    fun convertAnnotations(
        limePath: LimePath,
        annotations: List<LimeParser.AnnotationContext>
    ): LimeAttributes {
        val attributes = LimeAttributes.Builder()
        annotations.forEach { convertAnnotation(it, attributes, limePath) }
        return attributes.build()
    }

    // TODO: #408: add validation warnings about EXTERNAL_* attributes being deprecated
    // Convert external descriptor from legacy attributes
    @Suppress("DEPRECATION")
    fun convertExternalDescriptor(attributes: LimeAttributes): LimeExternalDescriptor? {
        val builder = LimeExternalDescriptor.Builder()
        val externalType =
            attributes.get(LimeAttributeType.CPP, LimeAttributeValueType.EXTERNAL_TYPE, Any::class.java)
        if (externalType != null) {
            val value = (externalType as? List<*>)?.joinToString() ?: externalType.toString()
            builder.addValue(CPP_TAG, INCLUDE_NAME, value)
        }
        attributes.get(LimeAttributeType.CPP, LimeAttributeValueType.EXTERNAL_NAME)
            ?.let { builder.addValue(CPP_TAG, NAME_NAME, it) }
        attributes.get(LimeAttributeType.CPP, LimeAttributeValueType.EXTERNAL_GETTER)
            ?.let { builder.addValue(CPP_TAG, GETTER_NAME_NAME, it) }
        attributes.get(LimeAttributeType.CPP, LimeAttributeValueType.EXTERNAL_SETTER)
            ?.let { builder.addValue(CPP_TAG, SETTER_NAME_NAME, it) }

        return builder.build().let { if (it.cpp.isNullOrEmpty()) null else it }
    }

    private fun convertAnnotation(
        annotationContext: LimeParser.AnnotationContext,
        attributes: LimeAttributes.Builder,
        limePath: LimePath
    ) {
        val attributeType = convertAnnotationType(annotationContext)
        attributes.addAttribute(attributeType)
        annotationContext.annotationValue().forEach {
            val rawValue = convertAnnotationValue(it)
            val value = when (attributeType) {
                LimeAttributeType.DEPRECATED -> {
                    val stringValue = rawValue as? String
                        ?: throw LimeLoadingException("Unsupported attribute value: '$rawValue'")
                    LimeComment(stringValue, limePath.child("@deprecated"))
                }
                else -> rawValue
            }
            attributes.addAttribute(
                attributeType,
                convertAnnotationValueType(it, attributeType),
                value
            )
        }
    }

    private fun convertAnnotationType(ctx: LimeParser.AnnotationContext) =
        when (val id = ctx.simpleId().text) {
            "Cached" -> LimeAttributeType.CACHED
            "Cpp" -> LimeAttributeType.CPP
            "Dart" -> LimeAttributeType.DART
            "Deprecated" -> LimeAttributeType.DEPRECATED
            "Equatable" -> LimeAttributeType.EQUATABLE
            "Immutable" -> LimeAttributeType.IMMUTABLE
            "Java" -> LimeAttributeType.JAVA
            "PointerEquatable" -> LimeAttributeType.POINTER_EQUATABLE
            "Swift" -> LimeAttributeType.SWIFT
            "Serializable" -> LimeAttributeType.SERIALIZABLE
            else -> throw LimeLoadingException("Unsupported attribute: '$id'")
        }

    @Suppress("DEPRECATION")
    private fun convertAnnotationValueType(
        ctx: LimeParser.AnnotationValueContext,
        attributeType: LimeAttributeType
    ): LimeAttributeValueType {
        val id = ctx.simpleId()?.text ?: return (
            attributeType.defaultValueType ?: throw LimeLoadingException(
                "Attribute type $attributeType does not support values"
            )
        )
        return when (id) {
            "Name" -> LimeAttributeValueType.NAME
            "Accessors" -> LimeAttributeValueType.ACCESSORS
            "Builder" -> LimeAttributeValueType.BUILDER
            "Const" -> LimeAttributeValueType.CONST
            "CString" -> LimeAttributeValueType.CSTRING
            "Default" -> LimeAttributeValueType.DEFAULT
            "Extension" -> LimeAttributeValueType.EXTENSION
            "FunctionName" -> LimeAttributeValueType.FUNCTION_NAME
            "Label" -> LimeAttributeValueType.LABEL
            "ObjC" -> LimeAttributeValueType.OBJC
            "Message" -> LimeAttributeValueType.MESSAGE
            "Skip" -> LimeAttributeValueType.SKIP
            "ExternalType" -> LimeAttributeValueType.EXTERNAL_TYPE
            "ExternalName" -> LimeAttributeValueType.EXTERNAL_NAME
            "ExternalGetter" -> LimeAttributeValueType.EXTERNAL_GETTER
            "ExternalSetter" -> LimeAttributeValueType.EXTERNAL_SETTER
            else -> throw LimeLoadingException("Unsupported attribute value: '$id'")
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
