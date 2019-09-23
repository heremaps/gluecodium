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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.common.ModelBuilderContextStack
import com.here.gluecodium.generator.cbridge.CBridgeNameRules
import com.here.gluecodium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.swift.SwiftClass
import com.here.gluecodium.model.swift.SwiftConstant
import com.here.gluecodium.model.swift.SwiftEnum
import com.here.gluecodium.model.swift.SwiftEnumItem
import com.here.gluecodium.model.swift.SwiftError
import com.here.gluecodium.model.swift.SwiftThrownType
import com.here.gluecodium.model.swift.SwiftField
import com.here.gluecodium.model.swift.SwiftFile
import com.here.gluecodium.model.swift.SwiftClosure
import com.here.gluecodium.model.swift.SwiftMethod
import com.here.gluecodium.model.swift.SwiftModelElement
import com.here.gluecodium.model.swift.SwiftParameter
import com.here.gluecodium.model.swift.SwiftProperty
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.model.swift.SwiftType
import com.here.gluecodium.model.swift.SwiftTypeDef
import com.here.gluecodium.model.swift.SwiftValue
import com.here.gluecodium.model.swift.SwiftVisibility

class SwiftModelBuilder(
    contextStack: ModelBuilderContextStack<SwiftModelElement> = ModelBuilderContextStack(),
    private val limeReferenceMap: Map<String, LimeElement>,
    private val signatureResolver: LimeSignatureResolver,
    private val nameResolver: SwiftNameResolver,
    private val typeMapper: SwiftTypeMapper,
    private val nameRules: SwiftNameRules,
    private val buildTransientModel: (LimeNamedElement) -> List<SwiftFile>
) : AbstractLimeBasedModelBuilder<SwiftModelElement>(contextStack) {

    override fun finishBuilding(limeContainer: LimeContainerWithInheritance) {
        when (limeContainer) {
            is LimeClass -> finishBuildingClass(limeContainer)
            is LimeInterface -> finishBuildingInterface(limeContainer)
        }

        closeContext()
    }

    override fun finishBuilding(limeTypes: LimeTypesCollection) {
        val file = SwiftFile(nameRules.getImplementationFileName(limeTypes))
        file.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        file.enums.addAll(getPreviousResults(SwiftEnum::class.java))
        file.typeDefs.addAll(getPreviousResults(SwiftTypeDef::class.java))

        val constants = getPreviousResults(SwiftConstant::class.java)
        if (constants.isNotEmpty()) {
            val swiftStruct = SwiftStruct(
                name = nameRules.getName(limeTypes),
                visibility = getVisibility(limeTypes),
                constants = constants
            )
            file.structs.add(swiftStruct)
        }

        storeResult(file)
        closeContext()
    }

    private fun finishBuildingClass(limeClass: LimeClass) {
        val parentClass =
            limeClass.parent?.type?.let { buildTransientModel(it).first().classes.first() }
        val isObjcInterface = limeClass.attributes.have(SWIFT, LimeAttributeValueType.OBJC)
        val parentClassName = when {
            parentClass != null && !parentClass.isInterface -> parentClass.name
            isObjcInterface -> SwiftTypeMapper.OBJC_PARENT_CLASS
            else -> null
        }

        val swiftClass = SwiftClass(
            nestedNames = nameResolver.getNestedNames(limeClass),
            visibility = getVisibility(limeClass),
            parentClass = parentClassName,
            nameSpace = limeClass.path.head.joinToString("_"),
            cInstance = CBridgeNameRules.getInterfaceName(limeClass),
            useParentCInstance = parentClass != null && !parentClass.isInterface,
            hasEquatableType = limeClass.attributes.have(LimeAttributeType.EQUATABLE) ||
                    limeClass.attributes.have(LimeAttributeType.POINTER_EQUATABLE),
            isObjcInterface = isObjcInterface,
            hasTypeRepository = parentClass != null || limeClass.visibility.isOpen
        )
        swiftClass.comment = createComments(limeClass)

        val swiftFile = SwiftFile(nameRules.getImplementationFileName(limeClass))
        addMembersAndParent(swiftFile, swiftClass, parentClass)
        swiftClass.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        swiftClass.enums.addAll(getPreviousResults(SwiftEnum::class.java))
        swiftClass.classes.addAll(getPreviousResults(SwiftClass::class.java))

        storeNamedResult(limeClass, swiftClass)
        storeResult(swiftFile)
    }

    private fun finishBuildingInterface(limeContainer: LimeInterface) {
        val parentClass =
            limeContainer.parent?.type?.let { buildTransientModel(it).first().classes.first() }
        val swiftClass = SwiftClass(
            nestedNames = nameResolver.getNestedNames(limeContainer),
            visibility = getVisibility(limeContainer),
            isInterface = true,
            parentClass = parentClass?.name,
            nameSpace = limeContainer.path.head.joinToString("_"),
            cInstance = CBridgeNameRules.getInterfaceName(limeContainer),
            functionTableName = CBridgeNameRules.getFunctionTableName(limeContainer),
            isObjcInterface = limeContainer.attributes.have(SWIFT, LimeAttributeValueType.OBJC),
            hasTypeRepository = true
        )
        swiftClass.comment = createComments(limeContainer)

        val swiftFile = SwiftFile(nameRules.getImplementationFileName(limeContainer))
        addMembersAndParent(swiftFile, swiftClass, parentClass)
        swiftFile.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        swiftFile.enums.addAll(getPreviousResults(SwiftEnum::class.java))
        swiftFile.classes.addAll(getPreviousResults(SwiftClass::class.java))

        storeNamedResult(limeContainer, swiftClass)
        storeResult(swiftFile)
    }

    private fun addMembersAndParent(
        swiftFile: SwiftFile,
        swiftClass: SwiftClass,
        parentClass: SwiftClass?
    ) {
        if (parentClass != null && parentClass.isInterface) {
            swiftClass.implementsProtocols.add(parentClass.name)
            swiftClass.methods.addAll(parentClass.methods)
            swiftClass.properties.addAll(parentClass.properties)
        }

        swiftClass.methods.addAll(getPreviousResults(SwiftMethod::class.java))
        swiftClass.properties.addAll(getPreviousResults(SwiftProperty::class.java))
        swiftClass.typedefs.addAll(getPreviousResults(SwiftTypeDef::class.java))
        swiftClass.constants.addAll(getPreviousResults(SwiftConstant::class.java))
        swiftClass.closures.addAll(getPreviousResults(SwiftClosure::class.java))

        swiftFile.classes.add(swiftClass)
    }

    override fun finishBuilding(limeMethod: LimeFunction) {
        val returnType = when {
            limeMethod.isConstructor -> SwiftType(CBridgeNameRules.BASE_REF_NAME)
            else -> {
                val isNullable = limeMethod.returnType.typeRef.isNullable
                typeMapper.mapType(limeMethod.returnType.typeRef.type).withOptional(isNullable)
            }
        }

        val error = limeMethod.thrownType?.let {
            val exception = LimeTypeHelper.getActualType(it.typeRef.type) as LimeException
            val swiftEnumName = nameResolver.getFullName(exception)
            SwiftThrownType(swiftEnumName, it.comment.getFor(PLATFORM_TAG))
        }

        val cShortName = CBridgeNameRules.getShortMethodName(
            limeReferenceMap = limeReferenceMap,
            limeMethod = limeMethod,
            isOverloaded = signatureResolver.isOverloaded(limeMethod)
        )
        val method = SwiftMethod(
            name = nameRules.getName(limeMethod),
            visibility = getVisibility(limeMethod),
            comment = createComments(limeMethod),
            returnType = returnType,
            returnComment = limeMethod.returnType.comment.getFor(PLATFORM_TAG),
            cNestedSpecifier = CBridgeNameRules.getNestedSpecifierString(limeMethod),
            cShortName = cShortName,
            error = error,
            isStatic = limeMethod.isStatic,
            isConstructor = limeMethod.isConstructor,
            isOverriding = limeMethod.isConstructor && signatureResolver.hasSignatureClash(
                limeMethod
            ),
            parameters = getPreviousResults(SwiftParameter::class.java)
        )

        storeNamedResult(limeMethod, method)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        val swiftType = getPreviousResult(SwiftType::class.java)
            .withOptional(limeParameter.typeRef.isNullable)

        val swiftParameter = SwiftParameter(
            nameRules.getName(limeParameter),
            swiftType,
            limeParameter.attributes.get(SWIFT, LimeAttributeValueType.LABEL)
        )
        swiftParameter.comment = createComments(limeParameter)

        storeNamedResult(limeParameter, swiftParameter)
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
            methods = getPreviousResults(SwiftMethod::class.java),
            generatedConstructorComment = limeStruct.constructorComment.getFor(PLATFORM_TAG)
        )
        swiftStruct.comment = createComments(limeStruct)

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
        swiftField.comment = createComments(limeField)

        storeNamedResult(limeField, swiftField)
        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val swiftEnum = SwiftEnum(
            nameResolver.getFullName(limeEnumeration),
            getVisibility(limeEnumeration),
            getPreviousResults(SwiftEnumItem::class.java)
        )
        swiftEnum.comment = createComments(limeEnumeration)

        storeNamedResult(limeEnumeration, swiftEnum)
        closeContext()
    }

    override fun finishBuilding(limeEnumerator: LimeEnumerator) {
        val swiftEnumItem = SwiftEnumItem(
            nameRules.getName(limeEnumerator),
            getPreviousResultOrNull(SwiftValue::class.java)
        )
        swiftEnumItem.comment = createComments(limeEnumerator)

        storeNamedResult(limeEnumerator, swiftEnumItem)
        closeContext()
    }

    override fun finishBuilding(limeException: LimeException) {
        val error = SwiftError(
            nameRules.getName(limeException),
            getVisibility(limeException),
            getPreviousResult(SwiftEnum::class.java)
        )
        error.comment = createComments(limeException)

        storeNamedResult(limeException, error)
        closeContext()
    }

    override fun finishBuilding(limeTypeDef: LimeTypeAlias) {
        val swiftTypeDef = SwiftTypeDef(
            nameResolver.getFullName(limeTypeDef),
            getVisibility(limeTypeDef),
            getPreviousResult(SwiftType::class.java)
        )
        swiftTypeDef.comment = createComments(limeTypeDef)

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
        swiftConstant.comment = createComments(limeConstant)

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
        property.comment = createComments(limeProperty)

        storeNamedResult(limeProperty, property)
        referenceMap["${limeProperty.fullName}.get"] = property
        referenceMap["${limeProperty.fullName}.set"] = property
        closeContext()
    }

    override fun finishBuilding(limeValue: LimeValue) {
        val swiftValue = mapValue(limeValue)

        storeResult(swiftValue)
        closeContext()
    }

    private fun mapValue(limeValue: LimeValue): SwiftValue =
        when (limeValue) {
            is LimeValue.Literal -> SwiftValue(limeValue.toString())
            is LimeValue.Enumerator -> {
                val typeName = nameResolver.getFullName(limeValue.typeRef.type)
                val valueName = nameRules.getName(limeValue.valueRef.enumerator)
                SwiftValue("$typeName.$valueName")
            }
            is LimeValue.Special -> {
                val signPrefix =
                    if (limeValue.value == LimeValue.Special.ValueId.NEGATIVE_INFINITY) "-" else ""
                val typeName = when {
                    (limeValue.typeRef.type as LimeBasicType).typeId ==
                            LimeBasicType.TypeId.FLOAT -> "Float"
                    else -> "Double"
                }
                val valueName =
                    if (limeValue.value == LimeValue.Special.ValueId.NAN) "nan" else "infinity"
                SwiftValue("$signPrefix$typeName.$valueName")
            }
            is LimeValue.Null -> SwiftValue("nil")
            is LimeValue.InitializerList -> {
                val initializer = when (LimeTypeHelper.getActualType(limeValue.typeRef.type)) {
                    is LimeMap -> "[:]"
                    is LimeList, is LimeSet ->
                        limeValue.values.joinToString(
                            separator = ", ",
                            prefix = "[",
                            postfix = "]"
                        ) { mapValue(it).name }
                    else -> {
                        val limeType = limeValue.typeRef.type as LimeStruct
                        val valuesString = limeValue.values
                            .mapIndexed { i, value ->
                                nameRules.getName(limeType.fields[i]) + ": " + mapValue(value).name
                            }.joinToString(separator = ", ", prefix = "(", postfix = ")")
                        nameResolver.getFullName(limeType) + valuesString
                    }
                }
                SwiftValue(initializer)
            }
        }

    override fun finishBuilding(limeLambda: LimeLambda) {
        val swiftElement = SwiftClosure(
            name = nameResolver.getFullName(limeLambda),
            cPrefix = CBridgeNameRules.getTypeName(limeLambda),
            visibility = getVisibility(limeLambda),
            comment = createComments(limeLambda),
            functionTableName = CBridgeNameRules.getFunctionTableName(limeLambda),
            parameters = limeLambda.parameters.map { typeMapper.mapType(it.typeRef.type) },
            returnType = typeMapper.mapType(limeLambda.returnType.type)
        )

        storeNamedResult(limeLambda, swiftElement)
        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        storeResult(typeMapper.mapType(limeTypeRef.type))
        closeContext()
    }

    private fun getVisibility(limeElement: LimeNamedElement) =
        when {
            limeElement.visibility.isInteral -> SwiftVisibility.INTERNAL
            else -> SwiftVisibility.PUBLIC
        }

    private fun createComments(limeElement: LimeNamedElement) =
        createComments(limeElement, PLATFORM_TAG)

    companion object {
        const val PLATFORM_TAG = "Swift"
    }
}
