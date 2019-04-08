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

package com.here.genium.generator.swift

import com.google.common.annotations.VisibleForTesting
import com.here.genium.common.CollectionsHelper
import com.here.genium.common.FrancaSignatureResolver
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.cbridge.CBridgeNameRules
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack
import com.here.genium.model.common.InstanceRules
import com.here.genium.model.franca.CommentHelper
import com.here.genium.model.franca.DefinedBy
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.swift.SwiftArray
import com.here.genium.model.swift.SwiftClass
import com.here.genium.model.swift.SwiftConstant
import com.here.genium.model.swift.SwiftDictionary
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftEnumItem
import com.here.genium.model.swift.SwiftField
import com.here.genium.model.swift.SwiftFile
import com.here.genium.model.swift.SwiftInParameter
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftModelElement
import com.here.genium.model.swift.SwiftOutParameter
import com.here.genium.model.swift.SwiftParameter
import com.here.genium.model.swift.SwiftProperty
import com.here.genium.model.swift.SwiftStruct
import com.here.genium.model.swift.SwiftType
import com.here.genium.model.swift.SwiftTypeDef
import com.here.genium.model.swift.SwiftValue
import com.here.genium.model.swift.SwiftVisibility
import org.franca.core.framework.FrancaHelpers
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FInitializerExpression
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import java.util.HashMap
import java.util.HashSet

