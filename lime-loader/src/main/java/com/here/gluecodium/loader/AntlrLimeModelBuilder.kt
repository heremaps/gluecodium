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

package com.here.gluecodium.loader

import com.here.gluecodium.antlr.LimeParser
import com.here.gluecodium.antlr.LimedocLexer
import com.here.gluecodium.antlr.LimedocParser
import com.here.gluecodium.common.ModelBuilderContextStack
import com.here.gluecodium.model.lime.LimeAmbiguousEnumeratorRef
import com.here.gluecodium.model.lime.LimeAmbiguousTypeRef
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePositionalTypeRef
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReferenceResolver
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeValue.Special.ValueId
import com.here.gluecodium.model.lime.LimeVisibility
import java.util.LinkedList
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.misc.ParseCancellationException
import org.antlr.v4.runtime.tree.ParseTreeWalker

internal class AntlrLimeModelBuilder(
    private val referenceResolver: LimeReferenceResolver,
    contextStack: ModelBuilderContextStack<LimeNamedElement> = ModelBuilderContextStack()
) : AntlrLimeModelBuilderBase(contextStack) {

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

    val collectedImports: List<LimePath>
        get() = imports

    // Overrides

    override fun exitLimeFile(ctx: LimeParser.LimeFileContext) {
        getPreviousResults(LimeNamedElement::class.java).forEach { storeResult(it) }
    }

    override fun exitPackageHeader(ctx: LimeParser.PackageHeaderContext) {
        pathStack.push(
            LimePath(ctx.identifier().simpleId().map { convertSimpleId(it) }, emptyList())
        )
    }

    override fun exitImportStatement(ctx: LimeParser.ImportStatementContext) {
        val pathComponents = ctx.identifier().simpleId().map { convertSimpleId(it) }
        imports += LimePath(pathComponents.dropLast(1), listOf(pathComponents.last()))
    }

    override fun exitImportHeader(ctx: LimeParser.ImportHeaderContext) {
        val ambiguousImports = imports.groupBy { it.name }.values.filter { it.size > 1 }
        if (ambiguousImports.isNotEmpty()) {
            throw ParseCancellationException(
                "Ambiguous imports: " + ambiguousImports.joinToString()
            )
        }
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
        val limeElement: LimeContainerWithInheritance
        if (ctx.Interface() == null) {
            limeElement = LimeClass(
                path = currentPath,
                visibility = currentVisibility,
                comment = parseStructuredComment(ctx.docComment(), ctx).description,
                attributes = convertAnnotations(ctx.annotation()),
                parent = parentRef,
                structs = getPreviousResults(LimeStruct::class.java),
                enumerations = getPreviousResults(LimeEnumeration::class.java),
                constants = getPreviousResults(LimeConstant::class.java),
                typeAliases = getPreviousResults(LimeTypeAlias::class.java),
                functions = getPreviousResults(LimeFunction::class.java),
                properties = getPreviousResults(LimeProperty::class.java),
                exceptions = getPreviousResults(LimeException::class.java),
                classes = getPreviousResults(LimeClass::class.java),
                interfaces = getPreviousResults(LimeInterface::class.java),
                lambdas = getPreviousResults(LimeLambda::class.java)
            )
        } else {
            limeElement = LimeInterface(
                path = currentPath,
                visibility = currentVisibility,
                comment = parseStructuredComment(ctx.docComment(), ctx).description,
                attributes = convertAnnotations(ctx.annotation()),
                parent = parentRef,
                structs = getPreviousResults(LimeStruct::class.java),
                enumerations = getPreviousResults(LimeEnumeration::class.java),
                constants = getPreviousResults(LimeConstant::class.java),
                typeAliases = getPreviousResults(LimeTypeAlias::class.java),
                functions = getPreviousResults(LimeFunction::class.java),
                properties = getPreviousResults(LimeProperty::class.java),
                exceptions = getPreviousResults(LimeException::class.java),
                classes = getPreviousResults(LimeClass::class.java),
                interfaces = getPreviousResults(LimeInterface::class.java),
                lambdas = getPreviousResults(LimeLambda::class.java)
            )
        }

        storeResultAndPopStacks(limeElement)
    }

    override fun enterTypes(ctx: LimeParser.TypesContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitTypes(ctx: LimeParser.TypesContext) {
        val limeElement = LimeTypesCollection(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
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
            isStatic = ctx.Static() != null
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
        val propertyIsStatic = ctx.Static() != null

        val getter: LimeFunction
        val setter: LimeFunction?
        val getterPath = currentPath.child("get")
        val getterContext = ctx.getter()
        if (getterContext == null) {
            getter = LimeFunction(
                path = getterPath,
                comment = getComment("get", emptyList(), ctx),
                visibility = propertyVisibility,
                returnType = LimeReturnType(propertyType),
                isStatic = propertyIsStatic
            )
            setter = LimeFunction(
                path = currentPath.child("set"),
                comment = getComment("set", emptyList(), ctx),
                visibility = propertyVisibility,
                parameters =
                    listOf(LimeParameter(getterPath.child("value"), typeRef = propertyType)),
                isStatic = propertyIsStatic
            )
        } else {
            getter = LimeFunction(
                path = getterPath,
                visibility = convertVisibility(getterContext.visibility(), propertyVisibility),
                comment = getComment("get", getterContext.docComment(), getterContext),
                attributes = convertAnnotations(getterContext.annotation()),
                returnType = LimeReturnType(propertyType),
                isStatic = propertyIsStatic
            )
            setter = ctx.setter()?.let {
                LimeFunction(
                    path = currentPath.child("set"),
                    visibility = convertVisibility(it.visibility(), propertyVisibility),
                    comment = getComment("set", it.docComment(), it),
                    attributes = convertAnnotations(it.annotation()),
                    parameters =
                        listOf(LimeParameter(getterPath.child("value"), typeRef = propertyType)),
                    isStatic = propertyIsStatic
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
            isStatic = propertyIsStatic
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
            errorType = typeMapper.mapSimpleTypeRef(currentPath, ctx.simpleTypeRef())
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterLambda(ctx: LimeParser.LambdaContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitLambda(ctx: LimeParser.LambdaContext) {
        val parameters = ctx.lambdaParameter().map {
            LimeLambdaParameter(
                typeMapper.mapTypeRef(currentPath, it.typeRef()),
                convertAnnotations(it.annotation())
            )
        }
        val limeElement = LimeLambda(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = convertAnnotations(ctx.annotation()),
            parameters = parameters,
            returnType = typeMapper.mapTypeRef(currentPath, ctx.typeRef())
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

    private fun storeResultAndPopStacks(limeFunction: LimeFunction) {
        val ambiguousKey = limeFunction.path.withSuffix("").toString()
        referenceResolver.registerElement(ambiguousKey, limeFunction)
        storeResultAndPopStacks(limeFunction as LimeNamedElement)
    }

    private fun convertVisibility(
        ctx: LimeParser.VisibilityContext?,
        parentVisibility: LimeVisibility?
    ): LimeVisibility {
        val isInternal = parentVisibility == LimeVisibility.INTERNAL || ctx?.Internal() != null
        val isOpen = ctx?.Open() != null
        return when {
            isOpen && isInternal -> LimeVisibility.OPEN_INTERNAL
            isOpen -> LimeVisibility.OPEN
            isInternal -> LimeVisibility.INTERNAL
            else -> LimeVisibility.PUBLIC
        }
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
            "Accessors" -> LimeAttributeValueType.ACCESSORS
            "Builder" -> LimeAttributeValueType.BUILDER
            "Const" -> LimeAttributeValueType.CONST
            "Extension" -> LimeAttributeValueType.EXTENSION
            "FunctionName" -> LimeAttributeValueType.FUNCTION_NAME
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
            ctx.structInitializer() != null -> {
                val values = ctx.structInitializer().literalConstant()
                    .mapIndexed { idx: Int, childCtx: LimeParser.LiteralConstantContext ->
                        val fieldTypeRef =
                            LimePositionalTypeRef(limeTypeRef, idx, referenceResolver.referenceMap)
                        convertLiteralConstant(fieldTypeRef, childCtx)
                    }
                return LimeValue.InitializerList(limeTypeRef, values)
            }
            ctx.listInitializer() != null -> {
                val values = ctx.listInitializer().literalConstant().map {
                    val elementTypeRef =
                        LimePositionalTypeRef(limeTypeRef, 0, referenceResolver.referenceMap)
                    convertLiteralConstant(elementTypeRef, it)
                }
                return LimeValue.InitializerList(limeTypeRef, values)
            }
            ctx.mapInitializer() != null -> {
                val values = ctx.mapInitializer().keyValuePair().map {
                    val keyTypeRef =
                        LimePositionalTypeRef(limeTypeRef, 0, referenceResolver.referenceMap)
                    val valueTypeRef =
                        LimePositionalTypeRef(limeTypeRef, 1, referenceResolver.referenceMap)
                    LimeValue.KeyValuePair(
                        convertLiteralConstant(keyTypeRef, it.literalConstant().first()),
                        convertLiteralConstant(valueTypeRef, it.literalConstant().last())
                    )
                }
                return LimeValue.InitializerList(limeTypeRef, values)
            }
            ctx.NullLiteral() != null -> return LimeValue.Null(limeTypeRef)
            ctx.NanLiteral() != null -> return LimeValue.Special(limeTypeRef, ValueId.NAN)
            ctx.InfinityLiteral() != null -> return LimeValue.Special(
                limeTypeRef,
                if (ctx.Minus() != null) ValueId.NEGATIVE_INFINITY else ValueId.INFINITY
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
            if (ctx.Minus() != null) "-$literalString" else literalString
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
                it.DelimitedCommentOpen() != null -> it.DelimitedCommentText()?.text?.dropLast(2)
                    ?.split('\n')?.joinToString("\n") { line -> line.trim() } ?: ""
                it.LineCommentOpen() != null -> it.LineCommentText()?.text?.trim() ?: ""
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
