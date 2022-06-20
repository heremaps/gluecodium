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
import com.here.gluecodium.common.ModelBuilderContextStack
import com.here.gluecodium.model.lime.LimeAmbiguousConstantRef
import com.here.gluecodium.model.lime.LimeAmbiguousTypeRef
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeLazyFieldRef
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePositionalEnumeratorRef
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
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.misc.ParseCancellationException
import java.util.LinkedList

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
        val parentTypes = ctx.parentTypes()?.identifier()?.map {
            LimeAmbiguousTypeRef(
                relativePath = it.simpleId().map { simpleId -> convertSimpleId(simpleId) },
                parentPaths = listOf(currentPath) + currentPath.allParents,
                imports = imports,
                referenceMap = referenceResolver.referenceMap
            )
        } ?: emptyList()
        val comment = parseStructuredComment(ctx.docComment(), ctx).description
        val attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation())
        val externalDescriptor = parseExternalDescriptor(ctx.externalDescriptor(), ctx.annotation())

        val limeElement = if (ctx.Interface() == null) {
            LimeClass(
                path = currentPath,
                visibility = currentVisibility,
                comment = comment,
                attributes = attributes,
                external = externalDescriptor,
                parents = parentTypes,
                structs = getPreviousResults(LimeStruct::class.java),
                enumerations = getPreviousResults(LimeEnumeration::class.java),
                constants = getPreviousResults(LimeConstant::class.java),
                typeAliases = getPreviousResults(LimeTypeAlias::class.java),
                functions = getPreviousResults(LimeFunction::class.java),
                properties = getPreviousResults(LimeProperty::class.java),
                exceptions = getPreviousResults(LimeException::class.java),
                classes = getPreviousResults(LimeClass::class.java),
                interfaces = getPreviousResults(LimeInterface::class.java),
                lambdas = getPreviousResults(LimeLambda::class.java),
                isOpen = ctx.Open() != null
            )
        } else {
            LimeInterface(
                path = currentPath,
                visibility = currentVisibility,
                comment = comment,
                attributes = attributes,
                external = externalDescriptor,
                parents = parentTypes,
                structs = getPreviousResults(LimeStruct::class.java),
                enumerations = getPreviousResults(LimeEnumeration::class.java),
                constants = getPreviousResults(LimeConstant::class.java),
                typeAliases = getPreviousResults(LimeTypeAlias::class.java),
                functions = getPreviousResults(LimeFunction::class.java),
                properties = getPreviousResults(LimeProperty::class.java),
                exceptions = getPreviousResults(LimeException::class.java),
                classes = getPreviousResults(LimeClass::class.java),
                interfaces = getPreviousResults(LimeInterface::class.java),
                lambdas = getPreviousResults(LimeLambda::class.java),
                isNarrow = ctx.Narrow() != null
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
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
            structs = getPreviousResults(LimeStruct::class.java),
            enumerations = getPreviousResults(LimeEnumeration::class.java),
            constants = getPreviousResults(LimeConstant::class.java),
            typeAliases = getPreviousResults(LimeTypeAlias::class.java),
            exceptions = getPreviousResults(LimeException::class.java)
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterFunction(ctx: LimeParser.FunctionContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
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
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
            returnType = returnType,
            parameters = getPreviousResults(LimeParameter::class.java),
            thrownType = exceptionType,
            isStatic = ctx.Static() != null
        )

        storeResultAndPopStacks(limeElement)
        structuredCommentsStack.pop()
    }

    override fun enterConstructor(ctx: LimeParser.ConstructorContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
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
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
            returnType = LimeReturnType(classTypeRef),
            parameters = getPreviousResults(LimeParameter::class.java),
            thrownType = exceptionType,
            isStatic = true,
            isConstructor = true
        )

        storeResultAndPopStacks(limeElement)
        structuredCommentsStack.pop()
    }

    override fun enterFieldConstructor(ctx: LimeParser.FieldConstructorContext) {
        val idx = when (val ctxParent = ctx.parent) {
            is LimeParser.StructContext -> ctxParent.fieldConstructor().indexOf(ctx)
            else -> throw LimeLoadingException("Invalid syntax context: '$ctx'")
        }
        pathStack.push(currentPath.child("", idx.toString()))
        visibilityStack.push(convertVisibility(ctx.visibility(), visibilityStack.peek()))
        structuredCommentsStack.push(parseStructuredComment(ctx.docComment(), ctx))
    }

    override fun exitFieldConstructor(ctx: LimeParser.FieldConstructorContext) {
        val structTypeRef = LimeLazyTypeRef(currentPath.parent.toString(), referenceResolver.referenceMap)
        val fieldRefs = ctx.fieldParameter().map {
            val attributes = AntlrLimeConverter.convertAnnotations(currentPath, it.annotation())
            LimeLazyFieldRef(structTypeRef, convertSimpleId(it.simpleId()), attributes)
        }
        val limeElement = LimeFieldConstructor(
            path = currentPath,
            visibility = currentVisibility,
            comment = structuredCommentsStack.peek().description,
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
            structRef = structTypeRef,
            fieldRefs = fieldRefs,
        )

        storeResultAndPopStacks(limeElement)
        structuredCommentsStack.pop()
    }

    override fun enterParameter(ctx: LimeParser.ParameterContext) {
        val newPath = currentPath.child(convertSimpleId(ctx.simpleId()))
        // Parameters retain the disambiguation suffix of the function.
        pathStack.push(newPath)
        visibilityStack.push(convertVisibility(null, visibilityStack.peek()))
    }

    override fun exitParameter(ctx: LimeParser.ParameterContext) {
        val limeElement = LimeParameter(
            path = currentPath,
            comment = getComment("param", currentPath.name, ctx.docComment(), ctx),
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
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
        val propertyComment = structuredCommentsStack.peek().description
        val propertyAttributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation())

        val getter: LimeFunction
        val setter: LimeFunction?
        val getterPath = currentPath.child("get")
        val getterContext = ctx.getter()
        if (getterContext == null) {
            getter = LimeFunction(
                path = getterPath,
                comment = getComment("get", emptyList(), ctx).withExcluded(propertyComment.isExcluded),
                attributes = AntlrLimeConverter.convertAnnotations(currentPath, emptyList(), propertyAttributes),
                visibility = propertyVisibility,
                returnType = LimeReturnType(propertyType, propertyComment),
                isStatic = propertyIsStatic
            )
            setter = LimeFunction(
                path = currentPath.child("set"),
                comment = getComment("set", emptyList(), ctx).withExcluded(propertyComment.isExcluded),
                attributes = AntlrLimeConverter.convertAnnotations(currentPath, emptyList(), propertyAttributes),
                visibility = propertyVisibility,
                parameters = listOf(
                    LimeParameter(
                        getterPath.child("value"),
                        propertyComment,
                        typeRef = propertyType
                    )
                ),
                isStatic = propertyIsStatic
            )
        } else {
            val getterAttributes =
                AntlrLimeConverter.convertAnnotations(currentPath, getterContext.annotation(), propertyAttributes)
            val getterExternalDescriptor =
                parseExternalDescriptor(getterContext.externalDescriptor(), getterContext.annotation())
            val getterComment = getComment("get", getterContext.docComment(), getterContext)
            getter = LimeFunction(
                path = getterPath,
                visibility = propertyVisibility,
                comment = getterComment.withExcluded(propertyComment.isExcluded),
                attributes = getterAttributes,
                external = getterExternalDescriptor,
                returnType = LimeReturnType(propertyType, propertyComment),
                isStatic = propertyIsStatic
            )
            setter = ctx.setter()?.let {
                val setterAttributes =
                    AntlrLimeConverter.convertAnnotations(currentPath, it.annotation(), propertyAttributes)
                val setterExternalDescriptor =
                    parseExternalDescriptor(it.externalDescriptor(), it.annotation())
                val setterComment = getComment("set", it.docComment(), it)
                LimeFunction(
                    path = currentPath.child("set"),
                    visibility = propertyVisibility,
                    comment = setterComment.withExcluded(propertyComment.isExcluded),
                    attributes = setterAttributes,
                    external = setterExternalDescriptor,
                    parameters = listOf(
                        LimeParameter(
                            getterPath.child("value"),
                            propertyComment,
                            typeRef = propertyType
                        )
                    ),
                    isStatic = propertyIsStatic
                )
            }
        }

        val limeElement = LimeProperty(
            path = currentPath,
            visibility = propertyVisibility,
            comment = propertyComment,
            attributes = propertyAttributes,
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
        val attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation())
        val externalDescriptor = parseExternalDescriptor(ctx.externalDescriptor(), ctx.annotation())
        val limeElement = LimeStruct(
            path = currentPath,
            visibility = currentVisibility,
            comment = structuredCommentsStack.peek().description,
            attributes = attributes,
            external = externalDescriptor,
            fields = getPreviousResults(LimeField::class.java),
            typeAliases = getPreviousResults(LimeTypeAlias::class.java),
            functions = getPreviousResults(LimeFunction::class.java),
            exceptions = getPreviousResults(LimeException::class.java),
            constants = getPreviousResults(LimeConstant::class.java),
            constructorComment = structuredCommentsStack.peek().getTagBlock("constructor"),
            structs = getPreviousResults(LimeStruct::class.java),
            classes = getPreviousResults(LimeClass::class.java),
            interfaces = getPreviousResults(LimeInterface::class.java),
            enumerations = getPreviousResults(LimeEnumeration::class.java),
            lambdas = getPreviousResults(LimeLambda::class.java),
            fieldConstructors = getPreviousResults(LimeFieldConstructor::class.java)
        )

        storeResultAndPopStacks(limeElement)
        structuredCommentsStack.pop()
    }

    override fun enterField(ctx: LimeParser.FieldContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitField(ctx: LimeParser.FieldContext) {
        val attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation())
        val externalDescriptor = parseExternalDescriptor(ctx.externalDescriptor(), ctx.annotation())
        val limeTypeRef = typeMapper.mapTypeRef(currentPath, ctx.typeRef())

        val defaultValueCtx = ctx.literalConstant()
        val defaultValue = when {
            defaultValueCtx != null -> convertLiteralConstant(limeTypeRef, defaultValueCtx)
            limeTypeRef.isNullable -> LimeValue.Null(limeTypeRef)
            else -> null
        }

        val limeElement = LimeField(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = attributes,
            external = externalDescriptor,
            typeRef = limeTypeRef,
            defaultValue = defaultValue
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterEnumeration(ctx: LimeParser.EnumerationContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
    }

    override fun exitEnumeration(ctx: LimeParser.EnumerationContext) {
        val attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation())
        val externalDescriptor = parseExternalDescriptor(ctx.externalDescriptor(), ctx.annotation())
        val limeElement = LimeEnumeration(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = attributes,
            external = externalDescriptor,
            enumerators = getPreviousResults(LimeEnumerator::class.java)
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterEnumerator(ctx: LimeParser.EnumeratorContext) {
        pushPathAndVisibility(ctx.simpleId(), null)
    }

    override fun exitEnumerator(ctx: LimeParser.EnumeratorContext) {
        val siblings = parentContext?.previousResults?.filterIsInstance<LimeEnumerator>() ?: emptyList()
        val limeElement = LimeEnumerator(
            path = currentPath,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
            explicitValue = ctx.literalConstant()?.let { convertLiteralConstant(LimeBasicTypeRef.INT, it) },
            previous = siblings.lastOrNull()
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
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
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
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
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
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
            errorType = typeMapper.mapSimpleTypeRef(currentPath, ctx.simpleTypeRef())
        )

        storeResultAndPopStacks(limeElement)
    }

    override fun enterLambda(ctx: LimeParser.LambdaContext) {
        pushPathAndVisibility(ctx.simpleId(), ctx.visibility())
        structuredCommentsStack.push(parseStructuredComment(ctx.docComment(), ctx))
    }

    override fun exitLambda(ctx: LimeParser.LambdaContext) {
        val parameters = ctx.lambdaParameter().mapIndexed { index, it ->
            LimeLambdaParameter(
                typeRef = typeMapper.mapTypeRef(currentPath, it.typeRef()),
                comment = getComment("param", "p$index", null, ctx),
                attributes = AntlrLimeConverter.convertAnnotations(
                    currentPath,
                    it.typeRef().simpleTypeRef().annotation()
                )
            )
        }
        val limeElement = LimeLambda(
            path = currentPath,
            visibility = currentVisibility,
            comment = parseStructuredComment(ctx.docComment(), ctx).description,
            attributes = AntlrLimeConverter.convertAnnotations(currentPath, ctx.annotation()),
            parameters = parameters,
            returnType = LimeReturnType(
                typeMapper.mapTypeRef(currentPath, ctx.typeRef()),
                getComment("return", null, ctx)
            )
        )

        storeResultAndPopStacks(limeElement)
    }

    // Private functions

    private fun pushPathAndVisibility(simpleId: LimeParser.SimpleIdContext, visibility: LimeParser.VisibilityContext?) {
        val newPath = currentPath.child(convertSimpleId(simpleId))
        pathStack.push(referenceResolver.computeUniquePath(newPath))
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
    ): LimeVisibility {
        val isInternal = parentVisibility == LimeVisibility.INTERNAL || ctx?.Internal() != null
        return if (isInternal) LimeVisibility.INTERNAL else LimeVisibility.PUBLIC
    }

    private fun convertLiteralConstant(
        limeTypeRef: LimeTypeRef,
        ctx: LimeParser.LiteralConstantContext
    ): LimeValue {
        when {
            ctx.elementRef() != null -> {
                val enumeratorRef = LimeAmbiguousConstantRef(
                    relativePath = ctx.elementRef().identifier().simpleId().map { convertSimpleId(it) },
                    parentPaths = listOf(currentPath) + currentPath.allParents + imports,
                    imports = imports,
                    referenceMap = referenceResolver.referenceMap
                )
                return LimeValue.Constant(limeTypeRef, enumeratorRef)
            }
            ctx.positionalEnumeratorRef() != null -> {
                val enumerationRef = LimeAmbiguousTypeRef(
                    relativePath = ctx.positionalEnumeratorRef().identifier().simpleId().map { convertSimpleId(it) },
                    parentPaths = listOf(currentPath) + currentPath.allParents + imports,
                    imports = imports,
                    referenceMap = referenceResolver.referenceMap
                )
                val enumeratorRef = LimePositionalEnumeratorRef(
                    typeRef = enumerationRef,
                    index = ctx.positionalEnumeratorRef().IntegerLiteral().text.toInt()
                )
                return LimeValue.Constant(limeTypeRef, enumeratorRef)
            }
            ctx.structInitializer() != null -> {
                val values = ctx.structInitializer().literalConstant()
                    .mapIndexed { idx: Int, childCtx: LimeParser.LiteralConstantContext ->
                        val fieldTypeRef = LimePositionalTypeRef(limeTypeRef, idx)
                        convertLiteralConstant(fieldTypeRef, childCtx)
                    }
                return LimeValue.StructInitializer(limeTypeRef, values)
            }
            ctx.listInitializer() != null -> {
                val values = ctx.listInitializer().literalConstant().map {
                    val elementTypeRef = LimePositionalTypeRef(limeTypeRef, 0)
                    convertLiteralConstant(elementTypeRef, it)
                }
                return LimeValue.InitializerList(limeTypeRef, values)
            }
            ctx.mapInitializer() != null -> {
                val values = ctx.mapInitializer().keyValuePair().map {
                    val keyTypeRef = LimePositionalTypeRef(limeTypeRef, 0)
                    val valueTypeRef = LimePositionalTypeRef(limeTypeRef, 1)
                    LimeValue.KeyValuePair(
                        convertLiteralConstant(keyTypeRef, it.literalConstant().first()),
                        convertLiteralConstant(valueTypeRef, it.literalConstant().last())
                    )
                }
                return LimeValue.InitializerList(limeTypeRef, values)
            }
            ctx.durationLiteral() != null -> {
                val isNegative = ctx.Minus() != null
                val literalText = ctx.durationLiteral().DurationLiteral().text
                return AntlrLimeConverter.convertDurationLiteral(limeTypeRef, isNegative, literalText)
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
                AntlrLimeConverter.convertSingleLineStringLiteral(ctx.singleLineStringLiteral())
            ctx.multiLineStringLiteral() != null ->
                AntlrLimeConverter.convertMultiLineStringLiteral(ctx.multiLineStringLiteral())
            ctx.BooleanLiteral() != null -> ctx.BooleanLiteral().text
            ctx.IntegerLiteral() != null -> ctx.IntegerLiteral().text
            ctx.DoubleLiteral() != null -> ctx.DoubleLiteral().text
            else -> throw LimeLoadingException("Unsupported literal: '$ctx'")
        }
        return LimeValue.Literal(limeTypeRef, if (ctx.Minus() != null) "-$literalString" else literalString)
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
        commentContexts: List<LimeParser.DocCommentContext>?,
        currentContext: ParserRuleContext
    ) = getComment(commentTag, "", commentContexts, currentContext)

    private fun getComment(
        commentTag: String,
        elementName: String,
        commentContexts: List<LimeParser.DocCommentContext>?,
        currentContext: ParserRuleContext
    ): LimeComment {
        val commentFromParent = structuredCommentsStack.peek().getTagBlock(commentTag, elementName)
        val ownComment =
            commentContexts?.let { parseStructuredComment(it, currentContext).description }
                ?: LimeComment(currentPath)
        return when {
            commentFromParent.isEmpty() -> ownComment
            ownComment.isEmpty() -> {
                val elementPath =
                    if (elementName.isNotEmpty()) currentPath else currentPath.child("@$commentTag")
                commentFromParent.withPath(elementPath)
            }
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
                it.DelimitedCommentOpen() != null ->
                    it.DelimitedCommentText()?.text?.dropLast(2) ?: ""
                it.LineCommentOpen() != null ->
                    it.LineCommentText()?.text?.trimEnd { ch -> ch == '\n' } ?: ""
                else -> ""
            }
        }.trimIndent().split('\n').joinToString("\n") { line -> line.trimEnd() }

        return AntlrLimeConverter.parseStructuredComment(commentString, ctx.getStart().line, currentPath)
    }

    private fun parseExternalDescriptor(
        ctx: LimeParser.ExternalDescriptorContext?,
        annotations: List<LimeParser.AnnotationContext>
    ): LimeExternalDescriptor? {
        val legacyDescriptor = AntlrLimeConverter.convertExternalDescriptor(annotations)
        if (ctx == null) return legacyDescriptor

        val builder = LimeExternalDescriptor.Builder()
        ctx.externalDescriptorValue().forEach {
            builder.addValue(
                convertSimpleId(it.simpleId(0)),
                convertSimpleId(it.simpleId(1)),
                AntlrLimeConverter.convertSingleLineStringLiteral(it.singleLineStringLiteral())
            )
        }
        val descriptor = builder.build()

        // Order of descriptor addition matters. Matching keys from right-hand side take precedence.
        return legacyDescriptor?.let { it + descriptor } ?: descriptor
    }
}
