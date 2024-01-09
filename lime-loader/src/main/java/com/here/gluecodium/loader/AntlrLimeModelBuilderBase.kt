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
import com.here.gluecodium.antlr.LimeParserListener
import com.here.gluecodium.common.ContextBasedModelBuilder
import com.here.gluecodium.common.ModelBuilderContextStack
import com.here.gluecodium.model.lime.LimeNamedElement
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.tree.ErrorNode
import org.antlr.v4.runtime.tree.TerminalNode

internal abstract class AntlrLimeModelBuilderBase(
    contextStack: ModelBuilderContextStack<LimeNamedElement>,
) : ContextBasedModelBuilder<LimeNamedElement>(contextStack), LimeParserListener {
    // Context handling

    override fun enterEveryRule(ctx: ParserRuleContext) = openContext()

    override fun exitEveryRule(ctx: ParserRuleContext) = closeContext()

    // Empty overrides

    override fun enterLimeFile(ctx: LimeParser.LimeFileContext) {}

    override fun enterPackageHeader(ctx: LimeParser.PackageHeaderContext) {}

    override fun enterImportHeader(ctx: LimeParser.ImportHeaderContext) {}

    override fun enterImportStatement(ctx: LimeParser.ImportStatementContext) {}

    override fun enterFieldParameter(ctx: LimeParser.FieldParameterContext) {}

    override fun exitFieldParameter(ctx: LimeParser.FieldParameterContext) {}

    override fun enterReturnType(ctx: LimeParser.ReturnTypeContext) {}

    override fun exitReturnType(ctx: LimeParser.ReturnTypeContext) {}

    override fun enterThrowsClause(ctx: LimeParser.ThrowsClauseContext) {}

    override fun exitThrowsClause(ctx: LimeParser.ThrowsClauseContext) {}

    override fun enterGetter(ctx: LimeParser.GetterContext) {}

    override fun exitGetter(ctx: LimeParser.GetterContext) {}

    override fun enterSetter(ctx: LimeParser.SetterContext) {}

    override fun exitSetter(ctx: LimeParser.SetterContext) {}

    override fun enterLambdaParameter(ctx: LimeParser.LambdaParameterContext) {}

    override fun exitLambdaParameter(ctx: LimeParser.LambdaParameterContext) {}

    override fun enterDocComment(ctx: LimeParser.DocCommentContext) {}

    override fun exitDocComment(ctx: LimeParser.DocCommentContext) {}

    override fun enterAnnotation(ctx: LimeParser.AnnotationContext) {}

    override fun exitAnnotation(ctx: LimeParser.AnnotationContext) {}

    override fun enterAnnotationValue(ctx: LimeParser.AnnotationValueContext) {}

    override fun exitAnnotationValue(ctx: LimeParser.AnnotationValueContext) {}

    override fun enterTypeRef(ctx: LimeParser.TypeRefContext) {}

    override fun exitTypeRef(ctx: LimeParser.TypeRefContext) {}

    override fun enterSimpleTypeRef(ctx: LimeParser.SimpleTypeRefContext) {}

    override fun exitSimpleTypeRef(ctx: LimeParser.SimpleTypeRefContext) {}

    override fun enterPredefinedType(ctx: LimeParser.PredefinedTypeContext) {}

    override fun exitPredefinedType(ctx: LimeParser.PredefinedTypeContext) {}

    override fun enterGenericType(ctx: LimeParser.GenericTypeContext) {}

    override fun exitGenericType(ctx: LimeParser.GenericTypeContext) {}

    override fun enterListType(ctx: LimeParser.ListTypeContext) {}

    override fun exitListType(ctx: LimeParser.ListTypeContext) {}

    override fun enterMapType(ctx: LimeParser.MapTypeContext) {}

    override fun exitMapType(ctx: LimeParser.MapTypeContext) {}

    override fun enterSetType(ctx: LimeParser.SetTypeContext) {}

    override fun exitSetType(ctx: LimeParser.SetTypeContext) {}

    override fun enterLiteralConstant(ctx: LimeParser.LiteralConstantContext) {}

    override fun exitLiteralConstant(ctx: LimeParser.LiteralConstantContext) {}

    override fun enterSingleLineStringLiteral(ctx: LimeParser.SingleLineStringLiteralContext) {}

    override fun exitSingleLineStringLiteral(ctx: LimeParser.SingleLineStringLiteralContext) {}

    override fun enterSingleLineStringContent(ctx: LimeParser.SingleLineStringContentContext) {}

    override fun exitSingleLineStringContent(ctx: LimeParser.SingleLineStringContentContext) {}

    override fun enterMultiLineStringLiteral(ctx: LimeParser.MultiLineStringLiteralContext) {}

    override fun exitMultiLineStringLiteral(ctx: LimeParser.MultiLineStringLiteralContext) {}

    override fun enterMultiLineStringContent(ctx: LimeParser.MultiLineStringContentContext) {}

    override fun exitMultiLineStringContent(ctx: LimeParser.MultiLineStringContentContext) {}

    override fun enterElementRef(ctx: LimeParser.ElementRefContext) {}

    override fun exitElementRef(ctx: LimeParser.ElementRefContext) {}

    override fun enterPositionalEnumeratorRef(ctx: LimeParser.PositionalEnumeratorRefContext) {}

    override fun exitPositionalEnumeratorRef(ctx: LimeParser.PositionalEnumeratorRefContext) {}

    override fun enterStructInitializer(ctx: LimeParser.StructInitializerContext) {}

    override fun exitStructInitializer(ctx: LimeParser.StructInitializerContext) {}

    override fun enterListInitializer(ctx: LimeParser.ListInitializerContext) {}

    override fun exitListInitializer(ctx: LimeParser.ListInitializerContext) {}

    override fun enterMapInitializer(ctx: LimeParser.MapInitializerContext) {}

    override fun exitMapInitializer(ctx: LimeParser.MapInitializerContext) {}

    override fun enterKeyValuePair(ctx: LimeParser.KeyValuePairContext) {}

    override fun exitKeyValuePair(ctx: LimeParser.KeyValuePairContext) {}

    override fun enterDurationLiteral(ctx: LimeParser.DurationLiteralContext) {}

    override fun exitDurationLiteral(ctx: LimeParser.DurationLiteralContext) {}

    override fun enterSimpleId(ctx: LimeParser.SimpleIdContext) {}

    override fun exitSimpleId(ctx: LimeParser.SimpleIdContext) {}

    override fun enterIdentifier(ctx: LimeParser.IdentifierContext) {}

    override fun exitIdentifier(ctx: LimeParser.IdentifierContext) {}

    override fun enterExternalDescriptor(ctx: LimeParser.ExternalDescriptorContext?) {}

    override fun exitExternalDescriptor(ctx: LimeParser.ExternalDescriptorContext?) {}

    override fun enterExternalDescriptorValue(ctx: LimeParser.ExternalDescriptorValueContext?) {}

    override fun exitExternalDescriptorValue(ctx: LimeParser.ExternalDescriptorValueContext?) {}

    override fun enterParentTypes(ctx: LimeParser.ParentTypesContext?) {}

    override fun exitParentTypes(ctx: LimeParser.ParentTypesContext?) {}

    override fun visitTerminal(node: TerminalNode) {}

    override fun visitErrorNode(node: ErrorNode) {}
}
