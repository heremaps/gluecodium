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
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.CACHED
import com.here.gluecodium.model.lime.LimeAttributeType.EQUATABLE
import com.here.gluecodium.model.lime.LimeAttributeType.POINTER_EQUATABLE
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributeValueType.ATTRIBUTE
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeAttributeValueType.WEAK
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.FRAMEWORK_NAME
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.swift.SwiftClass
import com.here.gluecodium.model.swift.SwiftClosure
import com.here.gluecodium.model.swift.SwiftConstant
import com.here.gluecodium.model.swift.SwiftEnum
import com.here.gluecodium.model.swift.SwiftEnumItem
import com.here.gluecodium.model.swift.SwiftError
import com.here.gluecodium.model.swift.SwiftExtension
import com.here.gluecodium.model.swift.SwiftField
import com.here.gluecodium.model.swift.SwiftFile
import com.here.gluecodium.model.swift.SwiftMethod
import com.here.gluecodium.model.swift.SwiftModelElement
import com.here.gluecodium.model.swift.SwiftParameter
import com.here.gluecodium.model.swift.SwiftProperty
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.model.swift.SwiftThrownType
import com.here.gluecodium.model.swift.SwiftType
import com.here.gluecodium.model.swift.SwiftTypeDef
import com.here.gluecodium.model.swift.SwiftValue
import com.here.gluecodium.model.swift.SwiftVisibility

