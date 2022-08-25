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
import com.here.gluecodium.antlr.LimedocLexer
import com.here.gluecodium.antlr.LimedocParser
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.tree.ParseTreeWalker
import java.util.Locale

internal object AntlrLimeConverter {

    fun convertAnnotations(
        limePath: LimePath,
        annotations: List<LimeParser.AnnotationContext>,
        parentAttributes: LimeAttributes? = null
    ): LimeAttributes {
        val attributes = LimeAttributes.Builder()
        annotations.forEach { convertAnnotation(it, attributes, limePath) }

        if (parentAttributes != null) {
            propagateParentAttributes(parentAttributes, attributes)
        }

        return attributes.build()
    }

    private fun propagateParentAttributes(
        parentAttributes: LimeAttributes,
        attributes: LimeAttributes.Builder
    ) {
        parentAttributes
            .get(LimeAttributeType.DEPRECATED, LimeAttributeValueType.MESSAGE, LimeComment::class.java)
            ?.let { attributes.addAttributeIfAbsent(LimeAttributeType.DEPRECATED, LimeAttributeValueType.MESSAGE, it) }

        if (parentAttributes.have(LimeAttributeType.INTERNAL)) {
            attributes.addAttribute(LimeAttributeType.INTERNAL)
        }

        listOf(JAVA, SWIFT, DART).forEach {
            if (parentAttributes.have(it, LimeAttributeValueType.INTERNAL)) {
                attributes.addAttribute(it, LimeAttributeValueType.INTERNAL)
            }
            if (parentAttributes.have(it, LimeAttributeValueType.PUBLIC)) {
                attributes.addAttribute(it, LimeAttributeValueType.PUBLIC)
            }
        }
    }

    fun parseStructuredComment(commentString: String, lineNumber: Int, limePath: LimePath): LimeStructuredComment {
        val lexer = LimedocLexer(CharStreams.fromString(commentString))
        val parser = LimedocParser(CommonTokenStream(lexer))
        parser.removeErrorListeners()
        parser.addErrorListener(ThrowingErrorListener(lineNumber - 1))

        val builder = AntlrLimedocBuilder(limePath)
        ParseTreeWalker.DEFAULT.walk(builder, parser.documentation())

        return builder.result
    }

    private fun convertAnnotation(
        annotationContext: LimeParser.AnnotationContext,
        attributes: LimeAttributes.Builder,
        limePath: LimePath
    ) {
        val attributeType = convertAnnotationType(annotationContext)
        val annotationValues = annotationContext.annotationValue()
        if (annotationValues.isEmpty()) {
            attributes.addAttribute(attributeType)
            return
        }
        if (attributeType == LimeAttributeType.SKIP) {
            annotationValues.forEach { addSkipAttribute(attributes, it) }
            return
        }
        if (attributeType == LimeAttributeType.ENABLE_IF) {
            annotationValues.forEach { addEnableIfAttribute(attributes, it) }
            return
        }
        if (attributeType == LimeAttributeType.INTERNAL) {
            annotationValues.forEach { addVisibilityAttribute(attributes, it) }
            return
        }

        annotationValues.forEach {
            val valueType = convertAnnotationValueType(it, attributeType)
            val rawValue = convertAnnotationValue(it)
            val value = when {
                attributeType == LimeAttributeType.DEPRECATED -> {
                    val stringValue = rawValue as? String
                        ?: throw LimeLoadingException("Unsupported attribute value: '$rawValue'")
                    parseStructuredComment(
                        stringValue,
                        annotationContext.getStart().line,
                        limePath.child("@deprecated")
                    ).description
                }
                rawValue is String -> makeSafeString(rawValue)
                else -> rawValue
            }
            attributes.addAttribute(attributeType, valueType, value)
        }
    }

    private fun addSkipAttribute(
        attributes: LimeAttributes.Builder,
        valueContext: LimeParser.AnnotationValueContext
    ) {
        val valueTypeText = valueContext.simpleId()?.text
        val value = when (valueTypeText?.lowercase(Locale.getDefault())) {
            null, "tag" -> convertAnnotationValue(valueContext)
            else -> valueTypeText
        }

        val valueList = if (value is List<*>) value else listOf(value)
        valueList.filterIsInstance<String>().forEach {
            when (val attributeType = LimeAttributeType.fromString[it]) {
                null -> attributes.addAttribute(LimeAttributeType.SKIP, LimeAttributeValueType.TAG, it)
                else -> attributes.addAttribute(attributeType, LimeAttributeValueType.SKIP)
            }
        }
    }

    private fun addEnableIfAttribute(
        attributes: LimeAttributes.Builder,
        valueContext: LimeParser.AnnotationValueContext
    ) {
        val valueTypeText = valueContext.simpleId()?.text
        val value = when (valueTypeText?.lowercase(Locale.getDefault())) {
            null, "tag" -> convertAnnotationValue(valueContext)
            else -> valueTypeText
        }

        val valueList = if (value is List<*>) value else listOf(value)
        valueList.filterIsInstance<String>().forEach {
            attributes.addAttribute(LimeAttributeType.ENABLE_IF, LimeAttributeValueType.TAG, it)
        }
    }

