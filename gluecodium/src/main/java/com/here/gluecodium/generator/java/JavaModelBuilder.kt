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

package com.here.gluecodium.generator.java

import com.here.gluecodium.common.ModelBuilderContextStack
import com.here.gluecodium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.gluecodium.model.common.Comments
import com.here.gluecodium.model.java.JavaClass
import com.here.gluecodium.model.java.JavaConstant
import com.here.gluecodium.model.java.JavaCustomTypeRef
import com.here.gluecodium.model.java.JavaElement
import com.here.gluecodium.model.java.JavaEnum
import com.here.gluecodium.model.java.JavaEnumItem
import com.here.gluecodium.model.java.JavaExceptionClass
import com.here.gluecodium.model.java.JavaField
import com.here.gluecodium.model.java.JavaInterface
import com.here.gluecodium.model.java.JavaMethod
import com.here.gluecodium.model.java.JavaMethod.MethodQualifier
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.java.JavaParameter
import com.here.gluecodium.model.java.JavaPrimitiveTypeRef
import com.here.gluecodium.model.java.JavaTopLevelElement
import com.here.gluecodium.model.java.JavaTypeRef
import com.here.gluecodium.model.java.JavaValue
import com.here.gluecodium.model.java.JavaVisibility
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.DEPRECATED
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType.BUILDER
import com.here.gluecodium.model.lime.LimeAttributeValueType.FUNCTION_NAME
import com.here.gluecodium.model.lime.LimeAttributeValueType.MESSAGE
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeVisibility
import java.util.EnumSet