class SwiftModelBuilder(
    contextStack: ModelBuilderContextStack<SwiftModelElement> = ModelBuilderContextStack(),
    private val limeReferenceMap: Map<String, LimeElement>,
    private val signatureResolver: LimeSignatureResolver,
    private val nameResolver: SwiftNestedNamesResolver,
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
        if (limeTypes.attributes.have(SWIFT, LimeAttributeValueType.EXTENSION)) {
            file.extensions += SwiftExtension(
                name = nameRules.getName(limeTypes),
                visibility = getVisibility(limeTypes),
                structs = getPreviousResults(SwiftStruct::class.java),
                enums = getPreviousResults(SwiftEnum::class.java),
                typeAliases = getPreviousResults(SwiftTypeDef::class.java),
                constants = getPreviousResults(SwiftConstant::class.java)
            )
        } else {
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
            hasEquatableType = limeClass.attributes.have(EQUATABLE) ||
                    limeClass.attributes.have(POINTER_EQUATABLE),
            isObjcInterface = isObjcInterface,
            hasTypeRepository = parentClass != null || limeClass.visibility.isOpen
        )
        swiftClass.comment = createComments(limeClass)
        propagateAttributes(limeClass, swiftClass)

        val swiftFile = SwiftFile(nameRules.getImplementationFileName(limeClass))
        addMembersAndParent(swiftFile, swiftClass, parentClass)
        swiftClass.structs.addAll(getPreviousResults(SwiftStruct::class.java))
        swiftClass.enums.addAll(getPreviousResults(SwiftEnum::class.java))

        val nestedClasses = getPreviousResults(SwiftClass::class.java)
        swiftClass.classes.addAll(nestedClasses.filterNot { it.isInterface })
        swiftFile.classes.addAll(nestedClasses.filter { it.isInterface })

        storeNamedResult(limeClass, swiftClass)
        storeResult(swiftFile)
    }

    private fun finishBuildingInterface(limeContainer: LimeInterface) {
        val parentClass =
            limeContainer.parent?.type?.let { buildTransientModel(it).first().classes.first() }
        val hasWeakSupport = limeReferenceMap.values.filterIsInstance<LimeProperty>()
            .filter { it.attributes.have(SWIFT, WEAK) }
            .any { it.typeRef.type.actualType.path.toString() == limeContainer.path.toString() }
        val swiftClass = SwiftClass(
            nestedNames = nameResolver.getNestedNames(limeContainer),
            visibility = getVisibility(limeContainer),
            isInterface = true,
            parentClass = parentClass?.name,
            nameSpace = limeContainer.path.head.joinToString("_"),
            cInstance = CBridgeNameRules.getInterfaceName(limeContainer),
            functionTableName = CBridgeNameRules.getFunctionTableName(limeContainer),
            hasEquatableType = limeContainer.attributes.have(EQUATABLE),
            isObjcInterface = limeContainer.attributes.have(SWIFT, LimeAttributeValueType.OBJC),
            hasTypeRepository = true,
            hasWeakSupport = hasWeakSupport
        )
        swiftClass.comment = createComments(limeContainer)
        propagateAttributes(limeContainer, swiftClass)

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
            else -> typeMapper.mapType(limeMethod.returnType.typeRef)
        }

        val error = limeMethod.thrownType?.let {
            val exception = it.typeRef.type.actualType as LimeException
            val swiftErrorTypeName = nameResolver.getFullName(exception)
            SwiftThrownType(swiftErrorTypeName, it.comment.getFor(PLATFORM_TAG))
        }

        val cShortName = CBridgeNameRules.getShortMethodName(
            limeReferenceMap = limeReferenceMap,
            limeMethod = limeMethod,
            isOverloaded = signatureResolver.isOverloaded(limeMethod)
        )
        val swiftMethod = SwiftMethod(
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
            isOverriding = limeMethod.isConstructor && signatureResolver.hasSignatureClash(limeMethod),
            isSkipped = limeMethod.attributes.have(SWIFT, SKIP),
            parameters = getPreviousResults(SwiftParameter::class.java)
        )
        propagateAttributes(limeMethod, swiftMethod)

        storeNamedResult(limeMethod, swiftMethod)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        val swiftParameter = SwiftParameter(
            nameRules.getName(limeParameter),
            getPreviousResult(SwiftType::class.java),
            limeParameter.attributes.get(SWIFT, LimeAttributeValueType.LABEL)
        )
        swiftParameter.comment = createComments(limeParameter)
        propagateAttributes(limeParameter, swiftParameter)

        storeNamedResult(limeParameter, swiftParameter)
        closeContext()
    }

    override fun finishBuilding(limeStruct: LimeStruct) {
        val swiftStruct = SwiftStruct(
            name = nameResolver.getFullName(limeStruct),
            cPrefix = CBridgeNameRules.getTypeName(limeStruct),
            visibility = getVisibility(limeStruct),
            isEquatable = limeStruct.attributes.have(EQUATABLE),
            isImmutable = limeStruct.attributes.have(LimeAttributeType.IMMUTABLE),
            isCodable = limeStruct.attributes.have(LimeAttributeType.SERIALIZABLE),
            fields = getPreviousResults(SwiftField::class.java),
            constants = getPreviousResults(SwiftConstant::class.java),
            methods = getPreviousResults(SwiftMethod::class.java),
            generatedConstructorComment = limeStruct.constructorComment.getFor(PLATFORM_TAG),
            externalFramework = limeStruct.external?.swift?.get(FRAMEWORK_NAME),
            externalConverter = limeStruct.external?.swift?.get(CONVERTER_NAME),
            structs = getPreviousResults(SwiftStruct::class.java),
            classes = getPreviousResults(SwiftClass::class.java),
            enums = getPreviousResults(SwiftEnum::class.java)
        )
        swiftStruct.comment = createComments(limeStruct)
        propagateAttributes(limeStruct, swiftStruct)

        storeNamedResult(limeStruct, swiftStruct)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val swiftValue = getPreviousResultOrNull(SwiftValue::class.java)
            ?: if (limeField.typeRef.isNullable) SwiftValue("nil") else null

        val limeType = limeField.typeRef.type.actualType
        val isRefEquatable =
            limeType is LimeContainerWithInheritance &&
            !limeType.attributes.have(EQUATABLE) &&
            !limeType.attributes.have(POINTER_EQUATABLE)
        val swiftField = SwiftField(
            name = nameRules.getName(limeField),
            visibility = getVisibility(limeField),
            type = getPreviousResult(SwiftType::class.java),
            defaultValue = swiftValue,
            isRefEquatable = isRefEquatable
        )
        swiftField.comment = createComments(limeField)
        propagateAttributes(limeField, swiftField)

        storeNamedResult(limeField, swiftField)
        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val swiftEnum = SwiftEnum(
            name = nameResolver.getFullName(limeEnumeration),
            visibility = getVisibility(limeEnumeration),
            items = getPreviousResults(SwiftEnumItem::class.java),
            externalFramework = limeEnumeration.external?.swift?.get(FRAMEWORK_NAME),
            externalConverter = limeEnumeration.external?.swift?.get(CONVERTER_NAME)
        )
        swiftEnum.comment = createComments(limeEnumeration)
        propagateAttributes(limeEnumeration, swiftEnum)

        storeNamedResult(limeEnumeration, swiftEnum)
        closeContext()
    }

    override fun finishBuilding(limeEnumerator: LimeEnumerator) {
        val swiftEnumItem = SwiftEnumItem(
            nameRules.getName(limeEnumerator),
            getPreviousResultOrNull(SwiftValue::class.java)
        )
        swiftEnumItem.comment = createComments(limeEnumerator)
        propagateAttributes(limeEnumerator, swiftEnumItem)

        storeNamedResult(limeEnumerator, swiftEnumItem)
        closeContext()
    }

    override fun finishBuilding(limeException: LimeException) {
        val swiftError = SwiftError(
            nameRules.getName(limeException),
            getVisibility(limeException),
            getPreviousResult(SwiftType::class.java)
        )
        swiftError.comment = createComments(limeException)
        propagateAttributes(limeException, swiftError)

        storeNamedResult(limeException, swiftError)
        closeContext()
    }

    override fun finishBuilding(limeTypeDef: LimeTypeAlias) {
        val swiftTypeDef = SwiftTypeDef(
            nameResolver.getFullName(limeTypeDef),
            getVisibility(limeTypeDef),
            getPreviousResult(SwiftType::class.java)
        )
        swiftTypeDef.comment = createComments(limeTypeDef)
        propagateAttributes(limeTypeDef, swiftTypeDef)

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
        propagateAttributes(limeConstant, swiftConstant)

        storeNamedResult(limeConstant, swiftConstant)
        closeContext()
    }

    override fun finishBuilding(limeProperty: LimeProperty) {
        val propertyVisibility = getVisibility(limeProperty)
        val swiftType = getPreviousResult(SwiftType::class.java)

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

        val swiftProperty = SwiftProperty(
            propertyName = nameRules.getPropertyName(limeProperty),
            visibility = propertyVisibility,
            type = swiftType,
            getter = getterMethod,
            setter = swiftSetter,
            isStatic = limeProperty.isStatic,
            isCached = limeProperty.attributes.have(CACHED),
            isWeak = limeProperty.attributes.have(SWIFT, WEAK),
            isSkipped = limeProperty.attributes.have(SWIFT, SKIP)
        )
        swiftProperty.comment = createComments(limeProperty)
        propagateAttributes(limeProperty, swiftProperty)

        storeNamedResult(limeProperty, swiftProperty)
        referenceMap["${limeProperty.fullName}.get"] = swiftProperty
        referenceMap["${limeProperty.fullName}.set"] = swiftProperty
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
                val limeType = limeValue.typeRef.type.actualType
                val initializer = when {
                    limeType is LimeStruct -> {
                        val valuesString = limeValue.values
                            .mapIndexed { i, value ->
                                nameRules.getName(limeType.fields[i]) + ": " + mapValue(value).name
                            }.joinToString(separator = ", ", prefix = "(", postfix = ")")
                        nameResolver.getFullName(limeType) + valuesString
                    }
                    limeType is LimeMap && limeValue.values.isEmpty() -> "[:]"
                    else -> limeValue.values.joinToString(
                        separator = ", ",
                        prefix = "[",
                        postfix = "]"
                    ) { mapValue(it).name }
                }
                SwiftValue(initializer)
            }
            is LimeValue.KeyValuePair -> {
                val keyString = mapValue(limeValue.key).name
                val valueString = mapValue(limeValue.value).name
                SwiftValue("$keyString: $valueString")
            }
        }

    override fun finishBuilding(limeLambda: LimeLambda) {
        val swiftElement = SwiftClosure(
            name = nameResolver.getFullName(limeLambda),
            cPrefix = CBridgeNameRules.getInterfaceName(limeLambda),
            visibility = getVisibility(limeLambda),
            comment = createComments(limeLambda),
            functionTableName = CBridgeNameRules.getFunctionTableName(limeLambda),
            parameters = limeLambda.parameters.map { typeMapper.mapType(it.typeRef) },
            returnType = typeMapper.mapType(limeLambda.returnType.typeRef)
        )
        propagateAttributes(limeLambda, swiftElement)

        storeNamedResult(limeLambda, swiftElement)
        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        storeResult(typeMapper.mapType(limeTypeRef))
        closeContext()
    }

    private fun getVisibility(limeElement: LimeNamedElement) =
        when {
            limeElement.visibility.isInternal -> SwiftVisibility.INTERNAL
            limeElement.external?.swift?.get(CONVERTER_NAME) != null -> SwiftVisibility.INTERNAL
            else -> SwiftVisibility.PUBLIC
        }

    private fun createComments(limeElement: LimeNamedElement) =
        createComments(limeElement, PLATFORM_TAG)

    private fun propagateAttributes(limeElement: LimeNamedElement, swiftElement: SwiftModelElement) {
        val attribute = limeElement.attributes.get(SWIFT, ATTRIBUTE, Any::class.java)
        when {
            attribute is List<*> -> swiftElement.attributes = attribute.map { it.toString() }
            attribute != null -> swiftElement.attributes = listOf(attribute.toString())
        }
    }

    companion object {
        const val PLATFORM_TAG = "Swift"
    }
}