    private fun addVisibilityAttribute(
        attributes: LimeAttributes.Builder,
        valueContext: LimeParser.AnnotationValueContext
    ) {
        val value = convertAnnotationValue(valueContext)
        if (value == true) {
            attributes.addAttribute(LimeAttributeType.INTERNAL)
            return
        }

        val valueList = if (value is List<*>) value else listOf(value)
        valueList.filterIsInstance<String>().mapNotNull { LimeAttributeType.fromString[it] }.forEach {
            attributes.addAttribute(it, LimeAttributeValueType.INTERNAL)
        }
    }

    private fun convertAnnotationType(ctx: LimeParser.AnnotationContext) =
        when (val id = ctx.simpleId().text) {
            "Async" -> LimeAttributeType.ASYNC
            "Cached" -> LimeAttributeType.CACHED
            "Cpp" -> LimeAttributeType.CPP
            "Dart" -> LimeAttributeType.DART
            "Deprecated" -> LimeAttributeType.DEPRECATED
            "Equatable" -> LimeAttributeType.EQUATABLE
            "EnableIf" -> LimeAttributeType.ENABLE_IF
            "Immutable" -> LimeAttributeType.IMMUTABLE
            "Internal" -> LimeAttributeType.INTERNAL
            "Java" -> LimeAttributeType.JAVA
            "NoCache" -> LimeAttributeType.NO_CACHE
            "Optimized" -> LimeAttributeType.OPTIMIZED
            "Swift" -> LimeAttributeType.SWIFT
            "Serializable" -> LimeAttributeType.SERIALIZABLE
            "Skip" -> LimeAttributeType.SKIP
            else -> throw LimeLoadingException("Unsupported attribute: '$id'")
        }

    private fun convertAnnotationValueType(
        ctx: LimeParser.AnnotationValueContext,
        attributeType: LimeAttributeType
    ): LimeAttributeValueType {
        val id = ctx.simpleId()?.text ?: return (
            attributeType.defaultValueType
                ?: throw LimeLoadingException("Attribute type $attributeType does not support values")
            )
        return when (id) {
            "Name" -> LimeAttributeValueType.NAME
            "Accessors" -> LimeAttributeValueType.ACCESSORS
            "Attribute" -> LimeAttributeValueType.ATTRIBUTE
            "Const" -> LimeAttributeValueType.CONST
            "CString" -> LimeAttributeValueType.CSTRING
            "Default" -> LimeAttributeValueType.DEFAULT
            "EnableIf" -> LimeAttributeValueType.ENABLE_IF
            "FullName" -> LimeAttributeValueType.FULL_NAME
            "FunctionName" -> LimeAttributeValueType.FUNCTION_NAME
            "Internal" -> LimeAttributeValueType.INTERNAL
            "Label" -> LimeAttributeValueType.LABEL
            "Message" -> LimeAttributeValueType.MESSAGE
            "OptionSet" -> LimeAttributeValueType.OPTION_SET
            "ParameterDefaults" -> LimeAttributeValueType.PARAMETER_DEFAULTS
            "PositionalDefaults" -> LimeAttributeValueType.POSITIONAL_DEFAULTS
            "Public" -> LimeAttributeValueType.PUBLIC
            "Ref" -> LimeAttributeValueType.REF
            "Skip" -> LimeAttributeValueType.SKIP
            "Tag" -> LimeAttributeValueType.TAG
            "Type" -> LimeAttributeValueType.TYPE
            "ToString" -> LimeAttributeValueType.TO_STRING
            "Weak" -> LimeAttributeValueType.WEAK
            else -> throw LimeLoadingException("Unsupported attribute value: '$id'")
        }
    }

    private fun convertAnnotationValue(valueContext: LimeParser.AnnotationValueContext): Any {
        val literals = valueContext.singleLineStringLiteral()
        return when {
            literals.isEmpty() -> true
            literals.size == 1 -> convertSingleLineStringLiteral(literals.first())
            else -> literals.map { convertSingleLineStringLiteral(it) }
        }
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

    fun convertMultiLineStringLiteral(ctx: LimeParser.MultiLineStringLiteralContext) =
        ctx.multiLineStringContent().joinToString(separator = "") {
            it.MultiLineStrText()?.text ?: it.MultiLineStringQuote().text
        }

    private fun makeSafeString(str: String) = str.trim().replace("\n", "").replace("\r", "")

    private val durationLiteralRegex = """(\d+)([dhimnsu]+)""".toRegex()

    fun convertDurationLiteral(limeTypeRef: LimeTypeRef, isNegative: Boolean, literalText: String): LimeValue.Duration {
        val match = durationLiteralRegex.matchEntire(literalText)
        val valueText = match?.groups?.get(1)?.value
            ?: throw LimeLoadingException("Invalid `Duration` literal: '$literalText'")
        val timeUnitText = match.groups.get(2)?.value
            ?: throw LimeLoadingException("Invalid `Duration` literal: '$literalText'")
        val timeUnit = LimeValue.Duration.TimeUnit.fromString[timeUnitText]
            ?: throw LimeLoadingException("Unsupported time unit: '$timeUnitText'")
        val sign = if (isNegative) "-" else ""
        return LimeValue.Duration(limeTypeRef, sign + valueText, timeUnit)
    }
}