class SwiftModelBuilder @VisibleForTesting
internal constructor(
    contextStack: ModelBuilderContextStack<SwiftModelElement>,
    private val deploymentModel: FrancaDeploymentModel,
    private val signatureResolver: FrancaSignatureResolver,
    private val typeMapper: SwiftTypeMapper
) : AbstractModelBuilder<SwiftModelElement>(contextStack) {

    val arraysCollector: MutableMap<String, SwiftArray> = HashMap()
    val mapCollector: MutableMap<String, SwiftDictionary> = HashMap()
    val enumsAsErrors: MutableSet<String> = HashSet()

    constructor(
        deploymentModel: FrancaDeploymentModel,
        signatureResolver: FrancaSignatureResolver,
        typeMapper: SwiftTypeMapper
    ) : this(
        ModelBuilderContextStack<SwiftModelElement>(),
        deploymentModel,
        signatureResolver,
        typeMapper
    )

    override fun finishBuilding(francaTypeCollection: FTypeCollection) {
        val file = SwiftFile()
        file.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        file.enums.addAll(getPreviousResults(SwiftEnum::class.java))
        file.typeDefs.addAll(getPreviousResults(SwiftTypeDef::class.java))
        file.dictionaries.addAll(getPreviousResults(SwiftDictionary::class.java))

        val constants = getPreviousResults(SwiftConstant::class.java)
        if (!constants.isEmpty()) {
            val swiftStruct = SwiftStruct(
                SwiftNameRules.getClassName(francaTypeCollection.name),
                "",
                getVisibility(francaTypeCollection)
            )
            swiftStruct.constants.addAll(constants)
            file.structs.add(swiftStruct)
        }

        storeResult(file)
        super.finishBuilding(francaTypeCollection)
    }

    override fun finishBuilding(francaInterface: FInterface) {
        val isInterface = deploymentModel.isInterface(francaInterface)
        val parentClass = getPreviousResult(SwiftClass::class.java)
        val parentIsInterface = parentClass != null && parentClass.isInterface
        val parentIsClass = parentClass != null && !parentClass.isInterface

        val isObjcInterface = deploymentModel.isObjcInterface(francaInterface)
        var parentClassName: String? = if (parentIsClass) parentClass.name else null
        if (parentClassName == null && isObjcInterface && !isInterface) {
            parentClassName = SwiftTypeMapper.OBJC_PARENT_CLASS
        }

        val clazz = SwiftClass(
            SwiftNameRules.getClassName(francaInterface.name),
            getVisibility(francaInterface),
            isInterface,
            parentClassName,
            DefinedBy.getPackages(francaInterface).joinToString("_"),
            CBridgeNameRules.getInterfaceName(francaInterface),
            if (isInterface) CBridgeNameRules.getFunctionTableName(francaInterface) else null,
            parentIsClass && !isInterface,
            isObjcInterface
        )

        if (parentIsInterface) {
            clazz.implementsProtocols.add(parentClass.name)
            clazz.methods.addAll(parentClass.methods)
            clazz.properties.addAll(parentClass.properties)
        }

        clazz.methods.addAll(getPreviousResults(SwiftMethod::class.java))
        clazz.properties.addAll(getPreviousResults(SwiftProperty::class.java))
        clazz.typedefs.addAll(getPreviousResults(SwiftTypeDef::class.java))
        clazz.constants.addAll(getPreviousResults(SwiftConstant::class.java))

        val comment = CommentHelper.getDescription(francaInterface)
        clazz.comment = comment ?: ""

        val file = SwiftFile()
        file.classes.add(clazz)
        file.dictionaries.addAll(getPreviousResults(SwiftDictionary::class.java))

        if (isInterface) {
            file.structs.addAll(getPreviousResults(SwiftStruct::class.java))
            file.enums.addAll(getPreviousResults(SwiftEnum::class.java))
        } else {
            clazz.structs.addAll(getPreviousResults(SwiftStruct::class.java))
            clazz.enums.addAll(getPreviousResults(SwiftEnum::class.java))
        }

        storeResult(clazz)
        storeResult(file)
        super.finishBuilding(francaInterface)
    }

    override fun finishBuilding(francaStruct: FStructType) {

        val swiftStruct = SwiftStruct(
            SwiftNameRules.getStructName(francaStruct, deploymentModel),
            CBridgeNameRules.getStructBaseName(francaStruct),
            getVisibility(francaStruct),
            SwiftType.TypeCategory.STRUCT,
            false, null,
            false,
            deploymentModel.isEquatable(francaStruct),
            deploymentModel.isImmutable(francaStruct)
        )
        val comment = CommentHelper.getDescription(francaStruct)
        swiftStruct.comment = comment ?: ""

        swiftStruct.fields.addAll(getPreviousResults(SwiftField::class.java))

        storeResult(swiftStruct)
        super.finishBuilding(francaStruct)
    }

    override fun finishBuilding(francaEnumerationType: FEnumerationType) {

        val enumItems = CollectionsHelper.getAllOfType(
            currentContext.previousResults,
            SwiftEnumItem::class.java
        )

        val swiftEnum = SwiftEnum(
            SwiftNameRules.getEnumTypeName(francaEnumerationType, deploymentModel),
            getVisibility(francaEnumerationType),
            enumItems
        )
        swiftEnum.comment = CommentHelper.getDescription(francaEnumerationType)

        storeResult(swiftEnum)
        super.finishBuilding(francaEnumerationType)
    }

    override fun finishBuilding(enumerator: FEnumerator) {

        val swiftEnumItem = SwiftEnumItem(
            SwiftNameRules.getEnumItemName(enumerator),
            CollectionsHelper.getFirstOfType(
                currentContext.previousResults, SwiftValue::class.java
            )
        )
        swiftEnumItem.comment = CommentHelper.getDescription(enumerator)

        storeResult(swiftEnumItem)
        super.finishBuilding(enumerator)
    }

    override fun finishBuilding(expression: FInitializerExpression) {
        storeResult(SwiftValueMapper.map(expression))
        super.finishBuilding(expression)
    }

    override fun finishBuilding(francaField: FField) {

        val fieldType = getPreviousResult(SwiftType::class.java)

        val fieldName = SwiftNameRules.getFieldName(francaField.name)
        val deploymentDefaultValue = deploymentModel.getDefaultValue(francaField)
        val defaultValue = SwiftValueMapper.mapDefaultValue(fieldType, deploymentDefaultValue)
        val visibility = getVisibility(francaField)

        val structField = SwiftField(fieldName, visibility, fieldType, defaultValue)
        structField.comment = CommentHelper.getDescription(francaField)

        storeResult(structField)
        super.finishBuilding(francaField)
    }

    override fun finishBuildingInputArgument(francaArgument: FArgument) {

        val swiftType = getPreviousResult(SwiftType::class.java)

        val swiftParameter =
            SwiftInParameter(SwiftNameRules.getParameterName(francaArgument), swiftType)
        swiftParameter.comment = CommentHelper.getDescription(francaArgument)

        storeResult(swiftParameter)
        super.finishBuildingInputArgument(francaArgument)
    }

    override fun finishBuildingOutputArgument(francaArgument: FArgument) {

        val swiftParameter = SwiftOutParameter(
            SwiftNameRules.getParameterName(francaArgument),
            getPreviousResult(SwiftType::class.java)
        )
        swiftParameter.comment = CommentHelper.getDescription(francaArgument)

        storeResult(swiftParameter)
        super.finishBuildingOutputArgument(francaArgument)
    }

    override fun finishBuilding(francaTypeDef: FTypeDef) {

        if (!InstanceRules.isInstanceId(francaTypeDef)) {

            val typedefValue = SwiftTypeDef(
                SwiftNameRules.getTypeDefName(francaTypeDef, deploymentModel),
                getVisibility(francaTypeDef),
                getPreviousResult(SwiftType::class.java)
            )
            typedefValue.comment = CommentHelper.getDescription(francaTypeDef)
            storeResult(typedefValue)
        }
        super.finishBuilding(francaTypeDef)
    }

    override fun finishBuilding(francaMethod: FMethod) {

        val inParams = getPreviousResults(SwiftInParameter::class.java)

        val comment = CommentHelper.getDescription(francaMethod)
        val returnParam = CollectionsHelper.getFirstOfType(
            currentContext.previousResults, SwiftOutParameter::class.java, SwiftOutParameter()
        )
        val isConstructor = deploymentModel.isConstructor(francaMethod)
        val method = SwiftMethod(
            SwiftNameRules.getMethodName(francaMethod),
            getVisibility(francaMethod),
            comment,
            if (isConstructor) SwiftType(
                CBridgeNameRules.BASE_REF_NAME,
                null
            ) else returnParam.type,
            returnParam.comment,
            CBridgeNameRules.getNestedSpecifierString(francaMethod),
            CBridgeNameRules.getShortMethodName(francaMethod),
            createErrorIfNeeded(francaMethod),
            deploymentModel.isStatic(francaMethod) || isConstructor,
            isConstructor,
            isConstructor && signatureResolver.hasSignatureClash(francaMethod),
            inParams
        )

        storeResult(method)
        super.finishBuilding(francaMethod)
    }

    private fun createErrorIfNeeded(francaMethod: FMethod): SwiftEnum? {
        val errorEnum = francaMethod.errorEnum
        if (errorEnum != null) {
            val swiftEnumName = SwiftNameRules.getEnumTypeName(errorEnum, deploymentModel)
            enumsAsErrors.add(swiftEnumName)
            return SwiftEnum(swiftEnumName)
        } else {
            return null
        }
    }

    override fun finishBuilding(francaTypeRef: FTypeRef) {
        val swiftType = typeMapper.mapType(francaTypeRef)
        if (swiftType is SwiftArray) {
            val elementType = if (FrancaTypeHelper.isImplicitArray(francaTypeRef))
                francaTypeRef
            else
                (FrancaHelpers.getActualDerived(francaTypeRef) as FArrayType).elementType
            val elementTypeKey = typeMapper.getActualTypeKey(elementType)
            arraysCollector.putIfAbsent(elementTypeKey, swiftType.withoutAlias())
        }

        storeResult(swiftType)
        super.finishBuilding(francaTypeRef)
    }

    override fun finishBuilding(francaAttribute: FAttribute) {

        val propertyVisibility = getVisibility(francaAttribute)
        val swiftType = getPreviousResult(SwiftType::class.java)
        val isStatic = deploymentModel.isStatic(francaAttribute)

        val nestedSpecifier = CBridgeNameRules.getNestedSpecifierString(francaAttribute)
        val getterMethod = SwiftMethod(
            "",
            propertyVisibility, null,
            swiftType, null,
            nestedSpecifier,
            CBridgeNameRules.getPropertyGetterName(francaAttribute), null,
            isStatic
        )

        var setterMethod: SwiftMethod? = null
        if (!francaAttribute.isReadonly) {
            val setterVisibility = if (deploymentModel.hasInternalSetter(francaAttribute))
                SwiftVisibility.INTERNAL
            else
                propertyVisibility
            setterMethod = SwiftMethod(
                "",
                setterVisibility, null,
                SwiftType.VOID, null,
                nestedSpecifier,
                CBridgeNameRules.getPropertySetterName(francaAttribute), null,
                isStatic,
                false,
                false,
                listOf(SwiftParameter("newValue", swiftType))
            )
        }

        val property = SwiftProperty(
            SwiftNameRules.getPropertyName(francaAttribute.name, swiftType),
            propertyVisibility,
            swiftType,
            getterMethod,
            setterMethod,
            isStatic
        )
        property.comment = CommentHelper.getDescription(francaAttribute)

        storeResult(property)
        super.finishBuilding(francaAttribute)
    }

    override fun finishBuilding(francaArray: FArrayType) {
        val typeDefName = SwiftNameRules.getTypeDefName(francaArray, deploymentModel)
        val arrayType = typeMapper.mapArrayType(francaArray).withAlias(typeDefName) as SwiftArray
        val elementTypeKey = typeMapper.getActualTypeKey(francaArray.elementType)
        arraysCollector.putIfAbsent(elementTypeKey, arrayType.withoutAlias())

        val swiftTypeDef = SwiftTypeDef(
            typeDefName, getVisibility(francaArray), SwiftType(arrayType.name, null)
        )
        swiftTypeDef.comment = CommentHelper.getDescription(francaArray)

        storeResult(swiftTypeDef)
        super.finishBuilding(francaArray)
    }

    override fun finishBuilding(francaMapType: FMapType) {

        val typeDefName = SwiftNameRules.getTypeDefName(francaMapType, deploymentModel)
        val mapName = SwiftNameRules.getMapName(francaMapType, deploymentModel)
        val typeRefs = getPreviousResults(SwiftType::class.java)
        val swiftDictionary = SwiftDictionary(
            mapName, null,
            typeDefName,
            CBridgeNameRules.getStructBaseName(francaMapType),
            typeRefs[0],
            typeRefs[1]
        )

        val keyTypeKey = typeMapper.getActualTypeKey(francaMapType.keyType)
        val valueTypeKey = typeMapper.getActualTypeKey(francaMapType.valueType)
        mapCollector.putIfAbsent("$keyTypeKey:$valueTypeKey", swiftDictionary)
        storeResult(swiftDictionary)

        val namelessDictionary = SwiftType(swiftDictionary.dictionaryDefinition, null)
        val swiftTypeDef =
            SwiftTypeDef(typeDefName, getVisibility(francaMapType), namelessDictionary)
        swiftTypeDef.comment = CommentHelper.getDescription(francaMapType)

        storeResult(swiftTypeDef)
        super.finishBuilding(francaMapType)
    }

    override fun finishBuilding(francaConstant: FConstantDef) {

        val name = SwiftNameRules.getConstantName(francaConstant.name)
        val type = getPreviousResult(SwiftType::class.java)
        val visibility = getVisibility(francaConstant)
        val value = getPreviousResult(SwiftValue::class.java)

        val swiftConstant = SwiftConstant(name, visibility, type, value)
        swiftConstant.comment = CommentHelper.getDescription(francaConstant)

        storeResult(swiftConstant)
        super.finishBuilding(francaConstant)
    }

    private fun getVisibility(francaModelElement: FModelElement) =
        when {
            deploymentModel.isInternal(francaModelElement) -> SwiftVisibility.INTERNAL
            else -> SwiftVisibility.PUBLIC
        }
}
