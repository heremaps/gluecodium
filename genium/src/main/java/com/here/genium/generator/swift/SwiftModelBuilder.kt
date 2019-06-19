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

import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.generator.cbridge.CBridgeNameRules
import com.here.genium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeSignatureResolver
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeHelper
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeVisibility
import com.here.genium.model.swift.SwiftArray
import com.here.genium.model.swift.SwiftClass
import com.here.genium.model.swift.SwiftConstant
import com.here.genium.model.swift.SwiftDictionary
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftEnumItem
import com.here.genium.model.swift.SwiftField
import com.here.genium.model.swift.SwiftFile
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftModelElement
import com.here.genium.model.swift.SwiftParameter
import com.here.genium.model.swift.SwiftProperty
import com.here.genium.model.swift.SwiftSet
import com.here.genium.model.swift.SwiftStruct
import com.here.genium.model.swift.SwiftType
import com.here.genium.model.swift.SwiftTypeDef
import com.here.genium.model.swift.SwiftValue
import com.here.genium.model.swift.SwiftVisibility

class SwiftModelBuilder(
    contextStack: ModelBuilderContextStack<SwiftModelElement> = ModelBuilderContextStack(),
    private val limeReferenceMap: Map<String, LimeElement>,
    private val signatureResolver: LimeSignatureResolver,
    private val nameResolver: SwiftNameResolver,
    private val typeMapper: SwiftTypeMapper,
    private val nameRules: SwiftNameRules
) : AbstractLimeBasedModelBuilder<SwiftModelElement>(contextStack) {

    val arraysCollector = mutableMapOf<String, SwiftArray>()
    val mapCollector = mutableMapOf<String, SwiftDictionary>()
    val enumsAsErrors = mutableSetOf<String>()

    override fun finishBuilding(limeContainer: LimeContainer) {
        when (limeContainer.type) {
            LimeContainer.ContainerType.TYPE_COLLECTION ->
                finishBuildingTypeCollection(limeContainer)
            LimeContainer.ContainerType.CLASS -> finishBuildingClass(limeContainer)
            LimeContainer.ContainerType.INTERFACE -> finishBuildingInterface(limeContainer)
        }

        closeContext()
    }

    private fun finishBuildingTypeCollection(limeContainer: LimeContainer) {
        val file = SwiftFile(nameRules.getImplementationFileName(limeContainer))
        file.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        file.enums.addAll(getPreviousResults(SwiftEnum::class.java))
        file.typeDefs.addAll(getPreviousResults(SwiftTypeDef::class.java))
        file.dictionaries.addAll(getPreviousResults(SwiftDictionary::class.java))

        val constants = getPreviousResults(SwiftConstant::class.java)
        if (constants.isNotEmpty()) {
            val swiftStruct = SwiftStruct(
                name = nameRules.getName(limeContainer),
                visibility = getVisibility(limeContainer),
                constants = constants
            )
            file.structs.add(swiftStruct)
        }

        storeResult(file)
    }

    private fun finishBuildingClass(limeContainer: LimeContainer) {
        val parentClass = getPreviousResultOrNull(SwiftClass::class.java)
        val isObjcInterface = limeContainer.attributes.have(LimeAttributeType.LEGACY_COMPATIBLE)
        val parentClassName = when {
            parentClass != null && !parentClass.isInterface -> parentClass.name
            isObjcInterface -> SwiftTypeMapper.OBJC_PARENT_CLASS
            else -> null
        }

        val swiftClass = SwiftClass(
            name = nameRules.getName(limeContainer),
            visibility = getVisibility(limeContainer),
            parentClass = parentClassName,
            nameSpace = limeContainer.path.head.joinToString("_"),
            cInstance = CBridgeNameRules.getInterfaceName(limeContainer),
            useParentCInstance = parentClass != null && !parentClass.isInterface,
            hasEquatableType = limeContainer.attributes.have(LimeAttributeType.EQUATABLE) ||
                    limeContainer.attributes.have(LimeAttributeType.POINTER_EQUATABLE),
            isObjcInterface = isObjcInterface
        )
        swiftClass.comment = limeContainer.comment

        val swiftFile = SwiftFile(nameRules.getImplementationFileName(limeContainer))
        addMembersAndParent(swiftFile, swiftClass)
        swiftClass.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        swiftClass.enums.addAll(getPreviousResults(SwiftEnum::class.java))

        storeNamedResult(limeContainer, swiftClass)
        storeResult(swiftFile)
    }

    private fun finishBuildingInterface(limeContainer: LimeContainer) {
        val swiftClass = SwiftClass(
            name = nameRules.getName(limeContainer),
            visibility = getVisibility(limeContainer),
            isInterface = true,
            parentClass = getPreviousResultOrNull(SwiftClass::class.java)?.name,
            nameSpace = limeContainer.path.head.joinToString("_"),
            cInstance = CBridgeNameRules.getInterfaceName(limeContainer),
            functionTableName = CBridgeNameRules.getFunctionTableName(limeContainer),
            isObjcInterface = limeContainer.attributes.have(LimeAttributeType.LEGACY_COMPATIBLE)
        )
        swiftClass.comment = limeContainer.comment

        val swiftFile = SwiftFile(nameRules.getImplementationFileName(limeContainer))
        addMembersAndParent(swiftFile, swiftClass)
        swiftFile.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        swiftFile.enums.addAll(getPreviousResults(SwiftEnum::class.java))

        storeNamedResult(limeContainer, swiftClass)
        storeResult(swiftFile)
    }

    private fun addMembersAndParent(swiftFile: SwiftFile, swiftClass: SwiftClass): SwiftFile {
        val parentClass = getPreviousResultOrNull(SwiftClass::class.java)
        if (parentClass != null && parentClass.isInterface) {
            swiftClass.implementsProtocols.add(parentClass.name)
            swiftClass.methods.addAll(parentClass.methods)
            swiftClass.properties.addAll(parentClass.properties)
        }

        swiftClass.methods.addAll(getPreviousResults(SwiftMethod::class.java))
        swiftClass.properties.addAll(getPreviousResults(SwiftProperty::class.java))
        swiftClass.typedefs.addAll(getPreviousResults(SwiftTypeDef::class.java))
        swiftClass.constants.addAll(getPreviousResults(SwiftConstant::class.java))

        swiftFile.classes.add(swiftClass)
        swiftFile.dictionaries.addAll(getPreviousResults(SwiftDictionary::class.java))
        return swiftFile
    }

    override fun finishBuilding(limeMethod: LimeMethod) {
        val isConstructor = limeMethod.attributes.have(LimeAttributeType.CONSTRUCTOR)
        val returnType = when {
            isConstructor -> SwiftType(CBridgeNameRules.BASE_REF_NAME, null)
            else -> {
                val isNullable = limeMethod.returnType.typeRef.isNullable
                typeMapper.mapType(limeMethod.returnType.typeRef.type).withOptional(isNullable)
            }
        }
        if (returnType is SwiftArray) {
            val actualType = LimeTypeHelper.getActualType(limeMethod.returnType.typeRef.type)
            val elementType = (actualType as LimeArray).elementType.type
            val elementTypeKey = typeMapper.getActualTypeKey(elementType)
            arraysCollector.putIfAbsent(elementTypeKey, returnType.withoutAlias())
        }

        val errorType = limeMethod.errorType?.let {
            val swiftEnumName = nameResolver.getFullName(it.type)
            enumsAsErrors.add(swiftEnumName)
            SwiftEnum(swiftEnumName)
        }

        val limeParent = limeReferenceMap[limeMethod.path.parent.toString()]
        val method = SwiftMethod(
            nameRules.getName(limeMethod),
            getVisibility(limeMethod),
            limeMethod.comment,
            returnType,
            limeMethod.returnType.comment,
            CBridgeNameRules.getNestedSpecifierString(limeMethod),
            CBridgeNameRules.getShortMethodName(limeParent, limeMethod),
            errorType,
            limeMethod.isStatic || isConstructor,
            isConstructor,
            isConstructor && signatureResolver.hasSignatureClash(limeMethod),
            getPreviousResults(SwiftParameter::class.java)
        )

        storeNamedResult(limeMethod, method)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        val swiftType = getPreviousResult(SwiftType::class.java)
            .withOptional(limeParameter.typeRef.isNullable)

        val swiftParameter =
            SwiftParameter(nameRules.getName(limeParameter), swiftType)
        swiftParameter.comment = limeParameter.comment

        storeResult(swiftParameter)
        closeContext()
    }

    override fun finishBuilding(limeStruct: LimeStruct) {
        val swiftStruct = SwiftStruct(
            name = nameResolver.getFullName(limeStruct),
            cPrefix = CBridgeNameRules.getTypeName(limeStruct),
            visibility = getVisibility(limeStruct),
            isEquatable = limeStruct.attributes.have(LimeAttributeType.EQUATABLE),
            isImmutable = limeStruct.attributes.have(LimeAttributeType.IMMUTABLE),
            fields = getPreviousResults(SwiftField::class.java),
            constants = getPreviousResults(SwiftConstant::class.java),
            methods = getPreviousResults(SwiftMethod::class.java)
        )
        swiftStruct.comment = limeStruct.comment

        storeNamedResult(limeStruct, swiftStruct)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val isNullable = limeField.typeRef.isNullable
        val swiftType = getPreviousResult(SwiftType::class.java).withOptional(isNullable)

        val swiftValue = getPreviousResultOrNull(SwiftValue::class.java)
            ?: if (isNullable) SwiftValue("nil") else null

        val swiftField = SwiftField(
            nameRules.getName(limeField),
            getVisibility(limeField),
            swiftType,
            swiftValue
        )
        swiftField.comment = limeField.comment

        storeNamedResult(limeField, swiftField)
        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val swiftEnum = SwiftEnum(
            nameResolver.getFullName(limeEnumeration),
            getVisibility(limeEnumeration),
            getPreviousResults(SwiftEnumItem::class.java)
        )
        swiftEnum.comment = limeEnumeration.comment

        storeNamedResult(limeEnumeration, swiftEnum)
        closeContext()
    }

    override fun finishBuilding(limeEnumerator: LimeEnumerator) {
        val swiftEnumItem = SwiftEnumItem(
            nameRules.getName(limeEnumerator),
            getPreviousResultOrNull(SwiftValue::class.java)
        )
        swiftEnumItem.comment = limeEnumerator.comment

        storeNamedResult(limeEnumerator, swiftEnumItem)
        closeContext()
    }

    override fun finishBuilding(limeTypeDef: LimeTypeDef) {
        val typeDefName = nameResolver.getFullName(limeTypeDef)
        val limeActualType = LimeTypeHelper.getActualType(limeTypeDef.typeRef.type)
        val swiftActualType: SwiftType
        when (limeActualType) {
            is LimeMap -> {
                val mapName = nameResolver.getMapName(limeTypeDef)
                val swiftDictionary = SwiftDictionary(
                    mapName,
                    null,
                    typeDefName,
                    CBridgeNameRules.getTypeName(limeTypeDef),
                    typeMapper.mapType(limeActualType.keyType.type),
                    typeMapper.mapType(limeActualType.valueType.type)
                )

                val keyTypeKey = typeMapper.getActualTypeKey(limeActualType.keyType.type)
                val valueTypeKey = typeMapper.getActualTypeKey(limeActualType.valueType.type)
                mapCollector.putIfAbsent("$keyTypeKey:$valueTypeKey", swiftDictionary)
                storeNamedResult(limeTypeDef, swiftDictionary)

                swiftActualType = SwiftType(swiftDictionary.dictionaryDefinition, null)
            }
            is LimeSet -> {
                val swiftSet = SwiftSet(
                    typeMapper.mapType(limeActualType.elementType.type),
                    CBridgeNameRules.getTypeName(limeTypeDef)
                )
                storeNamedResult(limeTypeDef, swiftSet)
                swiftActualType = swiftSet
            }
            else -> swiftActualType = getPreviousResult(SwiftType::class.java)
        }

        val swiftTypeDef = SwiftTypeDef(typeDefName, getVisibility(limeTypeDef), swiftActualType)
        swiftTypeDef.comment = limeTypeDef.comment

        storeNamedResult(limeTypeDef, swiftTypeDef)
        closeContext()
    }

    override fun finishBuilding(limeConstant: LimeConstant) {
        val swiftConstant = SwiftConstant(
            nameRules.getName(limeConstant),
            getVisibility(limeConstant),
            getPreviousResult(SwiftType::class.java),
            getPreviousResult(SwiftValue::class.java)
        )
        swiftConstant.comment = limeConstant.comment

        storeNamedResult(limeConstant, swiftConstant)
        closeContext()
    }

    override fun finishBuilding(limeProperty: LimeProperty) {
        val propertyVisibility = getVisibility(limeProperty)
        val swiftType = getPreviousResult(SwiftType::class.java)
            .withOptional(limeProperty.typeRef.isNullable)

        val nestedSpecifier = CBridgeNameRules.getNestedSpecifierString(limeProperty)
        val getterMethod = SwiftMethod(
            name = "",
            visibility = getVisibility(limeProperty.getter),
            returnType = swiftType,
            cNestedSpecifier = nestedSpecifier,
            cShortName = CBridgeNameRules.getPropertyGetterName(limeProperty.name),
            isStatic = limeProperty.isStatic
        )

        val limeSetter = limeProperty.setter
        val swiftSetter =
            if (limeSetter != null) {
                SwiftMethod(
                    name = "",
                    visibility = getVisibility(limeSetter),
                    cNestedSpecifier = nestedSpecifier,
                    cShortName = CBridgeNameRules.getPropertySetterName(limeProperty.name),
                    isStatic = limeProperty.isStatic,
                    parameters = listOf(SwiftParameter("newValue", swiftType))
                )
            } else null

        val property = SwiftProperty(
            nameRules.getPropertyName(limeProperty),
            propertyVisibility,
            swiftType,
            getterMethod,
            swiftSetter,
            limeProperty.isStatic
        )
        property.comment = limeProperty.comment

        storeNamedResult(limeProperty, property)
        closeContext()
    }

    override fun finishBuilding(limeValue: LimeValue) {
        val swiftValue = when (limeValue) {
            is LimeValue.Literal -> SwiftValue(limeValue.value)
            is LimeValue.Enumerator -> {
                val typeName = nameResolver.getFullName(limeValue.typeRef.type)
                val valueName = nameRules.getName(limeValue.valueRef.enumerator)
                SwiftValue("$typeName.$valueName")
            }
            is LimeValue.Special -> {
                val signPrefix =
                    if (limeValue.value == LimeValue.Special.ValueId.NEGATIVE_INFINITY) "-" else ""
                val typeName =
                    if (limeValue.typeRef == LimeBasicTypeRef.FLOAT) "Float" else "Double"
                val valueName =
                    if (limeValue.value == LimeValue.Special.ValueId.NAN) "nan" else "infinity"
                SwiftValue("$signPrefix$typeName.$valueName")
            }
            is LimeValue.Null -> SwiftValue("nil")
            is LimeValue.InitializerList -> {
                val initializer = when (LimeTypeHelper.getActualType(limeValue.typeRef.type)) {
                    is LimeMap -> "[:]"
                    is LimeArray, is LimeSet -> "[]"
                    else -> nameResolver.getFullName(limeValue.typeRef.type) + "()"
                }
                SwiftValue(initializer)
            }
        }

        storeResult(swiftValue)
        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        val swiftType = typeMapper.mapType(limeTypeRef.type)
        if (swiftType is SwiftArray) {
            val actualType = LimeTypeHelper.getActualType(limeTypeRef.type)
            val elementType = (actualType as LimeArray).elementType
            val elementTypeKey = typeMapper.getActualTypeKey(elementType.type)
            arraysCollector.putIfAbsent(elementTypeKey, swiftType.withoutAlias())
        }

        storeResult(swiftType)
        closeContext()
    }

    private fun getVisibility(limeElement: LimeNamedElement) =
        when (limeElement.visibility) {
            LimeVisibility.INTERNAL -> SwiftVisibility.INTERNAL
            LimeVisibility.PUBLIC -> SwiftVisibility.PUBLIC
            LimeVisibility.OPEN -> SwiftVisibility.OPEN
        }
}
