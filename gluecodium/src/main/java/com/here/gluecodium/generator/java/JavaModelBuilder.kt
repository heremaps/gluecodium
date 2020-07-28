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
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
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

class JavaModelBuilder(
    contextStack: ModelBuilderContextStack<JavaElement> = ModelBuilderContextStack(),
    private val rootPackage: JavaPackage,
    private val typeMapper: JavaTypeMapper,
    private val valueMapper: JavaValueMapper,
    private val nameRules: JavaNameRules,
    private val nameResolver: JavaNameResolver,
    private val buildTransientModel: (LimeNamedElement) -> List<JavaElement>
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
            val javaClass = JavaClass(nameRules.getName(limeTypes), isFinal = true)
            javaClass.visibility = getVisibility(limeTypes)
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
            isStatic = limeMethod.isStatic
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
        methods.forEach { it.isNative = true }

        val serializationBase = typeMapper.serializationBase
        val isSerializable =
            serializationBase != null && limeStruct.attributes.have(LimeAttributeType.SERIALIZABLE)

        val externalImport = limeStruct.external?.java?.get(NAME_NAME)
        val hasConverter = limeStruct.external?.java?.get(CONVERTER_NAME) != null
        val skipDeclaration = externalImport != null && !hasConverter
        val javaPackage = when {
            skipDeclaration -> JavaPackage(JavaNameRules.getPackageFromImportString(externalImport!!))
            else -> rootPackage
        }
        val classNames = when {
            skipDeclaration -> JavaNameRules.getClassNamesFromImportString(externalImport!!)
            else -> nameResolver.getClassNames(limeStruct)
        }

        val javaClass = JavaClass(
            name = classNames.last(),
            classNames = classNames,
            isFinal = true,
            fields = getPreviousResults(JavaField::class.java),
            methods = methods,
            constants = getPreviousResults(JavaConstant::class.java),
            isParcelable = isSerializable,
            isEquatable = limeStruct.attributes.have(LimeAttributeType.EQUATABLE),
            isImmutable = limeStruct.attributes.have(LimeAttributeType.IMMUTABLE),
            needsBuilder = limeStruct.attributes.have(JAVA, BUILDER),
            generatedConstructorComment = limeStruct.constructorComment.getFor(PLATFORM_TAG),
            skipDeclaration = skipDeclaration
        )
        javaClass.visibility = getVisibility(limeStruct)
        javaClass.javaPackage = javaPackage
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
        val externalImport = limeEnumeration.external?.java?.get(NAME_NAME)
        val hasConverter = limeEnumeration.external?.java?.get(CONVERTER_NAME) != null
        val skipDeclaration = externalImport != null && !hasConverter
        val javaPackage = when {
            skipDeclaration -> JavaPackage(JavaNameRules.getPackageFromImportString(externalImport!!))
            else -> rootPackage
        }
        val classNames = when {
            skipDeclaration -> JavaNameRules.getClassNamesFromImportString(externalImport!!)
            else -> nameResolver.getClassNames(limeEnumeration)
        }

        val javaEnum = JavaEnum(
            name = classNames.last(),
            classNames = classNames,
            items = getPreviousResults(JavaEnumItem::class.java),
            skipDeclaration = skipDeclaration
        )
        javaEnum.visibility = getVisibility(limeEnumeration)
        javaEnum.javaPackage = javaPackage
        javaEnum.comment = createComments(limeEnumeration)
        addDeprecatedAnnotationIfNeeded(javaEnum)

        storeNamedResult(limeEnumeration, javaEnum)
        closeContext()
    }

    override fun finishBuilding(limeException: LimeException) {
        val javaException = JavaExceptionClass(
            exceptionName = nameRules.getName(limeException),
            isFinal = true,
            errorTypeRef = typeMapper.mapType(limeException.errorType)
        )
        javaException.visibility = getVisibility(limeException)
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
        val propertyComment = limeProperty.comment.getFor(PLATFORM_TAG)

        val getterComments = createComments(limeProperty.getter, PLATFORM_TAG)
        val getterMethod = JavaMethod(
            name = nameRules.getGetterName(limeProperty),
            comment = getterComments,
            visibility = getVisibility(limeProperty.getter),
            returnType = javaType,
            returnComment = propertyComment,
            isStatic = limeProperty.isStatic,
            isGetter = true,
            isCached = limeProperty.attributes.have(LimeAttributeType.CACHED)
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
            val setterComments = createComments(limeSetter, PLATFORM_TAG)
            val setterMethod = JavaMethod(
                name = nameRules.getSetterName(limeProperty),
                comment = setterComments,
                visibility = getVisibility(limeSetter),
                returnType = JavaPrimitiveTypeRef.VOID,
                parameters = listOf(setterParameter),
                isStatic = limeProperty.isStatic
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
            methods = listOf(applyMethod.shallowCopy().also { it.isNative = true })
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
        val parentMethods = (limeInterface.parent?.type as? LimeInterface)?.let {
            (buildTransientModel(it).first() as JavaInterface).run { methods + parentMethods }
        } ?: emptySet()

        val javaInterface = JavaInterface(
            name = nameRules.getName(limeInterface),
            classNames = nameResolver.getClassNames(limeInterface),
            parentMethods = parentMethods
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
        limeInterface: LimeInterface,
        javaInterface: JavaInterface,
        extendedClass: JavaTypeRef
    ): JavaClass {

        val classMethods = getPreviousResults(JavaMethod::class.java).map { it.shallowCopy() }
        classMethods.forEach {
            it.isNative = true
            it.visibility = JavaVisibility.PUBLIC
        }

        val implClassName = nameRules.getImplementationClassName(limeInterface)
        val javaClass = JavaClass(
            name = implClassName,
            classNames = nameResolver.getClassNames(limeInterface).dropLast(1) + implClassName,
            extendedClass = extendedClass,
            methods = classMethods,
            isImplClass = true,
            needsDisposer = nativeBase == extendedClass,
            hasNativeEquatable = limeInterface.attributes.have(LimeAttributeType.EQUATABLE)
        )
        javaClass.visibility = JavaVisibility.PACKAGE
        javaClass.javaPackage = rootPackage

        val interfaceTypeReference = JavaCustomTypeRef(javaInterface.name, javaInterface.javaPackage)
        javaClass.parentInterfaces.add(interfaceTypeReference)

        return javaClass
    }

    private fun finishBuildingClass(limeClass: LimeClass) {
        val parentContainer = limeClass.parent?.type as? LimeContainerWithInheritance
        val javaParent =
            parentContainer?.let { typeMapper.mapInheritanceParent(it, nameRules.getName(it)) }

        val javaClass = JavaClass(
            name = nameRules.getName(limeClass),
            classNames = nameResolver.getClassNames(limeClass),
            isFinal = limeClass.visibility == LimeVisibility.PUBLIC,
            extendedClass = if (parentContainer is LimeClass) javaParent else nativeBase,
            fields = getPreviousResults(JavaField::class.java),
            isImplClass = true,
            needsDisposer = parentContainer !is LimeClass,
            hasNativeEquatable = limeClass.attributes.have(LimeAttributeType.EQUATABLE) ||
                    limeClass.attributes.have(LimeAttributeType.POINTER_EQUATABLE)
        )
        javaClass.visibility = getVisibility(limeClass)
        javaClass.javaPackage = rootPackage
        javaClass.comment = createComments(limeClass)
        addDeprecatedAnnotationIfNeeded(javaClass)

        javaClass.methods += getPreviousResults(JavaMethod::class.java)
        if (parentContainer is LimeInterface) {
            javaClass.parentInterfaces += javaParent!!
            val transientParent = buildTransientModel(parentContainer).first() as JavaInterface
            val parentMethods = transientParent.methods + transientParent.parentMethods
            parentMethods.forEach { it.annotations.add(overrideAnnotation) }
            javaClass.methods += parentMethods
        }
        javaClass.methods.forEach { it.isNative = true }

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
        innerClasses.forEach { it.isStatic = true }
        javaTopLevelElement.innerClasses.addAll(innerClasses)
        javaTopLevelElement.innerInterfaces.addAll(getPreviousResults(JavaInterface::class.java))

        javaTopLevelElement.constants.addAll(getPreviousResults(JavaConstant::class.java))
        javaTopLevelElement.enums.addAll(getPreviousResults(JavaEnum::class.java))
        javaTopLevelElement.exceptions.addAll(getPreviousResults(JavaExceptionClass::class.java))
    }

    private fun getVisibility(limeElement: LimeNamedElement) =
        when {
            limeElement.visibility.isInternal -> JavaVisibility.PACKAGE
            limeElement.external?.java?.get(CONVERTER_NAME) != null -> JavaVisibility.PACKAGE
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
            limeLambdaParameter.attributes.get(DEPRECATED, MESSAGE, LimeComment::class.java)?.getFor(PLATFORM_TAG)
        )

    companion object {
        const val PLATFORM_TAG = "Java"

        internal val deprecatedAnnotation = JavaCustomTypeRef("Deprecated")
        internal val functionalInterfaceAnnotation = JavaCustomTypeRef("FunctionalInterface")
        private val overrideAnnotation = JavaCustomTypeRef("Override")
    }
}
