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

package com.here.genium.loader

import com.here.genium.antlr.LimeParser
import com.here.genium.antlr.LimedocLexer
import com.here.genium.antlr.LimedocParser
import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.model.lime.LimeAmbiguousEnumeratorRef
import com.here.genium.model.lime.LimeAmbiguousTypeRef
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributeValueType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeComment
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeThrownType
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePositionalTypeRef
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReferenceResolver
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeAlias
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeValue.Special.ValueId
import com.here.genium.model.lime.LimeVisibility
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.misc.ParseCancellationException
import org.antlr.v4.runtime.tree.ParseTreeWalker
import java.util.LinkedList

internal class AntlrLimeModelBuilder(
    private val referenceResolver: LimeReferenceResolver
) : AntlrLimeModelBuilderBase(ModelBuilderContextStack()) {

    private val pathStack = LinkedList<LimePath>()
    private val visibilityStack = LinkedList<LimeVisibility>()
    private val structuredCommentsStack = LinkedList<LimeStructuredComment>()

    private val imports = mutableListOf<LimePath>()
    private val typeMapper =
        AntlrTypeMapper(imports, referenceResolver.referenceMap) { this.convertSimpleId(it) }

    private val currentPath
        get() = pathStack.peek()
    private val currentVisibility
        get() = visibilityStack.peek()

    // Overrides

    override fun exitLimeFile(ctx: LimeParser.LimeFileContext) {
        getPreviousResults(LimeNamedElement::class.java).forEach { storeResult(it) }
    }

    override fun exitPackageHeader(ctx: LimeParser.PackageHeaderContext) {
        pathStack.push(
            LimePath(ctx.identifier().simpleId().map { convertSimpleId(it) }, emptyList())
        )
    }

    override fun exitImportHeader(ctx: LimeParser.ImportHeaderContext) {
        val pathComponents = ctx.identifier().simpleId().map { convertSimpleId(it) }
        imports += LimePath(pathComponents.dropLast(1), listOf(pathComponents.last()))
    }

    override fun enterContainer(ctx: LimeParser.ContainerContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitContainer(ctx: LimeParser.ContainerContext) {
        val parentRef = ctx.identifier()?.let {
            LimeAmbiguousTypeRef(
                relativePath = it.simpleId().map { simpleId -> convertSimpleId(simpleId) },
                parentPaths = listOf(currentPath) + currentPath.allParents,
                imports = imports,
                referenceMap = referenceResolver.referenceMap
            )
        }
        val limeElement = LimeContainer(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            type = if (ctx.INTERFACE() != null) ContainerType.INTERFACE else ContainerType.CLASS,
            parent = parentRef,
            structs = getPreviousResults(LimeStruct::class.java),
            enumerations = getPreviousResults(LimeEnumeration::class.java),
            constants = getPreviousResults(LimeConstant::class.java),
            typeAliases = getPreviousResults(LimeTypeAlias::class.java),
            functions = getPreviousResults(LimeFunction::class.java),
            properties = getPreviousResults(LimeProperty::class.java),
            exceptions = getPreviousResults(LimeException::class.java)
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterTypes(ctx: LimeParser.TypesContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitTypes(ctx: LimeParser.TypesContext) {
        val limeElement = LimeContainer(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            type = ContainerType.TYPE_COLLECTION,
            structs = getPreviousResults(LimeStruct::class.java),
            enumerations = getPreviousResults(LimeEnumeration::class.java),
            constants = getPreviousResults(LimeConstant::class.java),
            typeAliases = getPreviousResults(LimeTypeAlias::class.java),
            exceptions = getPreviousResults(LimeException::class.java)
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterFunction(ctx: LimeParser.FunctionContext) {
        val idx = when (val ctxParent = ctx.parent) {
            is LimeParser.ContainerContext -> ctxParent.function().indexOf(ctx)
            is LimeParser.StructContext -> ctxParent.function().indexOf(ctx)
            else -> throw LimeLoadingException("Invalid syntax context: '$ctx'")
        }
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility(), idx.toString())
        structuredCommentsStack.push(parseStructuredComment(ctx.docComment(), ctx))
    }

    override fun exitFunction(ctx: LimeParser.FunctionContext) {
        val returnType = ctx.returnType()
            ?.let {
                LimeReturnType(
                    typeMapper.mapTypeRef(currentPath, it.typeRef()),
                    getComment("return", it.docComment(), it)
                )
            } ?: LimeReturnType.VOID
        val exceptionType =
            ctx.throwsClause()?.let {
                LimeThrownType(
                    typeMapper.mapTypeRef(currentPath, it.typeRef()),
                    getComment("throws", it.docComment(), it)
                )
            }
        val limeElement = LimeFunction(
            path = currentPath,
            visibility = currentVisibility,
            comment = structuredCommentsStack.peek().description,
            attributes = convertAnnotations(ctx.annotation()),
            returnType = returnType,
            parameters = getPreviousResults(LimeParameter::class.java),
            thrownType = exceptionType,
            isStatic = ctx.STATIC() != null
        )

        storeResultAndPopStacks(limeElement)
        structuredCommentsStack.pop()
    }

    override fun enterConstructor(ctx: LimeParser.ConstructorContext) {
        val idx = when (val ctxParent = ctx.parent) {
            is LimeParser.ContainerContext -> ctxParent.constructor().indexOf(ctx)
            is LimeParser.StructContext -> ctxParent.constructor().indexOf(ctx)
            else -> throw LimeLoadingException("Invalid syntax context: '$ctx'")
        }
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility(), idx.toString())
        structuredCommentsStack.push(parseStructuredComment(ctx.docComment(), ctx))
    }

    override fun exitConstructor(ctx: LimeParser.ConstructorContext) {
        val classTypeRef =
            LimeLazyTypeRef(currentPath.parent.toString(), referenceResolver.referenceMap)
        val exceptionType =
            ctx.throwsClause()?.let {
                LimeThrownType(
                    typeMapper.mapTypeRef(currentPath, it.typeRef()),
                    getComment("throws", it.docComment(), it)
                )
            }
        val limeElement = LimeFunction(
            path = currentPath,
            visibility = currentVisibility,
            comment = structuredCommentsStack.peek().description,
            attributes = convertAnnotations(ctx.annotation()),
            returnType = LimeReturnType(classTypeRef),
            parameters = getPreviousResults(LimeParameter::class.java),
            thrownType = exceptionType,
            isStatic = true,
            isConstructor = true
        )

        storeResultAndPopStacks(limeElement)
        structuredCommentsStack.pop()
    }

    override fun enterParameter(ctx: LimeParser.ParameterContext) {
        pushPathAndVisibility(ctx.simpleId(), null)
    }

    override fun exitParameter(ctx: LimeParser.ParameterContext) {
        val limeElement = LimeParameter(
            path = currentPath,
            comment = getComment("param", currentPath.name, ctx.docComment(), ctx),
            attributes = convertAnnotations(ctx.annotation()),
            typeRef = typeMapper.mapTypeRef(currentPath, ctx.typeRef())
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterProperty(ctx: LimeParser.PropertyContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
        structuredCommentsStack.push(parseStructuredComment(ctx.docComment(), ctx))
    }

    override fun exitProperty(ctx: LimeParser.PropertyContext) {
        val propertyType = typeMapper.mapTypeRef(currentPath, ctx.typeRef())
        val propertyVisibility = currentVisibility

        val getter: LimeFunction
        val setter: LimeFunction?
        val getterPath = currentPath.child("get")
        val getterContext = ctx.getter()
        if (getterContext == null) {
            getter = LimeFunction(
                path = getterPath,
                comment = getComment("get", emptyList(), ctx),
                visibility = propertyVisibility,
                parameters =
                    listOf(LimeParameter(getterPath.child("value"), typeRef = propertyType))
            )
            setter = LimeFunction(
                path = currentPath.child("set"),
                comment = getComment("set", emptyList(), ctx),
                visibility = propertyVisibility,
                returnType = LimeReturnType(propertyType)
            )
        } else {
            getter = LimeFunction(
                path = getterPath,
                visibility = convertVisibility(getterContext.visibility(), propertyVisibility),
                comment = getComment("get", getterContext.docComment(), getterContext),
                attributes = convertAnnotations(getterContext.annotation()),
                parameters =
                    listOf(LimeParameter(getterPath.child("value"), typeRef = propertyType))
            )
            setter = ctx.setter()?.let {
                LimeFunction(
                    path = currentPath.child("set"),
                    visibility = convertVisibility(it.visibility(), propertyVisibility),
                    comment = getComment("set", it.docComment(), it),
                    attributes = convertAnnotations(it.annotation()),
                    returnType = LimeReturnType(propertyType)
                )
            }
        }

        val limeElement = LimeProperty(
            path = currentPath,
            visibility = propertyVisibility,
            comment = structuredCommentsStack.peek().description,
            attributes = convertAnnotations(ctx.annotation()),
            typeRef = propertyType,
            getter = getter,
            setter = setter,
            isStatic = ctx.STATIC() != null
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterStruct(ctx: LimeParser.StructContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
        structuredCommentsStack.push(parseStructuredComment(ctx.docComment(), ctx))
    }

    override fun exitStruct(ctx: LimeParser.StructContext) {
        val limeElement = LimeStruct(
            path = currentPath,
            visibility = currentVisibility,
            comment = structuredCommentsStack.peek().description,
            attributes = convertAnnotations(ctx.annotation()),
            fields = getPreviousResults(LimeField::class.java),
            functions = getPreviousResults(LimeFunction::class.java),
            constants = getPreviousResults(LimeConstant::class.java),
            constructorComment = structuredCommentsStack.peek().getTagBlock("constructor")
        )

        storeResultAndPopStacks(limeElement)
        structuredCommentsStack.pop()
    }

    override fun enterField(ctx: LimeParser.FieldContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitField(ctx: LimeParser.FieldContext) {
        val limeTypeRef = typeMapper.mapTypeRef(currentPath, ctx.typeRef())
        val limeElement = LimeField(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            typeRef = limeTypeRef,
            defaultValue = ctx.literalConstant()?.let { convertLiteralConstant(limeTypeRef, it) }
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterEnumeration(ctx: LimeParser.EnumerationContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitEnumeration(ctx: LimeParser.EnumerationContext) {
        val limeElement = LimeEnumeration(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            enumerators = getPreviousResults(LimeEnumerator::class.java)
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterEnumerator(ctx: LimeParser.EnumeratorContext) {
        pushPathAndVisibility(ctx.simpleId(), null)
    }

    override fun exitEnumerator(ctx: LimeParser.EnumeratorContext) {
        val limeElement = LimeEnumerator(
            path = currentPath,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            value = ctx.literalConstant()?.let { convertLiteralConstant(LimeBasicTypeRef.INT, it) }
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterConstant(ctx: LimeParser.ConstantContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitConstant(ctx: LimeParser.ConstantContext) {
        val limeTypeRef = typeMapper.mapTypeRef(currentPath, ctx.typeRef())
        val limeElement = LimeConstant(
            path = currentPath,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            visibility = currentVisibility,
            attributes = convertAnnotations(ctx.annotation()),
            typeRef = limeTypeRef,
            value = convertLiteralConstant(limeTypeRef, ctx.literalConstant())
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterTypealias(ctx: LimeParser.TypealiasContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitTypealias(ctx: LimeParser.TypealiasContext) {
        val limeElement = LimeTypeAlias(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            typeRef = typeMapper.mapTypeRef(currentPath, ctx.typeRef())
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterException(ctx: LimeParser.ExceptionContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitException(ctx: LimeParser.ExceptionContext) {
        val limeElement = LimeException(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            errorEnum = typeMapper.mapExplicitTypeRef(currentPath, ctx.identifier())
        )

        storeResultAndPopStacks(limeElement)
    }

    // Private functions

    private fun pushPathAndVisibility(
        simpleId: LimeParser.SimpleIdContext,
        visibility: LimeParser.VisibilityContext?,
        suffix: String = ""
    ) {
        pathStack.push(currentPath.child(convertSimpleId(simpleId), suffix))
        visibilityStack.push(convertVisibility(visibility, visibilityStack.peek()))
    }

    private fun storeResultAndPopStacks(limeElement: LimeNamedElement?) {
        if (limeElement != null) {
            referenceResolver.registerElement(limeElement)
            storeResult(limeElement)
        }
        pathStack.pop()
        visibilityStack.pop()
    }

    private fun convertVisibility(
        ctx: LimeParser.VisibilityContext?,
        parentVisibility: LimeVisibility?
    ): LimeVisibility =
        when {
            parentVisibility == LimeVisibility.INTERNAL -> LimeVisibility.INTERNAL
            ctx == null -> LimeVisibility.PUBLIC
            ctx.OPEN() != null -> LimeVisibility.OPEN
            ctx.INTERNAL() != null -> LimeVisibility.INTERNAL
            else -> LimeVisibility.PUBLIC
        }

    private fun convertAnnotations(
        annotations: List<LimeParser.AnnotationContext>
    ): LimeAttributes {
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
            "Builder" -> LimeAttributeValueType.BUILDER
            "Const" -> LimeAttributeValueType.CONST
            "Label" -> LimeAttributeValueType.LABEL
            "ObjC" -> LimeAttributeValueType.OBJC
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

    private fun convertSingleLineStringLiteral(ctx: LimeParser.SingleLineStringLiteralContext) =
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

    private fun convertLiteralConstant(
        limeTypeRef: LimeTypeRef,
        ctx: LimeParser.LiteralConstantContext
    ): LimeValue {
        when {
            ctx.enumeratorRef() != null -> {
                val enumeratorRef = LimeAmbiguousEnumeratorRef(
                    relativePath =
                        ctx.enumeratorRef().identifier().simpleId().map { convertSimpleId(it) },
                    parentPaths = listOf(currentPath) + currentPath.allParents + imports,
                    imports = imports,
                    referenceMap = referenceResolver.referenceMap
                )
                return LimeValue.Enumerator(limeTypeRef, enumeratorRef)
            }
            ctx.initializerList() != null -> {
                val values = ctx.initializerList().literalConstant()
                    .mapIndexed { idx: Int, childCtx: LimeParser.LiteralConstantContext ->
                        val fieldTypeRef =
                            LimePositionalTypeRef(limeTypeRef, idx, referenceResolver.referenceMap)
                        convertLiteralConstant(fieldTypeRef, childCtx)
                    }
                return LimeValue.InitializerList(limeTypeRef, values)
            }
            ctx.NullLiteral() != null -> return LimeValue.Null(limeTypeRef)
            ctx.EmptyCollectionLiteral() != null ->
                return LimeValue.InitializerList(limeTypeRef, emptyList())
            ctx.NanLiteral() != null -> return LimeValue.Special(limeTypeRef, ValueId.NAN)
            ctx.InfinityLiteral() != null -> return LimeValue.Special(
                limeTypeRef,
                if (ctx.MINUS() != null) ValueId.NEGATIVE_INFINITY else ValueId.INFINITY
            )
        }

        val literalString = when {
            ctx.singleLineStringLiteral() != null ->
                convertSingleLineStringLiteral(ctx.singleLineStringLiteral())
            ctx.BooleanLiteral() != null -> ctx.BooleanLiteral().text
            ctx.IntegerLiteral() != null -> ctx.IntegerLiteral().text
            ctx.DoubleLiteral() != null -> ctx.DoubleLiteral().text
            else -> throw LimeLoadingException("Unsupported literal: '$ctx'")
        }
        return LimeValue.Literal(
            limeTypeRef,
            if (ctx.MINUS() != null) "-$literalString" else literalString
        )
    }

    private fun convertSimpleId(simpleId: LimeParser.SimpleIdContext): String {
        val text = simpleId.text
        return when (text.first()) {
            '`' -> text.drop(1).dropLast(1)
            else -> text
        }
    }

    private fun getComment(
        commentTag: String,
        commentContexts: List<LimeParser.DocCommentContext>,
        currentContext: ParserRuleContext
    ) = getComment(commentTag, "", commentContexts, currentContext)

    private fun getComment(
        commentTag: String,
        elementName: String,
        commentContexts: List<LimeParser.DocCommentContext>,
        currentContext: ParserRuleContext
    ): LimeComment {
        val commentFromParent = structuredCommentsStack.peek().getTagBlock(commentTag, elementName)
        val ownComment = parseStructuredComment(commentContexts, currentContext).description
        return when {
            commentFromParent.isEmpty() -> ownComment
            ownComment.isEmpty() -> commentFromParent
            else -> {
                val position = currentContext.getStart()
                throw ParseCancellationException(
                    "line ${position.line}:${position.charPositionInLine}, " +
                            "redundant documentation comment defined"
                )
            }
        }
    }

    private fun parseStructuredComment(
        commentContexts: List<LimeParser.DocCommentContext>,
        ctx: ParserRuleContext
    ): LimeStructuredComment {
        val commentString = commentContexts.joinToString(separator = "\n") {
            when {
                it.DELIMITED_COMMENT_OPEN() != null -> it.DelimitedCommentText()?.text?.dropLast(2)
                    ?.split('\n')?.joinToString("\n") { line -> line.trim() } ?: ""
                it.LINE_COMMENT_OPEN() != null -> it.LineCommentText()?.text?.trim() ?: ""
                else -> ""
            }
        }
        val lexer = LimedocLexer(CharStreams.fromString(commentString))
        val parser = LimedocParser(CommonTokenStream(lexer))
        parser.removeErrorListeners()
        parser.addErrorListener(ThrowingErrorListener(ctx.getStart().line - 1))

        val builder = AntlrLimedocBuilder()
        ParseTreeWalker.DEFAULT.walk(builder, parser.documentation())

        return builder.result
    }
}
