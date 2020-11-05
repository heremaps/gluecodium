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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.common.ModelBuilderContextStack
import com.here.gluecodium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppModelBuilder
import com.here.gluecodium.generator.swift.SwiftModelBuilder
import com.here.gluecodium.model.cbridge.CElement
import com.here.gluecodium.model.cbridge.CEnum
import com.here.gluecodium.model.cbridge.CField
import com.here.gluecodium.model.cbridge.CFunction
import com.here.gluecodium.model.cbridge.CInterface
import com.here.gluecodium.model.cbridge.CParameter
import com.here.gluecodium.model.cbridge.CStruct
import com.here.gluecodium.model.cbridge.CType
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppField
import com.here.gluecodium.model.cpp.CppFunctionTypeRef
import com.here.gluecodium.model.cpp.CppMethod
import com.here.gluecodium.model.cpp.CppParameter
import com.here.gluecodium.model.cpp.CppStruct
import com.here.gluecodium.model.cpp.CppTypeRef
import com.here.gluecodium.model.cpp.CppUsing
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.swift.SwiftField
import com.here.gluecodium.model.swift.SwiftMethod
import com.here.gluecodium.model.swift.SwiftParameter
import com.here.gluecodium.model.swift.SwiftProperty

class CBridgeModelBuilder(
    contextStack: ModelBuilderContextStack<CElement> = ModelBuilderContextStack(),
    private val limeReferenceMap: Map<String, LimeElement>,
    private val cppIncludeResolver: CppIncludeResolver,
    private val cppBuilder: CppModelBuilder,
    private val swiftBuilder: SwiftModelBuilder,
    private val typeMapper: CBridgeTypeMapper,
    private val internalNamespace: List<String>,
    private val buildTransientModel: (LimeNamedElement) -> List<CInterface>
) : AbstractLimeBasedModelBuilder<CElement>(contextStack) {

    override fun startBuilding(limeContainer: LimeContainerWithInheritance) {
        openContext()
        val cppTypeInfo = typeMapper.createCustomTypeInfo(limeContainer, isClass = true)
        storeResult(cppTypeInfo)
    }

    override fun startBuilding(limeStruct: LimeStruct) {
        openContext()
        val cppTypeInfo = typeMapper.createCustomTypeInfo(limeStruct)
        storeResult(cppTypeInfo)
    }

    override fun finishBuilding(limeContainer: LimeContainerWithInheritance) {
        val parentClass = limeContainer.parent?.type?.let { buildTransientModel(it).first() }
        val inheritedFunctions = mutableListOf<CFunction>()
        if (parentClass != null) {
            inheritedFunctions.addAll(parentClass.inheritedFunctions)
            inheritedFunctions.addAll(parentClass.functions)
        }
        val functionTableName =
            (limeContainer as? LimeInterface)?.let { CBridgeNameRules.getFunctionTableName(it) }

        val cInterface = CInterface(
            name = CBridgeNameRules.getInterfaceName(limeContainer),
            selfType = currentContext.currentResults.filterIsInstance<CppTypeInfo>().firstOrNull(),
            internalNamespace = internalNamespace,
            structs = getPreviousResults(CStruct::class.java),
            enums = getPreviousResults(CEnum::class.java),
            functions = getPreviousResults(CFunction::class.java),
            interfaces = getPreviousResults(CInterface::class.java),
            inheritedFunctions = inheritedFunctions,
            functionTableName = functionTableName,
            isEquatable = limeContainer.attributes.have(LimeAttributeType.EQUATABLE),
            isPointerEquatable = limeContainer.attributes.have(LimeAttributeType.POINTER_EQUATABLE),
            hasTypeRepository = limeContainer is LimeInterface || parentClass != null ||
                    limeContainer.visibility.isOpen
        )

        if (limeContainer is LimeInterface) {
            cInterface.implementationIncludes.add(
                Include.createInternalInclude(CBridgeComponents.PROXY_CACHE_FILENAME)
            )
        }
        cInterface.implementationIncludes.add(cppIncludeResolver.typeRepositoryInclude)
        cInterface.implementationIncludes.add(Include.createInternalInclude(CBridgeNameRules.TYPE_INIT_REPOSITORY))
        cInterface.implementationIncludes.add(Include.createInternalInclude(CBridgeComponents.WRAPPER_CACHE_HEADER))

        storeResult(cInterface)
        closeContext()
    }

    override fun finishBuilding(limeTypes: LimeTypesCollection) {
        val cInterface = CInterface(
            name = CBridgeNameRules.getInterfaceName(limeTypes),
            internalNamespace = internalNamespace,
            structs = getPreviousResults(CStruct::class.java),
            enums = getPreviousResults(CEnum::class.java)
        )

        storeResult(cInterface)
        closeContext()
    }

    override fun finishBuilding(limeMethod: LimeFunction) {
        var parameterSelf: CParameter? = null
        if (!limeMethod.isStatic) {
            val cppTypeInfo = parentContext!!.currentResults.filterIsInstance<CppTypeInfo>().first()
            parameterSelf = CParameter("_instance", cppTypeInfo)
        }

        val swiftMethod = swiftBuilder.getFinalResult(SwiftMethod::class.java)
        val cppMethod = cppBuilder.getFinalResult(CppMethod::class.java)
        val limeParent =
            limeReferenceMap[limeMethod.path.parent.toString()] as LimeNamedElement
        val returnType = when {
            limeParent !is LimeStruct && limeMethod.isConstructor ->
                typeMapper.createCustomTypeInfo(limeParent, isClass = true)
            else -> typeMapper.mapType(limeMethod.returnType.typeRef, cppMethod.returnType)
        }

        val limeErrorTypeRef = limeMethod.exception?.errorType
        val cppErrorType = cppMethod.errorType
        val errorType = if (limeErrorTypeRef != null && cppErrorType != null) {
            typeMapper.mapType(limeErrorTypeRef, cppErrorType)
        } else null

        val errorTypeIsEnum = limeErrorTypeRef?.type?.actualType is LimeEnumeration
        val result = CFunction(
            shortName = swiftMethod.cShortName,
            nestedSpecifier = swiftMethod.cNestedSpecifier,
            returnType = returnType,
            parameters = getPreviousResults(CParameter::class.java),
            selfParameter = parameterSelf,
            delegateCall = cppMethod.fullyQualifiedName,
            delegateCallIncludes = cppIncludeResolver.resolveIncludes(limeMethod).toSet(),
            functionName = cppMethod.name,
            cppReturnTypeName = cppMethod.returnType.fullyQualifiedName,
            isConst = limeMethod.attributes.have(CPP, LimeAttributeValueType.CONST),
            error = errorType,
            errorTypeIsEnum = errorTypeIsEnum,
            isSkipped = limeMethod.attributes.have(SWIFT, SKIP)
        )

        storeResult(result)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        var cppTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (limeParameter.typeRef.isNullable) {
            val cppParameter = cppBuilder.getFinalResult(CppParameter::class.java)
            cppTypeInfo = typeMapper.createNullableTypeInfo(cppTypeInfo, cppParameter.type)
        }
        val swiftParameter = swiftBuilder.getFinalResult(SwiftParameter::class.java)
        val result = CParameter(swiftParameter.name, cppTypeInfo)

        storeResult(result)
        closeContext()
    }

    override fun finishBuilding(limeStruct: LimeStruct) {
        val cppStruct = cppBuilder.getFinalResult(CppStruct::class.java)
        val cStruct = CStruct(
            name = CBridgeNameRules.getTypeName(limeStruct),
            baseApiName = cppStruct.fullyQualifiedName,
            mappedType = currentContext.currentResults.filterIsInstance<CppTypeInfo>().first(),
            hasImmutableFields = cppStruct.hasImmutableFields,
            fields = getPreviousResults(CField::class.java),
            methods = getPreviousResults(CFunction::class.java),
            structs = getPreviousResults(CStruct::class.java),
            interfaces = getPreviousResults(CInterface::class.java),
            enums = getPreviousResults(CEnum::class.java)
        )

        storeResult(cStruct)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val cppField = cppBuilder.getFinalResult(CppField::class.java)
        val swiftField = swiftBuilder.getFinalResult(SwiftField::class.java)

        var cppTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (limeField.typeRef.isNullable) {
            cppTypeInfo = typeMapper.createNullableTypeInfo(cppTypeInfo, cppField.type)
        }

        val cField = CField(
            swiftLayerName = swiftField.name,
            baseLayerName = cppField.name,
            type = cppTypeInfo,
            baseLayerGetterName = cppField.getterName,
            baseLayerSetterName = cppField.setterName
        )

        storeResult(cField)
        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val result = CEnum(
            CBridgeNameRules.getTypeName(limeEnumeration),
            typeMapper.createEnumTypeInfo(limeEnumeration)
        )

        storeResult(result)
        closeContext()
    }

    override fun finishBuilding(limeProperty: LimeProperty) {
        val cppMethods = cppBuilder.finalResults.filterIsInstance<CppMethod>()
        val swiftProperty = swiftBuilder.getFinalResult(SwiftProperty::class.java)

        val classInfo = parentContext!!.currentResults.filterIsInstance<CppTypeInfo>().first()
        val selfParameter = when {
            limeProperty.isStatic -> null
            else -> CParameter("_instance", classInfo)
        }

        val cppGetterMethod = cppMethods.first()
        var attributeTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (limeProperty.typeRef.isNullable) {
            attributeTypeInfo = typeMapper.createNullableTypeInfo(
                attributeTypeInfo,
                cppGetterMethod.returnType
            )
        }

        val getterSwiftMethod = swiftProperty.getter
        val getterFunction = CFunction(
            shortName = getterSwiftMethod.cShortName,
            nestedSpecifier = getterSwiftMethod.cNestedSpecifier,
            returnType = attributeTypeInfo,
            parameters = emptyList(),
            selfParameter = selfParameter,
            delegateCall = cppGetterMethod.fullyQualifiedName,
            delegateCallIncludes = cppIncludeResolver.resolveIncludes(limeProperty).toSet(),
            functionName = cppGetterMethod.name,
            cppReturnTypeName = cppGetterMethod.returnType.fullyQualifiedName,
            isConst = true,
            isSkipped = limeProperty.attributes.have(SWIFT, SKIP)
        )
        storeResult(getterFunction)

        if (limeProperty.setter != null) {
            val setterSwiftMethod = swiftProperty.setter
            val cppSetterMethod = cppMethods[1]
            val setterFunction = CFunction(
                shortName = setterSwiftMethod?.cShortName,
                nestedSpecifier = setterSwiftMethod?.cNestedSpecifier,
                returnType = CppTypeInfo(CType.VOID),
                parameters = listOf(CParameter("newValue", attributeTypeInfo)),
                selfParameter = selfParameter,
                delegateCall = cppSetterMethod.fullyQualifiedName,
                delegateCallIncludes = cppIncludeResolver.resolveIncludes(limeProperty).toSet(),
                functionName = cppSetterMethod.name,
                cppReturnTypeName = cppSetterMethod.returnType.fullyQualifiedName,
                isSkipped = limeProperty.attributes.have(SWIFT, SKIP)
            )
            storeResult(setterFunction)
        }

        closeContext()
    }

    override fun finishBuilding(limeLambda: LimeLambda) {
        val cppUsing = cppBuilder.getFinalResult(CppUsing::class.java)
        val cppFunction = cppUsing.definition as CppFunctionTypeRef
        val parameters = limeLambda.parameters.mapIndexed { index, parameter ->
            CParameter(
                "p$index",
                typeMapper.mapType(parameter.typeRef, cppFunction.parameters[index])
            )
        }
        val selfType = CBridgeTypeMapper.createFunctionalTypeInfo(cppUsing)
        val cFunction = CFunction(
            shortName = "call",
            nestedSpecifier = CBridgeNameRules.getNestedSpecifierString(limeLambda),
            returnType = typeMapper.mapType(limeLambda.returnType.typeRef, cppFunction.returnType),
            parameters = parameters,
            selfParameter = CParameter("_instance", selfType),
            delegateCallIncludes = cppIncludeResolver.resolveIncludes(limeLambda).toSet(),
            functionName = "operator()",
            cppReturnTypeName = cppFunction.returnType.fullyQualifiedName
        )

        val cElement = CInterface(
            name = CBridgeNameRules.getInterfaceName(limeLambda),
            selfType = selfType,
            functionTableName = CBridgeNameRules.getFunctionTableName(limeLambda),
            internalNamespace = internalNamespace,
            functions = listOf(cFunction),
            isFunctionalInterface = true
        )
        cElement.implementationIncludes +=
            Include.createInternalInclude(CBridgeComponents.PROXY_CACHE_FILENAME)

        storeResult(cElement)
        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        val cppType = cppBuilder.getFinalResult(CppTypeRef::class.java)
        val cppTypeInfo = typeMapper.mapType(limeTypeRef, cppType)

        storeResult(cppTypeInfo)
        closeContext()
    }
}
