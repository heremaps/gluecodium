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

package com.here.genium.generator.cbridge

import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.swift.SwiftModelBuilder
import com.here.genium.model.cbridge.CElement
import com.here.genium.model.cbridge.CEnum
import com.here.genium.model.cbridge.CField
import com.here.genium.model.cbridge.CFunction
import com.here.genium.model.cbridge.CInterface
import com.here.genium.model.cbridge.CParameter
import com.here.genium.model.cbridge.CStruct
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributeType.CPP
import com.here.genium.model.lime.LimeAttributeValueType
import com.here.genium.model.lime.LimeContainerWithInheritance
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeInterface
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeTypesCollection
import com.here.genium.model.swift.SwiftField
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftParameter
import com.here.genium.model.swift.SwiftProperty

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
        val cppTypeInfo =
            typeMapper.createCustomTypeInfo(limeContainer, CppTypeInfo.TypeCategory.CLASS)
        storeResult(cppTypeInfo)
    }

    override fun startBuilding(limeStruct: LimeStruct) {
        openContext()
        val cppTypeInfo =
            typeMapper.createCustomTypeInfo(limeStruct, CppTypeInfo.TypeCategory.STRUCT)
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
        cInterface.implementationIncludes.add(CppLibraryIncludes.TYPE_REPOSITORY)
        cInterface.implementationIncludes.add(Include.createInternalInclude(CBridgeNameRules.TYPE_INIT_REPOSITORY))

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
                typeMapper.createCustomTypeInfo(limeParent, CppTypeInfo.TypeCategory.CLASS)
            else -> {
                val cppTypeInfo =
                    typeMapper.mapType(limeMethod.returnType.typeRef.type, cppMethod.returnType)
                if (limeMethod.returnType.typeRef.isNullable) {
                    CBridgeTypeMapper.createNullableTypeInfo(cppTypeInfo, cppMethod.returnType)
                } else {
                    cppTypeInfo
                }
            }
        }

        var errorType: CppTypeInfo? = null
        val limeErrorType = limeMethod.exception?.errorEnum
        if (limeErrorType != null) {
            errorType = typeMapper.createEnumTypeInfo(limeErrorType.type, asErrorType = true)
        }

        val result = CFunction(
            swiftMethod.cShortName,
            swiftMethod.cNestedSpecifier,
            returnType,
            getPreviousResults(CParameter::class.java),
            parameterSelf,
            cppMethod.fullyQualifiedName,
            cppIncludeResolver.resolveIncludes(limeMethod).toSet(),
            cppMethod.name,
            cppMethod.returnType.fullyQualifiedName,
            limeMethod.attributes.have(CPP, LimeAttributeValueType.CONST),
            errorType
        )

        storeResult(result)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        var cppTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (limeParameter.typeRef.isNullable) {
            val cppParameter = cppBuilder.getFinalResult(CppParameter::class.java)
            cppTypeInfo = CBridgeTypeMapper.createNullableTypeInfo(cppTypeInfo, cppParameter.type)
        }
        val swiftParameter = swiftBuilder.getFinalResult(SwiftParameter::class.java)
        val result = CParameter(swiftParameter.name, cppTypeInfo)

        storeResult(result)
        closeContext()
    }

    override fun finishBuilding(limeStruct: LimeStruct) {
        val cppStruct = cppBuilder.getFinalResult(CppStruct::class.java)
        val cStruct = CStruct(
            CBridgeNameRules.getTypeName(limeStruct),
            cppStruct.fullyQualifiedName,
            currentContext.currentResults.filterIsInstance<CppTypeInfo>().first(),
            cppStruct.hasImmutableFields,
            getPreviousResults(CField::class.java),
            getPreviousResults(CFunction::class.java)
        )

        storeResult(cStruct)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val cppField = cppBuilder.getFinalResult(CppField::class.java)
        val swiftField = swiftBuilder.getFinalResult(SwiftField::class.java)

        var cppTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (limeField.typeRef.isNullable) {
            cppTypeInfo = CBridgeTypeMapper.createNullableTypeInfo(cppTypeInfo, cppField.type)
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
            attributeTypeInfo = CBridgeTypeMapper.createNullableTypeInfo(
                attributeTypeInfo,
                cppGetterMethod.returnType
            )
        }

        val getterSwiftMethod = swiftProperty.getter
        val getterFunction = CFunction(
            getterSwiftMethod.cShortName,
            getterSwiftMethod.cNestedSpecifier,
            attributeTypeInfo,
            emptyList(),
            selfParameter,
            cppGetterMethod.fullyQualifiedName,
            cppIncludeResolver.resolveIncludes(limeProperty).toSet(),
            cppGetterMethod.name,
            cppGetterMethod.returnType.fullyQualifiedName,
            true
        )
        storeResult(getterFunction)

        if (limeProperty.setter != null) {
            val setterSwiftMethod = swiftProperty.setter
            val cppSetterMethod = cppMethods[1]
            val setterFunction = CFunction(
                setterSwiftMethod?.cShortName,
                setterSwiftMethod?.cNestedSpecifier,
                CppTypeInfo(CType.VOID),
                listOf(CParameter("newValue", attributeTypeInfo)),
                selfParameter,
                cppSetterMethod.fullyQualifiedName,
                cppIncludeResolver.resolveIncludes(limeProperty).toSet(),
                cppSetterMethod.name,
                cppSetterMethod.returnType.fullyQualifiedName
            )
            storeResult(setterFunction)
        }

        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        val cppType = cppBuilder.getFinalResult(CppTypeRef::class.java)
        val cppTypeInfo = typeMapper.mapType(limeTypeRef.type, cppType)

        storeResult(cppTypeInfo)
        closeContext()
    }
}
