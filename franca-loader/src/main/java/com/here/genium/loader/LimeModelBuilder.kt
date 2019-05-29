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

package com.here.genium.loader

import com.here.genium.franca.FrancaTypeHelper
import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.franca.SpecialTypeRules
import com.here.genium.franca.CommentHelper
import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeEnumeratorRef
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeVisibility
import org.apache.commons.text.StringEscapeUtils
import org.franca.core.framework.FrancaHelpers
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FConstant
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FInitializerExpression
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FQualifiedElementRef
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement
import org.franca.core.franca.FUnaryOperation

class LimeModelBuilder(
    contextStack: ModelBuilderContextStack<LimeElement> = ModelBuilderContextStack(),
    private val deploymentModel: FrancaDeploymentModel,
    private val referenceResolver: LimeReferenceResolver,
    private val companionHelper: FrancaCompanionHelper
) : AbstractModelBuilder<LimeElement>(contextStack) {

    override fun finishBuilding(francaInterface: FInterface) {
        val attributes = LimeAttributes.Builder()
        addExternalTypeAttributes(attributes, francaInterface)
        if (deploymentModel.isObjcInterface(francaInterface)) {
            attributes.addAttribute(LimeAttributeType.LEGACY_COMPATIBLE)
        }
        if (deploymentModel.isEquatable(francaInterface)) {
            attributes.addAttribute(LimeAttributeType.EQUATABLE)
        }
        if (deploymentModel.isPointerEquatable(francaInterface)) {
            attributes.addAttribute(LimeAttributeType.POINTER_EQUATABLE)
        }

        val containerType = when {
            deploymentModel.isInterface(francaInterface) -> ContainerType.INTERFACE
            else -> ContainerType.CLASS
        }

        val parentContainer = getPreviousResultOrNull(LimeContainer::class.java)
        val parentRef = parentContainer?.let { LimeDirectTypeRef(it) }

        finishBuildingTypeCollection(francaInterface, containerType, attributes, parentRef)
    }

    override fun finishBuilding(francaTypeCollection: FTypeCollection) {
        finishBuildingTypeCollection(
            francaTypeCollection,
            ContainerType.TYPE_COLLECTION,
            LimeAttributes.Builder(),
            null
        )
    }

    private fun finishBuildingTypeCollection(
        francaTypeCollection: FTypeCollection,
        containerType: ContainerType,
        attributes: LimeAttributes.Builder,
        parentRef: LimeTypeRef?
    ) {
        val limeContainer = LimeContainer(
            path = createElementPath(francaTypeCollection),
            visibility = getLimeVisibility(francaTypeCollection),
            comment = CommentHelper.getDescription(francaTypeCollection),
            attributes = attributes.build(),
            type = containerType,
            parent = parentRef,
            structs = getPreviousResults(LimeStruct::class.java),
            enumerations = getPreviousResults(LimeEnumeration::class.java),
            constants = getPreviousResults(LimeConstant::class.java),
            typeDefs = getPreviousResults(LimeTypeDef::class.java),
            methods = getPreviousResults(LimeMethod::class.java),
            properties = getPreviousResults(LimeProperty::class.java)
        )

        storeResultAndCloseContext(limeContainer)
    }

    override fun finishBuilding(francaStruct: FStructType) {
        val attributes = LimeAttributes.Builder()
        addExternalTypeAttributes(attributes, francaStruct)
        if (deploymentModel.isSerializable(francaStruct)) {
            attributes.addAttribute(LimeAttributeType.SERIALIZABLE)
        }
        if (deploymentModel.isEquatable(francaStruct)) {
            attributes.addAttribute(LimeAttributeType.EQUATABLE)
        }
        if (deploymentModel.isImmutable(francaStruct)) {
            attributes.addAttribute(LimeAttributeType.IMMUTABLE)
        }
        if (deploymentModel.hasJavaBuilder(francaStruct)) {
            attributes.addAttribute(LimeAttributeType.BUILDER)
        }

        val limeStruct = LimeStruct(
            path = createElementPath(francaStruct),
            visibility = getLimeVisibility(francaStruct),
            comment = CommentHelper.getDescription(francaStruct),
            attributes = attributes.build(),
            fields = getPreviousResults(LimeField::class.java),
            methods = getPreviousResults(LimeMethod::class.java),
            constants = getPreviousResults(LimeConstant::class.java)
        )

        storeResultAndCloseContext(limeStruct)
    }

    override fun finishBuilding(francaField: FField) {
        val attributes = LimeAttributes.Builder()
        addExternalAccessorAttributes(attributes, francaField)
        if (deploymentModel.isNullable(francaField)) {
            attributes.addAttribute(LimeAttributeType.NULLABLE)
        }

        var fieldType = getPreviousResult(LimeTypeRef::class.java)
        if (francaField.isArray) {
            val arrayKey = registerArrayType(fieldType.elementFullName)
            fieldType = LimeLazyTypeRef(arrayKey, referenceResolver.referenceMap)
        }

        val limeField = LimeField(
            path = createElementPath(francaField),
            visibility = getLimeVisibility(francaField),
            comment = CommentHelper.getDescription(francaField),
            attributes = attributes.build(),
            typeRef = fieldType,
            defaultValue = resolveDefaultValue(francaField, fieldType)
        )

        storeResultAndCloseContext(limeField)
    }

    override fun finishBuilding(francaTypeRef: FTypeRef) {
        val typeKey = when {
            SpecialTypeRules.isInstanceId(francaTypeRef) ->
                FrancaTypeHelper.getFullName(francaTypeRef.derived.eContainer() as FTypeCollection)
            else -> LimeReferenceResolver.getTypeKey(francaTypeRef)
        }
        val limeTypeRef = LimeLazyTypeRef(typeKey, referenceResolver.referenceMap)

        storeResultAndCloseContext(limeTypeRef)
    }

    override fun finishBuilding(francaEnum: FEnumerationType) {
        val attributes = LimeAttributes.Builder()
        addExternalTypeAttributes(attributes, francaEnum)

        val limeEnum = LimeEnumeration(
            path = createElementPath(francaEnum),
            visibility = getLimeVisibility(francaEnum),
            comment = CommentHelper.getDescription(francaEnum),
            attributes = attributes.build(),
            enumerators = getPreviousResults(LimeEnumerator::class.java)
        )

        storeResultAndCloseContext(limeEnum)
    }

    override fun finishBuilding(francaEnumerator: FEnumerator) {
        val limeEnumerator = LimeEnumerator(
            path = createElementPath(francaEnumerator),
            comment = CommentHelper.getDescription(francaEnumerator),
            value = getPreviousResultOrNull(LimeValue::class.java)
        )

        storeResultAndCloseContext(limeEnumerator)
    }

    override fun finishBuilding(francaExpression: FInitializerExpression) {
        val francaType = parentContext?.previousResults
            ?.filterIsInstance<LimeTypeRef>()
            ?.firstOrNull() ?: LimeBasicTypeRef(TypeId.INT32)
        val limeValue = when (francaExpression) {
            is FConstant, is FUnaryOperation -> {
                val stringValue = StringValueMapper.map(francaExpression)
                stringValue?.let { LimeValue.Literal(francaType, it) }
            }
            is FQualifiedElementRef -> {
                val elementKey = FrancaTypeHelper.getFullName(francaExpression.element)
                val valueRef = LimeEnumeratorRef(referenceResolver.referenceMap, elementKey)
                LimeValue.Enumerator(francaType, valueRef)
            }
            else -> null
        }

        storeResultAndCloseContext(limeValue)
    }

    override fun finishBuilding(francaConstant: FConstantDef) {
        val attributes = LimeAttributes.Builder()

        var constantType = getPreviousResult(LimeTypeRef::class.java)
        if (francaConstant.isArray) {
            val arrayKey = registerArrayType(constantType.elementFullName)
            constantType = LimeLazyTypeRef(arrayKey, referenceResolver.referenceMap)
        }

        val limeConstant = LimeConstant(
            path = createElementPath(francaConstant),
            visibility = getLimeVisibility(francaConstant),
            comment = CommentHelper.getDescription(francaConstant),
            attributes = attributes.build(),
            typeRef = constantType,
            value = getPreviousResult(LimeValue::class.java)
        )

        storeResultAndCloseContext(limeConstant)
    }

    override fun finishBuilding(francaTypeDef: FTypeDef) {
        if (!SpecialTypeRules.isInstanceId(francaTypeDef)) {
            val limeTypeDef = LimeTypeDef(
                path = createElementPath(francaTypeDef),
                visibility = getLimeVisibility(francaTypeDef),
                comment = CommentHelper.getDescription(francaTypeDef),
                typeRef = getPreviousResult(LimeTypeRef::class.java)
            )
            storeResultAndCloseContext(limeTypeDef)
        } else {
            closeContext()
        }
    }

    override fun finishBuilding(francaArrayType: FArrayType) {
        val elementTypeRef = getPreviousResult(LimeTypeRef::class.java)
        val arrayKey = when {
            deploymentModel.isSetType(francaArrayType) ->
                registerSetType(elementTypeRef.elementFullName)
            else -> registerArrayType(elementTypeRef.elementFullName)
        }

        val limeTypeDef = LimeTypeDef(
            path = createElementPath(francaArrayType),
            visibility = getLimeVisibility(francaArrayType),
            comment = CommentHelper.getDescription(francaArrayType),
            typeRef = LimeLazyTypeRef(arrayKey, referenceResolver.referenceMap)
        )

        storeResultAndCloseContext(limeTypeDef)
    }

    override fun finishBuilding(francaMapType: FMapType) {
        val types = getPreviousResults(LimeTypeRef::class.java)
        val keyTypeRef = types[0]
        val valueTypeRef = types[1]
        val mapKey = LimeReferenceResolver.getMapKey(
            keyTypeRef.elementFullName,
            valueTypeRef.elementFullName
        )
        referenceResolver.registerElement(mapKey, LimeMap(keyTypeRef, valueTypeRef))

        val limeTypeDef = LimeTypeDef(
            path = createElementPath(francaMapType),
            visibility = getLimeVisibility(francaMapType),
            comment = CommentHelper.getDescription(francaMapType),
            typeRef = LimeLazyTypeRef(mapKey, referenceResolver.referenceMap)
        )

        storeResultAndCloseContext(limeTypeDef)
    }

    override fun finishBuilding(francaMethod: FMethod) {
        val attributes = LimeAttributes.Builder()
        if (deploymentModel.isConst(francaMethod)) {
            attributes.addAttribute(LimeAttributeType.CONST)
        }
        val isConstructor = deploymentModel.isConstructor(francaMethod)
        if (isConstructor) {
            attributes.addAttribute(LimeAttributeType.CONSTRUCTOR)
        }

        val errorEnum = getPreviousResultOrNull(LimeEnumeration::class.java)
        val errorType = errorEnum?.let { LimeDirectTypeRef(it) }

        val methodLimePath = createElementPath(francaMethod)
        val limeReturnType = getPreviousResultOrNull(LimeReturnType::class.java)
        val returnType = when {
            isConstructor -> {
                val containerTypeRef = LimeLazyTypeRef(
                    methodLimePath.parent.toString(),
                    referenceResolver.referenceMap
                )
                LimeReturnType(containerTypeRef, limeReturnType?.comment ?: "")
            }
            else -> limeReturnType ?: LimeReturnType.VOID
        }
        val limeMethod = LimeMethod(
            path = methodLimePath,
            visibility = getLimeVisibility(francaMethod),
            comment = CommentHelper.getDescription(francaMethod),
            attributes = attributes.build(),
            returnType = returnType,
            parameters = getPreviousResults(LimeParameter::class.java),
            errorType = errorType,
            isStatic = isConstructor || deploymentModel.isStatic(francaMethod)
        )

        storeResultAndCloseContext(limeMethod)
    }

    override fun finishBuildingInputArgument(francaArgument: FArgument) {
        var parameterType = getPreviousResult(LimeTypeRef::class.java)
        if (francaArgument.isArray) {
            val arrayKey = registerArrayType(parameterType.elementFullName)
            parameterType = LimeLazyTypeRef(arrayKey, referenceResolver.referenceMap)
        }

        val attributes = LimeAttributes.Builder()
        if (deploymentModel.isNullable(francaArgument)) {
            attributes.addAttribute(LimeAttributeType.NULLABLE)
        }

        val limeParameter = LimeParameter(
            path = createElementPath(francaArgument),
            comment = CommentHelper.getDescription(francaArgument),
            attributes = attributes.build(),
            typeRef = parameterType
        )

        storeResultAndCloseContext(limeParameter)
    }

    override fun finishBuildingOutputArgument(francaArgument: FArgument) {
        var parameterType = getPreviousResult(LimeTypeRef::class.java)
        if (francaArgument.isArray) {
            val arrayKey = registerArrayType(parameterType.elementFullName)
            parameterType = LimeLazyTypeRef(arrayKey, referenceResolver.referenceMap)
        }

        val attributes = LimeAttributes.Builder()
        if (deploymentModel.isNullable(francaArgument)) {
            attributes.addAttribute(LimeAttributeType.NULLABLE)
        }

        val limeReturnType = LimeReturnType(
            typeRef = parameterType,
            comment = CommentHelper.getDescription(francaArgument),
            attributes = attributes.build()
        )

        storeResultAndCloseContext(limeReturnType)
    }

    override fun finishBuilding(francaAttribute: FAttribute) {
        val attributes = LimeAttributes.Builder()
        addExternalAccessorAttributes(attributes, francaAttribute)
        if (deploymentModel.isNullable(francaAttribute)) {
            attributes.addAttribute(LimeAttributeType.NULLABLE)
        }
        if (deploymentModel.hasInternalSetter(francaAttribute)) {
            attributes.addAttribute(LimeAttributeType.INTERNAL_SETTER)
        }

        var attributeType = getPreviousResult(LimeTypeRef::class.java)
        if (francaAttribute.isArray) {
            val arrayKey = registerArrayType(attributeType.elementFullName)
            attributeType = LimeLazyTypeRef(arrayKey, referenceResolver.referenceMap)
        }

        val limeProperty = LimeProperty(
            path = createElementPath(francaAttribute),
            visibility = getLimeVisibility(francaAttribute),
            comment = CommentHelper.getDescription(francaAttribute),
            attributes = attributes.build(),
            typeRef = attributeType,
            isReadonly = francaAttribute.isReadonly,
            isStatic = deploymentModel.isStatic(francaAttribute)
        )

        storeResultAndCloseContext(limeProperty)
    }

    private fun createElementPath(francaElement: FModelElement): LimePath {
        val elementPath = FrancaTypeHelper.getElementPath(francaElement)
        return LimePath(elementPath.first().split('.'), elementPath.drop(1))
    }

    private fun createElementPath(francaMethod: FMethod): LimePath {
        val parentInterface = francaMethod.eContainer() as FInterface
        val parentElement =
            companionHelper.getStructForCompanion(parentInterface) ?: parentInterface
        val parentPath = createElementPath(parentElement)
        return parentPath.child(francaMethod.name, francaMethod.selector ?: "")
    }

    private fun registerArrayType(elementTypeKey: String): String {
        val arrayKey = LimeReferenceResolver.getArrayKey(elementTypeKey)
        referenceResolver.registerElement(
            arrayKey, LimeArray(getPreviousResult(LimeTypeRef::class.java))
        )
        return arrayKey
    }

    private fun registerSetType(elementTypeKey: String): String {
        val setKey = LimeReferenceResolver.getSetKey(elementTypeKey)
        referenceResolver.registerElement(
            setKey, LimeSet(getPreviousResult(LimeTypeRef::class.java))
        )
        return setKey
    }

    private fun resolveDefaultValue(francaField: FField, fieldType: LimeTypeRef): LimeValue? {
        if (deploymentModel.hasNullDefaultValue(francaField)) {
            return LimeValue.Null(fieldType)
        }
        if (deploymentModel.hasEmptyDefaultValue(francaField)) {
            return LimeValue.InitializerList(fieldType, emptyList())
        }

        val literalValue = deploymentModel.getDefaultValue(francaField) ?: return null
        val francaTypeRef = francaField.type
        return when {
            francaTypeRef.predefined == FBasicTypeId.STRING -> {
                val escapedValue = StringEscapeUtils.escapeJava(literalValue)
                LimeValue.Literal(fieldType, "\"$escapedValue\"")
            }
            francaTypeRef.predefined == FBasicTypeId.FLOAT -> {
                val parsedValue = literalValue.toFloat()
                when {
                    parsedValue.isNaN() -> LimeValue.Special.FLOAT_NAN
                    parsedValue.isInfinite() && parsedValue > 0 -> LimeValue.Special.FLOAT_INFINITY
                    parsedValue.isInfinite() && parsedValue < 0 ->
                        LimeValue.Special.FLOAT_NEGATIVE_INFINITY
                    else -> LimeValue.Literal(fieldType, literalValue)
                }
            }
            francaTypeRef.predefined == FBasicTypeId.DOUBLE -> {
                val parsedValue = literalValue.toDouble()
                when {
                    parsedValue.isNaN() -> LimeValue.Special.DOUBLE_NAN
                    parsedValue.isInfinite() && parsedValue > 0 -> LimeValue.Special.DOUBLE_INFINITY
                    parsedValue.isInfinite() && parsedValue < 0 ->
                        LimeValue.Special.DOUBLE_NEGATIVE_INFINITY
                    else -> LimeValue.Literal(fieldType, literalValue)
                }
            }
            FrancaHelpers.isEnumeration(francaTypeRef) -> {
                val childKey =
                    LimeReferenceResolver.getChildKey(
                        francaTypeRef,
                        literalValue
                    )
                val enumeratorRef = LimeEnumeratorRef(referenceResolver.referenceMap, childKey)
                LimeValue.Enumerator(fieldType, enumeratorRef)
            }
            else -> LimeValue.Literal(fieldType, literalValue)
        }
    }

    private fun getLimeVisibility(francaElement: FModelElement) =
        when {
            deploymentModel.isInternal(francaElement) -> LimeVisibility.INTERNAL
            else -> LimeVisibility.PUBLIC
        }

    private fun addExternalTypeAttributes(
        attributes: LimeAttributes.Builder,
        francaElement: FModelElement
    ) {
        if (!deploymentModel.isExternalType(francaElement)) {
            return
        }

        attributes.addAttribute(
            LimeAttributeType.EXTERNAL_TYPE,
            deploymentModel.getExternalType(francaElement)
        )
        attributes.addAttribute(
            LimeAttributeType.EXTERNAL_NAME,
            deploymentModel.getExternalName(francaElement)
        )
    }

    private fun addExternalAccessorAttributes(
        attributes: LimeAttributes.Builder,
        francaTypedElement: FTypedElement
    ) {
        attributes.addAttribute(
            LimeAttributeType.EXTERNAL_GETTER,
            deploymentModel.getExternalGetter(francaTypedElement)
        )
        attributes.addAttribute(
            LimeAttributeType.EXTERNAL_SETTER,
            deploymentModel.getExternalSetter(francaTypedElement)
        )
    }

    private fun storeResultAndCloseContext(limeElement: LimeElement?) {
        if (limeElement != null) {
            if (limeElement is LimeNamedElement) {
                referenceResolver.registerElement(limeElement)
            }
            storeResult(limeElement)
        }
        closeContext()
    }
}