class JavaModelBuilder(
    contextStack: ModelBuilderContextStack<JavaElement> = ModelBuilderContextStack(),
    private val rootPackage: JavaPackage,
    private val typeMapper: JavaTypeMapper,
    private val valueMapper: JavaValueMapper,
    private val nameRules: JavaNameRules,
    private val nameResolver: JavaNameResolver
) : AbstractLimeBasedModelBuilder<JavaElement>(contextStack) {
    private val nativeBase: JavaTypeRef = typeMapper.nativeBase

    override fun finishBuilding(limeContainer: LimeContainerWithInheritance) {
        when (limeContainer) {
            is LimeInterface -> finishBuildingInterface(limeContainer)
            is LimeClass -> finishBuildingClass(limeContainer)
        }

        closeContext()
    }

    override fun finishBuilding(limeTypes: LimeTypesCollection) {
        getPreviousResults(JavaTopLevelElement::class.java).forEach { this.storeResult(it) }

        val constants = getPreviousResults(JavaConstant::class.java)
        if (constants.isNotEmpty()) {
            val javaClass = JavaClass(nameRules.getName(limeTypes))
            javaClass.visibility = getVisibility(limeTypes)
            javaClass.qualifiers.add(JavaTopLevelElement.Qualifier.FINAL)
            javaClass.javaPackage = rootPackage
            javaClass.comment = createComments(limeTypes)
            addDeprecatedAnnotationIfNeeded(javaClass)
            javaClass.constants.addAll(constants)

            storeNamedResult(limeTypes, javaClass)
        }

        closeContext()
    }

    override fun finishBuilding(limeMethod: LimeFunction) {
        val returnType = when {
            limeMethod.isConstructor -> {
                val parentType = typeMapper.mapParentType(limeMethod) as JavaCustomTypeRef
                if (parentType.isInterface) JavaPrimitiveTypeRef.LONG else parentType
            }
            else -> {
                val cppType = typeMapper.mapType(limeMethod.returnType.typeRef)
                typeMapper.applyNullability(cppType, limeMethod.returnType.typeRef.isNullable)
            }
        }

        val javaExceptionType = limeMethod.thrownType?.let { typeMapper.mapExceptionType(it) }
        val qualifiers = when {
            limeMethod.isStatic -> setOf(MethodQualifier.STATIC)
            else -> emptySet()
        }
        val javaMethod = JavaMethod(
            name = nameRules.getName(limeMethod),
            comment = createComments(limeMethod),
            visibility = getVisibility(limeMethod),
            returnType = returnType,
            returnComment = limeMethod.returnType.comment.getFor(PLATFORM_TAG),
            exception = javaExceptionType,
            throwsComment = limeMethod.thrownType?.comment?.getFor(PLATFORM_TAG),
            parameters = getPreviousResults(JavaParameter::class.java),
            isConstructor = limeMethod.isConstructor,
            qualifiers = qualifiers
        )
        addDeprecatedAnnotationIfNeeded(javaMethod)

        storeNamedResult(limeMethod, javaMethod)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        val javaType = typeMapper.applyNullability(
            getPreviousResult(JavaTypeRef::class.java),
            limeParameter.typeRef.isNullable
        )
        val javaParameter =
            JavaParameter(nameRules.getName(limeParameter), javaType)
        javaParameter.comment = createComments(limeParameter)

        storeNamedResult(limeParameter, javaParameter)
        closeContext()
    }

    override fun finishBuilding(limeConstant: LimeConstant) {
        val javaConstant = JavaConstant(
            nameRules.getName(limeConstant),
            getPreviousResult(JavaTypeRef::class.java),
            getPreviousResult(JavaValue::class.java)
        )
        javaConstant.visibility = getVisibility(limeConstant)
        javaConstant.comment = createComments(limeConstant)
        addDeprecatedAnnotationIfNeeded(javaConstant)

        storeNamedResult(limeConstant, javaConstant)
        closeContext()
    }

    override fun finishBuilding(limeStruct: LimeStruct) {
        val methods = getPreviousResults(JavaMethod::class.java).map { it.shallowCopy() }
        methods.forEach { it.qualifiers.add(MethodQualifier.NATIVE) }

        val serializationBase = typeMapper.serializationBase
        val isSerializable =
            serializationBase != null && limeStruct.attributes.have(LimeAttributeType.SERIALIZABLE)

        val javaClass = JavaClass(
            name = nameRules.getName(limeStruct),
            classNames = nameResolver.getClassNames(limeStruct),
            fields = getPreviousResults(JavaField::class.java),
            methods = methods,
            constants = getPreviousResults(JavaConstant::class.java),
            isParcelable = isSerializable,
            isEquatable = limeStruct.attributes.have(LimeAttributeType.EQUATABLE),
            isImmutable = limeStruct.attributes.have(LimeAttributeType.IMMUTABLE),
            needsBuilder = limeStruct.attributes.have(JAVA, BUILDER),
            generatedConstructorComment = limeStruct.constructorComment.getFor(PLATFORM_TAG)
        )
        javaClass.visibility = getVisibility(limeStruct)
        javaClass.qualifiers.add(JavaTopLevelElement.Qualifier.FINAL)
        javaClass.javaPackage = rootPackage
        javaClass.comment = createComments(limeStruct)
        addDeprecatedAnnotationIfNeeded(javaClass)

        if (isSerializable) {
            serializationBase?.let { javaClass.parentInterfaces.add(it) }
        }

        storeNamedResult(limeStruct, javaClass)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val fieldName = nameRules.getName(limeField)
        val javaType = typeMapper.applyNullability(
            getPreviousResult(JavaTypeRef::class.java),
            limeField.typeRef.isNullable
        )

        val defaultValue = limeField.defaultValue
        val initialValue = when {
            defaultValue != null -> valueMapper.mapValue(defaultValue, javaType)
            limeField.typeRef.isNullable -> JavaValueMapper.mapNullValue(javaType)
            else -> JavaValueMapper.mapDefaultValue(javaType)
        }

        val javaField = JavaField(fieldName, javaType, initialValue)
        javaField.visibility = getVisibility(limeField)
        javaField.comment = createComments(limeField)
        addDeprecatedAnnotationIfNeeded(javaField)

        storeNamedResult(limeField, javaField)
        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val javaEnum = JavaEnum(
            name = nameRules.getName(limeEnumeration),
            classNames = nameResolver.getClassNames(limeEnumeration),
            items = getPreviousResults(JavaEnumItem::class.java)
        )
        javaEnum.visibility = getVisibility(limeEnumeration)
        javaEnum.javaPackage = rootPackage
        javaEnum.comment = createComments(limeEnumeration)
        addDeprecatedAnnotationIfNeeded(javaEnum)

        storeNamedResult(limeEnumeration, javaEnum)
        closeContext()
    }

    override fun finishBuilding(limeException: LimeException) {
        val javaException = JavaExceptionClass(
            nameRules.getName(limeException),
            typeMapper.mapType(limeException.errorType)
        )
        javaException.visibility = getVisibility(limeException)
        javaException.qualifiers.add(JavaTopLevelElement.Qualifier.FINAL)
        javaException.comment = createComments(limeException)
        javaException.javaPackage = rootPackage

        storeNamedResult(limeException, javaException)
        closeContext()
    }

    override fun finishBuilding(limeEnumerator: LimeEnumerator) {
        val javaValue = getPreviousResultOrNull(JavaValue::class.java)
            ?: JavaValueMapper.inferNextEnumValue(
                parentContext!!.previousResults
                    .filterIsInstance<JavaEnumItem>()
                    .lastOrNull()?.value
            )
        val javaEnumItem = JavaEnumItem(
            nameRules.getName(limeEnumerator),
            javaValue
        )
        javaEnumItem.comment = createComments(limeEnumerator)
        addDeprecatedAnnotationIfNeeded(javaEnumItem)

        storeNamedResult(limeEnumerator, javaEnumItem)
        closeContext()
    }

    override fun finishBuilding(limeProperty: LimeProperty) {
        val javaType = typeMapper.applyNullability(
            getPreviousResult(JavaTypeRef::class.java),
            limeProperty.typeRef.isNullable
        )
        val qualifiers = when {
            limeProperty.isStatic -> EnumSet.of(MethodQualifier.STATIC)
            else -> EnumSet.noneOf(MethodQualifier::class.java)
        }
        val propertyComment = limeProperty.comment.getFor(PLATFORM_TAG)

        val getterComments = Comments(
            limeProperty.getter.comment.getFor(PLATFORM_TAG),
            limeProperty.getter.attributes.get(DEPRECATED, MESSAGE)
        )
        val getterMethod = JavaMethod(
            name = nameRules.getGetterName(limeProperty),
            comment = getterComments,
            visibility = getVisibility(limeProperty.getter),
            returnType = javaType,
            returnComment = propertyComment,
            qualifiers = qualifiers,
            isGetter = true
        )
        addDeprecatedAnnotationIfNeeded(getterMethod)

        storeNamedResult(limeProperty, getterMethod)
        val getterKey = "${limeProperty.fullName}.get"
        referenceMap[getterKey] = getterMethod
        reverseReferenceMap[getterMethod] = getterKey

        val limeSetter = limeProperty.setter
        if (limeSetter != null) {
            val setterParameter = JavaParameter("value", javaType)
            setterParameter.comment = Comments(propertyComment)
            val setterComments = Comments(
                limeSetter.comment.getFor(PLATFORM_TAG),
                limeSetter.attributes.get(DEPRECATED, MESSAGE)
            )
            val setterMethod = JavaMethod(
                name = nameRules.getSetterName(limeProperty),
                comment = setterComments,
                visibility = getVisibility(limeSetter),
                returnType = JavaPrimitiveTypeRef.VOID,
                parameters = listOf(setterParameter),
                qualifiers = qualifiers
            )
            addDeprecatedAnnotationIfNeeded(setterMethod)

            storeResult(setterMethod)
            val setterKey = "${limeProperty.fullName}.set"
            referenceMap[setterKey] = setterMethod
            reverseReferenceMap[setterMethod] = setterKey
        }

        closeContext()
    }

    override fun finishBuilding(limeLambda: LimeLambda) {
        val javaInterface = JavaInterface(
            name = nameRules.getName(limeLambda),
            classNames = nameResolver.getClassNames(limeLambda)
        )
        javaInterface.visibility = getVisibility(limeLambda)
        javaInterface.javaPackage = rootPackage
        javaInterface.comment = createComments(limeLambda)
        javaInterface.annotations += functionalInterfaceAnnotation

        val parameters = limeLambda.parameters.mapIndexed { index, parameter ->
            val result = JavaParameter(
                nameRules.getName(parameter, index),
                typeMapper.applyNullability(
                    typeMapper.mapType(parameter.typeRef),
                    parameter.typeRef.isNullable
                )
            )
            result.comment = createComments(parameter)
            result
        }
        val methodName = limeLambda.attributes.get(JAVA, FUNCTION_NAME)?.let {
            nameRules.ruleSet.getMethodName(it)
        } ?: "apply"
        val applyMethod = JavaMethod(
            name = methodName,
            comment = createComments(limeLambda),
            parameters = parameters,
            returnComment = limeLambda.returnType.comment.getFor(PLATFORM_TAG),
            returnType = typeMapper.applyNullability(
                typeMapper.mapType(limeLambda.returnType.typeRef),
                limeLambda.returnType.typeRef.isNullable
            )
        )
        javaInterface.methods += applyMethod

        val implClassName = nameRules.getImplementationClassName(limeLambda)
        val implClass = JavaClass(
            name = implClassName,
            classNames = javaInterface.classNames.dropLast(1) + implClassName,
            isImplClass = true,
            extendedClass = nativeBase,
            needsDisposer = true,
            methods =
                listOf(applyMethod.shallowCopy().also { it.qualifiers.add(MethodQualifier.NATIVE) })
        )
        implClass.visibility = JavaVisibility.PACKAGE
        implClass.javaPackage = rootPackage
        implClass.parentInterfaces += JavaCustomTypeRef(javaInterface.name, javaInterface.javaPackage)
        implClass.comment = Comments("@exclude")

        storeNamedResult(limeLambda, javaInterface)
        storeResult(implClass)
        closeContext()
    }

    override fun finishBuilding(limeValue: LimeValue) {
        storeResult(valueMapper.mapValue(limeValue, getPreviousResult(JavaTypeRef::class.java)))
        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        storeResult(typeMapper.mapType(limeTypeRef))
        closeContext()
    }

    private fun createJavaInterface(limeInterface: LimeInterface): JavaInterface {

        val javaInterface = JavaInterface(
            name = nameRules.getName(limeInterface),
            classNames = nameResolver.getClassNames(limeInterface)
        )
        javaInterface.visibility = getVisibility(limeInterface)
        javaInterface.javaPackage = rootPackage

        javaInterface.comment = createComments(limeInterface)
        addDeprecatedAnnotationIfNeeded(javaInterface)
        javaInterface.methods.addAll(getPreviousResults(JavaMethod::class.java))

        addMembers(javaInterface)

        return javaInterface
    }

    private fun createJavaImplementationClass(
        limeContainer: LimeContainerWithInheritance,
        javaInterface: JavaInterface,
        extendedClass: JavaTypeRef
    ): JavaClass {

        val classMethods = getPreviousResults(JavaMethod::class.java).map { it.shallowCopy() }
        classMethods.forEach {
            it.qualifiers.add(MethodQualifier.NATIVE)
            it.visibility = JavaVisibility.PUBLIC
        }

        val implClassName = nameRules.getImplementationClassName(limeContainer)
        val javaClass = JavaClass(
            name = implClassName,
            classNames = nameResolver.getClassNames(limeContainer).dropLast(1) + implClassName,
            extendedClass = extendedClass,
            methods = classMethods,
            isImplClass = true,
            needsDisposer = nativeBase == extendedClass
        )
        javaClass.visibility = JavaVisibility.PACKAGE
        javaClass.javaPackage = rootPackage

        val interfaceTypeReference = JavaCustomTypeRef(javaInterface.name, javaInterface.javaPackage)
        javaClass.parentInterfaces.add(interfaceTypeReference)

        return javaClass
    }

    private fun finishBuildingClass(limeClass: LimeClass) {
        var extendedClass = nativeBase
        val parentContainer = limeClass.parent?.type as? LimeContainerWithInheritance
        parentContainer?.let {
            val parentClassName = when (it) {
                is LimeInterface -> nameRules.getImplementationClassName(it)
                else -> nameRules.getName(it)
            }
            extendedClass = typeMapper.mapInheritanceParent(it, parentClassName)
        }

        val javaClass = JavaClass(
            name = nameRules.getName(limeClass),
            classNames = nameResolver.getClassNames(limeClass),
            extendedClass = extendedClass,
            fields = getPreviousResults(JavaField::class.java),
            isImplClass = true,
            needsDisposer = parentContainer == null,
            hasNativeEquatable = limeClass.attributes.have(LimeAttributeType.EQUATABLE) ||
                    limeClass.attributes.have(LimeAttributeType.POINTER_EQUATABLE)
        )
        javaClass.visibility = getVisibility(limeClass)
        if (limeClass.visibility == LimeVisibility.PUBLIC) {
            javaClass.qualifiers.add(JavaTopLevelElement.Qualifier.FINAL)
        }
        javaClass.javaPackage = rootPackage
        javaClass.comment = createComments(limeClass)
        addDeprecatedAnnotationIfNeeded(javaClass)

        javaClass.methods.addAll(getPreviousResults(JavaMethod::class.java))
        javaClass.methods.forEach { it.qualifiers.add(MethodQualifier.NATIVE) }

        addMembers(javaClass)

        storeNamedResult(limeClass, javaClass)
    }

    private fun finishBuildingInterface(limeInterface: LimeInterface) {
        val javaInterface = createJavaInterface(limeInterface)

        var extendedClass = nativeBase
        val parentContainer = limeInterface.parent?.type as? LimeContainerWithInheritance
        if (parentContainer != null) {
            val javaParent =
                typeMapper.mapInheritanceParent(parentContainer, nameRules.getName(parentContainer))
            javaInterface.parentInterfaces.add(javaParent)
            extendedClass = typeMapper.mapInheritanceParent(
                parentContainer,
                nameRules.getImplementationClassName(parentContainer)
            )
        }

        val javaImplementationClass =
            createJavaImplementationClass(limeInterface, javaInterface, extendedClass)

        storeNamedResult(limeInterface, javaInterface)
        storeResult(javaImplementationClass)
    }

    private fun addMembers(javaTopLevelElement: JavaTopLevelElement) {
        val innerClasses = getPreviousResults(JavaClass::class.java)
        innerClasses.forEach { it.qualifiers.add(JavaTopLevelElement.Qualifier.STATIC) }
        javaTopLevelElement.innerClasses.addAll(innerClasses)
        javaTopLevelElement.innerInterfaces.addAll(getPreviousResults(JavaInterface::class.java))

        javaTopLevelElement.constants.addAll(getPreviousResults(JavaConstant::class.java))
        javaTopLevelElement.enums.addAll(getPreviousResults(JavaEnum::class.java))
        javaTopLevelElement.exceptions.addAll(getPreviousResults(JavaExceptionClass::class.java))
    }

    private fun getVisibility(limeElement: LimeNamedElement) =
        when {
            limeElement.visibility.isInternal -> JavaVisibility.PACKAGE
            else -> JavaVisibility.PUBLIC
        }

    private fun addDeprecatedAnnotationIfNeeded(javaElement: JavaElement) {
        if (javaElement.comment.deprecated != null) {
            javaElement.annotations.add(deprecatedAnnotation)
        }
    }

    private fun createComments(limeElement: LimeNamedElement) =
        createComments(limeElement, PLATFORM_TAG)

    private fun createComments(limeLambdaParameter: LimeLambdaParameter) =
        Comments(
            limeLambdaParameter.comment.getFor(PLATFORM_TAG),
            limeLambdaParameter.attributes?.get(DEPRECATED, MESSAGE)
        )

    companion object {
        const val PLATFORM_TAG = "Java"

        internal val deprecatedAnnotation = JavaCustomTypeRef("Deprecated")
        internal val functionalInterfaceAnnotation = JavaCustomTypeRef("FunctionalInterface")
    }
}
