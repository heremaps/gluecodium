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

package com.here.genium.generator.cpp

import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.genium.model.common.Comments
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppClass
import com.here.genium.model.cpp.CppConstant
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppEnumItem
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppInheritance
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.cpp.CppUsing
import com.here.genium.model.cpp.CppValue
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributeType.CPP
import com.here.genium.model.lime.LimeAttributeType.DEPRECATED
import com.here.genium.model.lime.LimeAttributeValueType
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_GETTER
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_SETTER
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_TYPE
import com.here.genium.model.lime.LimeAttributeValueType.MESSAGE
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainerWithInheritance
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeAlias
import com.here.genium.model.lime.LimeTypeHelper
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeTypesCollection
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeValue.Special.ValueId
import java.util.EnumSet

class CppModelBuilder(
    contextStack: ModelBuilderContextStack<CppElement> = ModelBuilderContextStack(),
    private val typeMapper: CppTypeMapper,
    private val nameResolver: CppNameResolver,
    private val includeResolver: CppIncludeResolver,
    private val limeReferenceMap: Map<String, LimeElement>
) : AbstractLimeBasedModelBuilder<CppElement>(contextStack) {

    override fun finishBuilding(limeContainer: LimeContainerWithInheritance) {
        val members = getPreviousResults(CppEnum::class.java) +
            getPreviousResults(CppUsing::class.java) +
            getPreviousResults(CppStruct::class.java) +
            getPreviousResults(CppConstant::class.java)

        val limeParentType = limeContainer.parent
        val inheritances = when {
            limeParentType != null -> {
                val parentType = typeMapper.mapInstanceType(
                    limeParentType.type as LimeContainerWithInheritance,
                    false
                )
                listOf(CppInheritance(parentType, CppInheritance.Type.Public))
            }
            else -> emptyList()
        }
        val isEquatable = limeContainer.attributes.have(LimeAttributeType.EQUATABLE)
        val includes = mutableListOf(CppLibraryIncludes.TYPE_REPOSITORY)
        if (isEquatable) {
            includes.add(CppLibraryIncludes.HASH)
        }
        val cppClass = CppClass(
            name = nameResolver.getName(limeContainer),
            fullyQualifiedName = nameResolver.getFullyQualifiedName(limeContainer),
            includes = includes,
            comment = createComments(limeContainer),
            isExternal = limeContainer.attributes.have(CPP, EXTERNAL_TYPE),
            members = members,
            methods = getPreviousResults(CppMethod::class.java),
            inheritances = inheritances,
            isEquatable = isEquatable
        )

        storeNamedResult(limeContainer, cppClass)
        closeContext()
    }

    override fun finishBuilding(limeTypes: LimeTypesCollection) {
        (getPreviousResults(CppEnum::class.java) +
            getPreviousResults(CppUsing::class.java) +
            getPreviousResults(CppStruct::class.java) +
            getPreviousResults(CppConstant::class.java)
        ).forEach { storeResult(it) }

        closeContext()
    }

    override fun finishBuilding(limeMethod: LimeFunction) {
        val specifiers = EnumSet.noneOf(CppMethod.Specifier::class.java)
        val qualifiers = EnumSet.noneOf(CppMethod.Qualifier::class.java)
        if (limeMethod.isStatic) {
            specifiers.add(CppMethod.Specifier.STATIC)
        } else {
            if (limeMethod.attributes.have(CPP, LimeAttributeValueType.CONST)) {
                // const needs to be before "= 0" pure virtual specifier
                qualifiers.add(CppMethod.Qualifier.CONST)
            }
            specifiers.add(CppMethod.Specifier.VIRTUAL)
            qualifiers.add(CppMethod.Qualifier.PURE_VIRTUAL)
        }

        val isNullable = limeMethod.returnType.typeRef.isNullable
        val isInstance = limeMethod.returnType.typeRef.type is LimeContainerWithInheritance
        val cppReturnType = typeMapper.mapType(limeMethod.returnType.typeRef)
        val errorEnum = getPreviousResultOrNull(CppTypeRef::class.java)
        val returnType = when {
            errorEnum != null && cppReturnType != CppPrimitiveTypeRef.VOID ->
                typeMapper.getReturnWrapperType(
                    cppReturnType,
                    CppTypeMapper.STD_ERROR_CODE_TYPE
                )
            errorEnum != null -> CppTypeMapper.STD_ERROR_CODE_TYPE
            else -> cppReturnType
        }

        val cppMethod = CppMethod(
            name = nameResolver.getName(limeMethod),
            fullyQualifiedName = nameResolver.getFullyQualifiedName(limeMethod),
            comment = createComments(limeMethod),
            returnType = returnType,
            returnComment = limeMethod.returnType.comment.getFor(PLATFORM_TAG),
            errorEnumName = errorEnum?.fullyQualifiedName,
            errorComment = limeMethod.thrownType?.comment?.getFor(PLATFORM_TAG),
            isNotNull = isInstance && !isNullable,
            parameters = getPreviousResults(CppParameter::class.java),
            specifiers = specifiers,
            qualifiers = qualifiers
        )

        storeNamedResult(limeMethod, cppMethod)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        val isNullable = limeParameter.typeRef.isNullable
        val isInstance = limeParameter.typeRef.type is LimeContainerWithInheritance

        val cppParameter = CppParameter(
            name = nameResolver.getName(limeParameter),
            type = getPreviousResult(CppTypeRef::class.java),
            isNotNull = isInstance && !isNullable
        )
        cppParameter.comment = createComments(limeParameter)

        storeNamedResult(limeParameter, cppParameter)
        closeContext()
    }

    override fun finishBuilding(limeStruct: LimeStruct) {
        val parentIsExternal = limeStruct.path.hasParent &&
            (limeReferenceMap[limeStruct.path.parent.toString()] as? LimeNamedElement)
                ?.attributes?.have(CPP, EXTERNAL_TYPE) ?: false
        val isExternal = parentIsExternal || limeStruct.attributes.have(CPP, EXTERNAL_TYPE)
        val isEquatable = limeStruct.attributes.have(LimeAttributeType.EQUATABLE)
        val includes = mutableListOf<Include>()
        if (isEquatable) {
            includes += listOf(CppLibraryIncludes.HASH)
        }
        if (isExternal) {
            includes += includeResolver.resolveIncludes(limeStruct)
        }

        val methods = getPreviousResults(CppMethod::class.java).map {
            val specifiers = setOf(CppMethod.Specifier.STATIC) intersect it.specifiers
            val qualifiers = when {
                specifiers.contains(CppMethod.Specifier.STATIC) -> emptySet()
                else -> setOf(CppMethod.Qualifier.CONST)
            }
            it.copy(specifiers, qualifiers)
        }
        val cppStruct = CppStruct(
            name = nameResolver.getName(limeStruct),
            fullyQualifiedName = nameResolver.getFullyQualifiedName(limeStruct),
            includes = includes,
            comment = createComments(limeElement = limeStruct),
            isExternal = isExternal,
            fields = getPreviousResults(CppField::class.java),
            methods = methods,
            constants = getPreviousResults(CppConstant::class.java),
            isEquatable = isEquatable,
            isImmutable = limeStruct.attributes.have(LimeAttributeType.IMMUTABLE),
            constructorComment = limeStruct.constructorComment.getFor(PLATFORM_TAG)
        )

        storeNamedResult(limeStruct, cppStruct)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val isNullable = limeField.typeRef.isNullable
        val isInstance = limeField.typeRef.type is LimeContainerWithInheritance

        val allTypes = LimeTypeHelper.getAllFieldTypes(limeField.typeRef.type)
        val hasImmutableType = allTypes.any { it.attributes.have(LimeAttributeType.IMMUTABLE) }

        val cppField = CppField(
            name = nameResolver.getName(limeField),
            fullyQualifiedName = nameResolver.getFullyQualifiedName(limeField),
            type = getPreviousResult(CppTypeRef::class.java),
            initializer = getPreviousResultOrNull(CppValue::class.java),
            isNotNull = isInstance && !isNullable,
            isNullable = isNullable,
            hasImmutableType = hasImmutableType,
            isClassEquatable = isInstance && limeField.typeRef.type.attributes.have(LimeAttributeType.EQUATABLE),
            isClassPointerEquatable = isInstance && limeField.typeRef.type.attributes.have(LimeAttributeType.POINTER_EQUATABLE),
            externalGetter = limeField.attributes.get(CPP, EXTERNAL_GETTER),
            externalSetter = limeField.attributes.get(CPP, EXTERNAL_SETTER)
        )
        cppField.comment = createComments(limeField)

        storeNamedResult(limeField, cppField)
        closeContext()
    }

    override fun finishBuilding(limeTypeDef: LimeTypeAlias) {
        val cppUsing = CppUsing(
            nameResolver.getName(limeTypeDef),
            nameResolver.getFullyQualifiedName(limeTypeDef),
            createComments(limeTypeDef),
            getPreviousResult(CppTypeRef::class.java)
        )

        storeNamedResult(limeTypeDef, cppUsing)
        closeContext()
    }

    override fun finishBuilding(limeProperty: LimeProperty) {
        val cppTypeRef = getPreviousResult(CppTypeRef::class.java)
        val isNullable = limeProperty.typeRef.isNullable
        val isInstance = limeProperty.typeRef.type is LimeContainerWithInheritance
        val isNotNull = !isNullable && isInstance
        val propertyComment = limeProperty.comment.getFor(PLATFORM_TAG)

        val specifiers = when {
            limeProperty.isStatic -> EnumSet.of(CppMethod.Specifier.STATIC)
            else -> EnumSet.of(CppMethod.Specifier.VIRTUAL)
        }
        val getterQualifiers = when {
            limeProperty.isStatic -> EnumSet.noneOf(CppMethod.Qualifier::class.java)
            else -> EnumSet.of(CppMethod.Qualifier.CONST, CppMethod.Qualifier.PURE_VIRTUAL)
        }

        val getterComments = Comments(
            limeProperty.getter.comment.getFor(PLATFORM_TAG),
            limeProperty.getter.attributes.get(DEPRECATED, MESSAGE)
        )
        val getterMethod = CppMethod(
            name = nameResolver.getGetterName(limeProperty),
            fullyQualifiedName = nameResolver.getFullyQualifiedGetterName(limeProperty),
            comment = getterComments,
            returnType = cppTypeRef,
            returnComment = propertyComment,
            isNotNull = isNotNull,
            specifiers = specifiers,
            qualifiers = getterQualifiers
        )
        storeNamedResult(limeProperty, getterMethod)
        referenceMap["${limeProperty.fullName}.get"] = getterMethod

        val limeSetter = limeProperty.setter
        if (limeSetter != null) {
            val setterParameter = CppParameter("value", cppTypeRef, isNotNull)
            setterParameter.comment = Comments(propertyComment)
            val setterQualifiers = when {
                limeProperty.isStatic -> EnumSet.noneOf(CppMethod.Qualifier::class.java)
                else -> EnumSet.of(CppMethod.Qualifier.PURE_VIRTUAL)
            }
            val setterComments = Comments(
                limeSetter.comment.getFor(PLATFORM_TAG),
                limeSetter.attributes.get(DEPRECATED, MESSAGE)
            )
            val setterMethod = CppMethod(
                name = nameResolver.getSetterName(limeProperty),
                fullyQualifiedName = nameResolver.getFullyQualifiedSetterName(limeProperty),
                comment = setterComments,
                parameters = listOf(setterParameter),
                specifiers = specifiers,
                qualifiers = setterQualifiers
            )
            storeResult(setterMethod)
            referenceMap["${limeProperty.fullName}.set"] = setterMethod
        }

        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val parentIsExternal = limeEnumeration.path.hasParent &&
                (limeReferenceMap[limeEnumeration.path.parent.toString()] as? LimeNamedElement)
                    ?.attributes?.have(CPP, EXTERNAL_TYPE) ?: false
        val isExternal = parentIsExternal || limeEnumeration.attributes.have(CPP, EXTERNAL_TYPE)
        val includes = mutableListOf(CppLibraryIncludes.HASH)
        if (isExternal) {
            includes += includeResolver.resolveIncludes(limeEnumeration)
        }

        val cppEnum = CppEnum(
            name = nameResolver.getName(limeEnumeration),
            fullyQualifiedName = nameResolver.getFullyQualifiedName(limeEnumeration),
            includes = includes,
            isExternal = isExternal,
            items = getPreviousResults(CppEnumItem::class.java)
        )
        cppEnum.comment = createComments(limeEnumeration)

        storeNamedResult(limeEnumeration, cppEnum)
        closeContext()
    }

    override fun finishBuilding(limeEnumerator: LimeEnumerator) {
        val actualValue = getPreviousResultOrNull(CppValue::class.java)
        val cppEnumItem = CppEnumItem(
            nameResolver.getName(limeEnumerator),
            nameResolver.getFullyQualifiedName(limeEnumerator),
            actualValue,
            actualValue ?: inferEnumValue()
        )
        cppEnumItem.comment = createComments(limeEnumerator)

        storeNamedResult(limeEnumerator, cppEnumItem)
        closeContext()
    }

    override fun finishBuilding(limeConstant: LimeConstant) {
        val cppConstant = CppConstant(
            nameResolver.getName(limeConstant),
            nameResolver.getFullyQualifiedName(limeConstant),
            getPreviousResult(CppTypeRef::class.java),
            getPreviousResult(CppValue::class.java)
        )
        cppConstant.comment = createComments(limeConstant)

        storeNamedResult(limeConstant, cppConstant)
        closeContext()
    }

    override fun finishBuilding(limeValue: LimeValue) {
        val cppValue = mapValue(limeValue)

        storeResult(cppValue)
        closeContext()
    }

    override fun finishBuilding(limeException: LimeException) {
        referenceMap[limeException.fullName] = getPreviousResult(CppTypeRef::class.java)
        closeContext()
    }

    private fun mapValue(limeValue: LimeValue): CppValue {
        val valueType = limeValue.typeRef.type
        val isFloat = valueType is LimeBasicType && valueType.typeId == LimeBasicType.TypeId.FLOAT
        return when (limeValue) {
            is LimeValue.Literal -> {
                val suffix = if (isFloat) "f" else ""
                CppValue(limeValue.toString() + suffix)
            }
            is LimeValue.Enumerator ->
                CppValue(nameResolver.getFullyQualifiedName(limeValue.valueRef.enumerator))
            is LimeValue.Special -> {
                val signPrefix = if (limeValue.value == ValueId.NEGATIVE_INFINITY) "-" else ""
                val typeString = if (isFloat) "float" else "double"
                val valueString = if (limeValue.value == ValueId.NAN) "quiet_NaN" else "infinity"
                CppValue(
                    "${signPrefix}std::numeric_limits<$typeString>::$valueString()",
                    listOf(CppLibraryIncludes.LIMITS)
                )
            }
            is LimeValue.Null -> {
                val cppType = getPreviousResult(CppTypeRef::class.java)
                CppValue("${cppType.name}()", listOf(CppLibraryIncludes.OPTIONAL))
            }
            is LimeValue.InitializerList -> {
                val valuesString = limeValue.values.joinToString(
                    separator = ", ",
                    prefix = "{",
                    postfix = "}"
                ) { mapValue(it).name }
                CppValue(valuesString)
            }
        }
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        storeResult(typeMapper.mapType(limeTypeRef))
        closeContext()
    }

    private fun createComments(limeElement: LimeNamedElement) =
        createComments(limeElement, PLATFORM_TAG)

    private fun inferEnumValue(): CppValue {
        val previousValue = parentContext!!.previousResults
            .filterIsInstance<CppEnumItem>()
            .lastOrNull()?.inferredValue
            ?: return CppValue("0")
        return CppValue((Integer.parseInt(previousValue.name) + 1).toString())
    }

    companion object {
        const val PLATFORM_TAG = "Cpp"
    }
}
