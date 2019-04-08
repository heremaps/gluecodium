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

import com.google.common.annotations.VisibleForTesting
import com.here.genium.common.CollectionsHelper
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.CLASS
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.STRUCT
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.swift.SwiftModelBuilder
import com.here.genium.model.cbridge.CArray
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.cbridge.CElement
import com.here.genium.model.cbridge.CEnum
import com.here.genium.model.cbridge.CField
import com.here.genium.model.cbridge.CFunction
import com.here.genium.model.cbridge.CInParameter
import com.here.genium.model.cbridge.CInterface
import com.here.genium.model.cbridge.CMap
import com.here.genium.model.cbridge.COutParameter
import com.here.genium.model.cbridge.CParameter
import com.here.genium.model.cbridge.CStruct
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.swift.SwiftField
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftProperty
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
import java.util.HashMap
import java.util.LinkedHashSet

class CBridgeModelBuilder @VisibleForTesting
internal constructor(
    contextStack: ModelBuilderContextStack<CElement>,
    private val deploymentModel: FrancaDeploymentModel,
    private val cppIncludeResolver: CppIncludeResolver,
    private val includeResolver: CBridgeIncludeResolver,
    private val cppBuilder: CppModelBuilder,
    private val swiftBuilder: SwiftModelBuilder,
    private val typeMapper: CBridgeTypeMapper,
    private val internalNamespace: List<String>
) : AbstractModelBuilder<CElement>(contextStack) {

    val arraysCollector: MutableMap<String, CArray> = HashMap()

    constructor(
        deploymentModel: FrancaDeploymentModel,
        cppIncludeResolver: CppIncludeResolver,
        includeResolver: CBridgeIncludeResolver,
        cppBuilder: CppModelBuilder,
        swiftBuilder: SwiftModelBuilder,
        typeMapper: CBridgeTypeMapper,
        internalNamespace: List<String>
    ) : this(
        ModelBuilderContextStack<CElement>(),
        deploymentModel,
        cppIncludeResolver,
        includeResolver,
        cppBuilder,
        swiftBuilder,
        typeMapper,
        internalNamespace
    )

    override fun startBuilding(francaInterface: FInterface) {
        super.startBuilding(francaInterface)
        storeResult(typeMapper.createCustomTypeInfo(francaInterface, CLASS))
    }

    override fun finishBuilding(enumerationType: FEnumerationType) {
        storeResult(
            CEnum(
                CBridgeNameRules.getEnumName(enumerationType),
                typeMapper.createEnumTypeInfo(enumerationType)
            )
        )
        super.finishBuilding(enumerationType)
    }

    override fun finishBuilding(francaInterface: FInterface) {
        val classInfo =
            CollectionsHelper.getFirstOfType(currentContext.currentResults, CppTypeInfo::class.java)
        val cInterface = finishBuildingInterfaceOrTypeCollection(
            CBridgeNameRules.getInterfaceName(francaInterface), classInfo, francaInterface
        )

        if (deploymentModel.isInterface(francaInterface)) {
            cInterface.functionTableName = CBridgeNameRules.getFunctionTableName(francaInterface)
            cInterface.implementationIncludes.add(
                Include.createInternalInclude(CBridgeComponents.PROXY_CACHE_FILENAME)
            )
        }

        storeResult(cInterface)
        super.finishBuilding(francaInterface)
    }

    override fun finishBuilding(francaTypeCollection: FTypeCollection) {
        val cInterface = finishBuildingInterfaceOrTypeCollection(
            francaTypeCollection.name, null, francaTypeCollection
        )
        storeResult(cInterface)
        closeContext()
    }

    private fun finishBuildingInterfaceOrTypeCollection(
        name: String,
        selfType: CppTypeInfo?,
        francaTypeCollection: FTypeCollection
    ): CInterface {

        val parentClass = getPreviousResult(CInterface::class.java)
        val cInterface = CInterface(name, selfType, internalNamespace)
        if (parentClass != null) {
            cInterface.inheritedFunctions.addAll(parentClass.inheritedFunctions)
            cInterface.inheritedFunctions.addAll(parentClass.functions)
        }
        cInterface.functions.addAll(getPreviousResults(CFunction::class.java))
        cInterface.structs.addAll(getPreviousResults(CStruct::class.java))
        cInterface.enums.addAll(getPreviousResults(CEnum::class.java))
        cInterface.maps.addAll(getPreviousResults(CMap::class.java))

        cInterface.headerIncludes.addAll(CBridgeComponents.collectHeaderIncludes(cInterface))
        cInterface.implementationIncludes.addAll(
            CBridgeComponents.collectImplementationIncludes(cInterface)
        )
        CppLibraryIncludes.filterIncludes(cInterface.implementationIncludes, internalNamespace)

        cInterface.implementationIncludes.add(includeResolver.resolveInclude(francaTypeCollection))
        cInterface.privateHeaderIncludes.addAll(
            CBridgeComponents.collectPrivateHeaderIncludes(cInterface)
        )
        return cInterface
    }

    override fun finishBuilding(francaMethod: FMethod) {

        val swiftMethod = swiftBuilder.getFinalResult(SwiftMethod::class.java)
        val cppMethod = cppBuilder.getFinalResult(CppMethod::class.java)
        val inParams = getPreviousResults(CInParameter::class.java)
        val returnParam = CollectionsHelper.getFirstOfType(
            currentContext.previousResults, COutParameter::class.java, COutParameter()
        )

        val isConstructor = deploymentModel.isConstructor(francaMethod)
        val isStatic = !isConstructor && !deploymentModel.isStatic(francaMethod)
        var parameterSelf: CParameter? = null
        if (isStatic) {
            val cppTypeInfo = CollectionsHelper.getFirstOfType(
                parentContext.currentResults,
                CppTypeInfo::class.java
            )
            parameterSelf = CInParameter("_instance", cppTypeInfo)
        }
        var errorTypeInfo: CppTypeInfo? = null
        if (francaMethod.errorEnum != null) {
            errorTypeInfo = typeMapper.createErrorTypeInfo(francaMethod.errorEnum)
        }

        val returnType = if (isConstructor)
            typeMapper.createCustomTypeInfo(francaMethod.eContainer() as FInterface, CLASS)
        else
            returnParam.mappedType
        val result = CFunction(
            swiftMethod.cShortName,
            swiftMethod.cNestedSpecifier,
            returnType,
            inParams,
            parameterSelf,
            cppMethod.fullyQualifiedName,
            LinkedHashSet(cppIncludeResolver.resolveIncludes(francaMethod)),
            if (isStatic) cppBuilder.getFinalResult(CppMethod::class.java).name else cppMethod.name,
            cppMethod.returnType.fullyQualifiedName,
            deploymentModel.isConst(francaMethod),
            errorTypeInfo
        )

        storeResult(result)
        closeContext()
    }

    override fun finishBuildingInputArgument(francaArgument: FArgument) {

        var cppTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (deploymentModel.isNullable(francaArgument)) {
            cppTypeInfo = CBridgeTypeMapper.createNullableTypeInfo(
                cppTypeInfo, cppBuilder.getFinalResult(CppParameter::class.java).type
            )
        }

        storeResult(CInParameter(francaArgument.name, cppTypeInfo))
        closeContext()
    }

    override fun finishBuildingOutputArgument(francaArgument: FArgument) {

        var cppTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (deploymentModel.isNullable(francaArgument)) {
            cppTypeInfo = CBridgeTypeMapper.createNullableTypeInfo(
                cppTypeInfo, cppBuilder.getFinalResult(CppParameter::class.java).type
            )
        }

        storeResult(COutParameter("result", cppTypeInfo))
        closeContext()
    }

    override fun finishBuilding(francaStruct: FStructType) {

        val cppStruct = cppBuilder.getFinalResult(CppStruct::class.java)
        val cStruct = CStruct(
            CBridgeNameRules.getStructBaseName(francaStruct),
            cppStruct.fullyQualifiedName,
            typeMapper.createCustomTypeInfo(francaStruct, STRUCT),
            cppStruct.hasImmutableFields
        )
        cStruct.fields.addAll(getPreviousResults(CField::class.java))

        storeResult(cStruct)
        super.finishBuilding(francaStruct)
    }

    override fun finishBuilding(francaArray: FArrayType) {

        val innerType = typeMapper.mapType(francaArray.elementType)
        val arrayName = CArrayMapper.getArrayName(francaArray)
        arraysCollector.putIfAbsent(
            arrayName, CArray(arrayName, CArrayMapper.createArrayReference(innerType))
        )

        closeContext()
    }

    override fun finishBuilding(francaField: FField) {

        var cppTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (deploymentModel.isNullable(francaField)) {
            cppTypeInfo = CBridgeTypeMapper.createNullableTypeInfo(
                cppTypeInfo, cppBuilder.getFinalResult(CppField::class.java).type
            )
        }

        val cppField = cppBuilder.getFinalResult(CppField::class.java)
        val swiftField = swiftBuilder.getFinalResult(SwiftField::class.java)
        val cField = CField(
            swiftField.name,
            cppField.name,
            cppTypeInfo,
            deploymentModel.getExternalGetter(francaField),
            deploymentModel.getExternalSetter(francaField)
        )

        storeResult(cField)
        super.finishBuilding(francaField)
    }

    override fun finishBuilding(typeRef: FTypeRef) {
        val type = typeMapper.mapType(typeRef)
        if (FrancaTypeHelper.isImplicitArray(typeRef)) {
            val arrayName = CArrayMapper.getArrayName(typeRef)
            arraysCollector.putIfAbsent(
                arrayName,
                CArray(arrayName, type as CppArrayTypeInfo)
            )
        }

        storeResult(type)
        super.finishBuilding(typeRef)
    }

    override fun finishBuilding(francaAttribute: FAttribute) {

        val cppMethods =
            CollectionsHelper.getAllOfType(cppBuilder.finalResults, CppMethod::class.java)

        val property = swiftBuilder.getFinalResult(SwiftProperty::class.java)

        val classInfo =
            CollectionsHelper.getFirstOfType(parentContext.currentResults, CppTypeInfo::class.java)
        val selfParameter = if (!deploymentModel.isStatic(francaAttribute))
            CInParameter("_instance", classInfo)
        else
            null

        var attributeTypeInfo = getPreviousResult(CppTypeInfo::class.java)
        if (deploymentModel.isNullable(francaAttribute)) {
            attributeTypeInfo = CBridgeTypeMapper.createNullableTypeInfo(
                attributeTypeInfo, cppBuilder.getFinalResult(CppMethod::class.java).returnType
            )
        }

        val getterSwiftMethod = property.getter
        val cppGetterMethod = cppMethods[0]
        val getterFunction = CFunction(
            getterSwiftMethod.cShortName,
            getterSwiftMethod.cNestedSpecifier,
            attributeTypeInfo,
            emptyList(),
            selfParameter,
            cppGetterMethod.fullyQualifiedName,
            LinkedHashSet(cppIncludeResolver.resolveIncludes(francaAttribute)),
            cppGetterMethod.name,
            cppGetterMethod.returnType.fullyQualifiedName,
            true
        )
        storeResult(getterFunction)

        if (!francaAttribute.isReadonly) {
            val setterSwiftMethod = property.setter
            val cppSetterMethod = cppMethods[1]
            val setterFunction = CFunction(
                setterSwiftMethod.cShortName,
                setterSwiftMethod.cNestedSpecifier,
                CppTypeInfo(CType.VOID),
                listOf(CInParameter("newValue", attributeTypeInfo)),
                selfParameter,
                cppSetterMethod.fullyQualifiedName,
                LinkedHashSet(cppIncludeResolver.resolveIncludes(francaAttribute)),
                cppSetterMethod.name,
                cppSetterMethod.returnType.fullyQualifiedName
            )
            storeResult(setterFunction)
        }

        super.finishBuilding(francaAttribute)
    }

    override fun finishBuilding(francaMapType: FMapType) {

        val name = CBridgeNameRules.getMapName(francaMapType)
        val typeInfos = getPreviousResults(CppTypeInfo::class.java)
        val keyType = typeInfos[0]
        val valueType = typeInfos[1]
        val baseApiInclude = cppIncludeResolver.resolveIncludes(francaMapType)[0]

        var enumHashType: String? = null
        if (keyType.typeCategory === CppTypeInfo.TypeCategory.ENUM) {
            enumHashType = typeMapper.enumHashType
        }

        val cMap = CMap(name, keyType, valueType, enumHashType, baseApiInclude)

        storeResult(cMap)
        super.finishBuilding(francaMapType)
    }
}
