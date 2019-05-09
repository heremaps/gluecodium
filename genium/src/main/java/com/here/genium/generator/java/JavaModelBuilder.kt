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

package com.here.genium.generator.java

import com.google.common.annotations.VisibleForTesting
import com.here.genium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.model.common.CommentsPreprocessor
import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaConstant
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaEnumItem
import com.here.genium.model.java.JavaEnumType
import com.here.genium.model.java.JavaExceptionClass
import com.here.genium.model.java.JavaField
import com.here.genium.model.java.JavaInterface
import com.here.genium.model.java.JavaMethod
import com.here.genium.model.java.JavaMethod.MethodQualifier
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.java.JavaParameter
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaTopLevelElement
import com.here.genium.model.java.JavaType
import com.here.genium.model.java.JavaValue
import com.here.genium.model.java.JavaVisibility
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeVisibility
import java.util.EnumSet

class JavaModelBuilder @VisibleForTesting
internal constructor(
    contextStack: ModelBuilderContextStack<JavaElement>,
    private val rootPackage: JavaPackage,
    private val typeMapper: JavaTypeMapper,
    private val valueMapper: JavaValueMapper,
    private val methodNameResolver: JavaMethodNameResolver,
    private val errorEnums: Set<String>
) : AbstractLimeBasedModelBuilder<JavaElement>(contextStack) {
    private val nativeBase: JavaType = typeMapper.nativeBase

    constructor(
        rootPackage: JavaPackage,
        typeMapper: JavaTypeMapper,
        valueMapper: JavaValueMapper,
        methodNameResolver: JavaMethodNameResolver,
        errorEnums: Set<String>
    ) : this(
        ModelBuilderContextStack<JavaElement>(),
        rootPackage,
        typeMapper,
        valueMapper,
        methodNameResolver,
        errorEnums
    )

    override fun finishBuilding(limeContainer: LimeContainer) {
        when (limeContainer.type) {
            ContainerType.TYPE_COLLECTION -> finishBuildingTypeCollection(limeContainer)
            ContainerType.INTERFACE -> finishBuildingInterface(limeContainer)
            ContainerType.CLASS -> finishBuildingClass(limeContainer)
        }

        closeContext()
    }

    override fun finishBuilding(limeMethod: LimeMethod) {
        val isConstructor = limeMethod.attributes.have(LimeAttributeType.CONSTRUCTOR)
        val returnType = when {
            isConstructor -> {
                val parentType = typeMapper.mapParentType(limeMethod) as JavaCustomType
                if (parentType.isInterface) JavaPrimitiveType.LONG else parentType
            }
            else -> {
                val cppType = typeMapper.mapType(limeMethod.returnType.typeRef)
                typeMapper.applyNullability(cppType, limeMethod.returnType.attributes)
            }
        }

        val qualifiers = when {
            isConstructor || limeMethod.isStatic -> setOf(MethodQualifier.STATIC)
            else -> emptySet()
        }
        val javaMethod = JavaMethod(
            methodNameResolver.getName(limeMethod),
            limeMethod.comment,
            getVisibility(limeMethod),
            returnType,
            limeMethod.returnType.comment,
            limeMethod.errorType?.type?.let { typeMapper.mapExceptionType(it) },
            getPreviousResults(JavaParameter::class.java),
            isConstructor,
            qualifiers
        )

        storeNamedResult(limeMethod, javaMethod)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        val javaType = typeMapper.applyNullability(
            getPreviousResult(JavaType::class.java),
            limeParameter.attributes
        )
        val javaParameter =
            JavaParameter(JavaNameRules.getArgumentName(limeParameter.name), javaType)
        javaParameter.comment = limeParameter.comment

        storeResult(javaParameter)
        closeContext()
    }

    override fun finishBuilding(limeConstant: LimeConstant) {
        val javaConstant = JavaConstant(
            JavaNameRules.getConstantName(limeConstant.name),
            getPreviousResult(JavaType::class.java),
            getPreviousResult(JavaValue::class.java)
        )
        javaConstant.visibility = getVisibility(limeConstant)
        javaConstant.comment = limeConstant.comment

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
            name = JavaNameRules.getClassName(limeStruct.name),
            fields = getPreviousResults(JavaField::class.java),
            methods = methods,
            isParcelable = isSerializable,
            isEquatable = limeStruct.attributes.have(LimeAttributeType.EQUATABLE),
            isImmutable = limeStruct.attributes.have(LimeAttributeType.IMMUTABLE)
        )
        javaClass.visibility = getVisibility(limeStruct)
        javaClass.javaPackage = rootPackage
        javaClass.comment = limeStruct.comment

        if (isSerializable) {
            javaClass.parentInterfaces.add(serializationBase)
        }

        storeNamedResult(limeStruct, javaClass)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val fieldName = JavaNameRules.getFieldName(limeField.name)
        val javaType = typeMapper.applyNullability(
            getPreviousResult(JavaType::class.java),
            limeField.attributes
        )

        val defaultValue = limeField.defaultValue
        val initialValue: JavaValue
        initialValue = when {
            defaultValue != null -> valueMapper.mapValue(defaultValue)
            limeField.attributes.have(LimeAttributeType.NULLABLE) ->
                JavaValueMapper.mapNullValue(javaType)
            else -> JavaValueMapper.mapDefaultValue(javaType)
        }

        val javaField = JavaField(fieldName, javaType, initialValue)
        javaField.visibility = getVisibility(limeField)
        javaField.comment = limeField.comment

        storeNamedResult(limeField, javaField)
        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val javaEnum = JavaEnum(JavaNameRules.getClassName(limeEnumeration.name))
        javaEnum.visibility = getVisibility(limeEnumeration)
        javaEnum.javaPackage = rootPackage
        javaEnum.comment = limeEnumeration.comment
        javaEnum.items.addAll(getPreviousResults(JavaEnumItem::class.java))
        storeNamedResult(limeEnumeration, javaEnum)

        if (errorEnums.contains(limeEnumeration.fullName)) {
            // Exception definition & reference
            val javaEnumType = typeMapper.mapCustomType(limeEnumeration) as JavaEnumType
            val javaException =
                JavaExceptionClass(JavaNameRules.getExceptionName(javaEnum.name), javaEnumType)
            javaException.visibility = getVisibility(limeEnumeration)

            storeResult(javaException)
        }

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
            JavaNameRules.getConstantName(limeEnumerator.name),
            javaValue
        )
        javaEnumItem.comment = limeEnumerator.comment

        storeNamedResult(limeEnumerator, javaEnumItem)
        closeContext()
    }

    override fun finishBuilding(limeProperty: LimeProperty) {
        val javaType = typeMapper.applyNullability(
            getPreviousResult(JavaType::class.java),
            limeProperty.attributes
        )
        val visibility = getVisibility(limeProperty)

        val qualifiers = if (limeProperty.isStatic)
            EnumSet.of(MethodQualifier.STATIC)
        else
            EnumSet.noneOf(MethodQualifier::class.java)

        val getterMethod = JavaMethod(
            name = JavaNameRules.getGetterName(limeProperty.name, javaType),
            comment = CommentsPreprocessor.preprocessGetterComment(limeProperty.comment),
            visibility = visibility,
            returnType = javaType,
            qualifiers = qualifiers
        )

        storeNamedResult(limeProperty, getterMethod)

        if (!limeProperty.isReadonly) {
            val setterVisibility =
                when {
                    limeProperty.attributes.have(LimeAttributeType.INTERNAL_SETTER) ->
                        JavaVisibility.PACKAGE
                    else -> visibility
                }
            val setterMethod = JavaMethod(
                name = JavaNameRules.getSetterName(limeProperty.name),
                comment = CommentsPreprocessor.preprocessSetterComment(limeProperty.comment),
                visibility = setterVisibility,
                returnType = JavaPrimitiveType.VOID,
                parameters = listOf(JavaParameter("value", javaType)),
                qualifiers = qualifiers
            )

            storeResult(setterMethod)
        }

        closeContext()
    }

    override fun finishBuilding(limeValue: LimeValue) {
        storeResult(valueMapper.mapValue(limeValue))
        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        storeResult(typeMapper.mapType(limeTypeRef))
        closeContext()
    }

    private fun createJavaInterface(limeContainer: LimeContainer): JavaInterface {

        val javaInterface = JavaInterface(JavaNameRules.getClassName(limeContainer.name))
        javaInterface.visibility = getVisibility(limeContainer)
        javaInterface.javaPackage = rootPackage

        javaInterface.comment = limeContainer.comment
        javaInterface.constants.addAll(getPreviousResults(JavaConstant::class.java))
        javaInterface.enums.addAll(getPreviousResults(JavaEnum::class.java))
        javaInterface.exceptions.addAll(getPreviousResults(JavaExceptionClass::class.java))
        javaInterface.methods.addAll(getPreviousResults(JavaMethod::class.java))

        addInnerClasses(javaInterface)

        return javaInterface
    }

    private fun createJavaImplementationClass(
        limeContainer: LimeContainer,
        javaInterface: JavaInterface,
        extendedClass: JavaType
    ): JavaClass {

        val classMethods = getPreviousResults(JavaMethod::class.java).map { it.shallowCopy() }
        classMethods.forEach { it.qualifiers.add(MethodQualifier.NATIVE) }

        val javaClass = JavaClass(
            name = JavaNameRules.getImplementationClassName(limeContainer.name),
            extendedClass = extendedClass,
            methods = classMethods,
            isImplClass = true,
            needsDisposer = nativeBase == extendedClass
        )
        javaClass.visibility = JavaVisibility.PACKAGE
        javaClass.javaPackage = rootPackage

        val interfaceTypeReference = JavaCustomType(javaInterface.name, javaInterface.javaPackage)
        javaClass.parentInterfaces.add(interfaceTypeReference)

        return javaClass
    }

    private fun finishBuildingTypeCollection(limeContainer: LimeContainer) {
        getPreviousResults(JavaTopLevelElement::class.java).forEach { this.storeResult(it) }

        val constants = getPreviousResults(JavaConstant::class.java)
        if (constants.isEmpty()) return

        val javaClass = JavaClass(JavaNameRules.getClassName(limeContainer.name))
        javaClass.visibility = getVisibility(limeContainer)
        javaClass.qualifiers.add(JavaTopLevelElement.Qualifier.FINAL)
        javaClass.javaPackage = rootPackage
        javaClass.comment = limeContainer.comment
        javaClass.constants.addAll(constants)

        storeNamedResult(limeContainer, javaClass)
    }

    private fun finishBuildingClass(limeContainer: LimeContainer) {
        var extendedClass = nativeBase
        val parentContainer = limeContainer.parent?.type as? LimeContainer
        if (parentContainer != null) {
            val parentClassName = when {
                parentContainer.type == ContainerType.INTERFACE ->
                    JavaNameRules.getImplementationClassName(parentContainer.name)
                else -> JavaNameRules.getClassName(parentContainer.name)
            }
            extendedClass = typeMapper.mapCustomType(parentContainer, parentClassName)
        }

        val javaClass = JavaClass(
            name = JavaNameRules.getClassName(limeContainer.name),
            extendedClass = extendedClass,
            fields = getPreviousResults(JavaField::class.java),
            isImplClass = true,
            needsDisposer = parentContainer == null
        )
        javaClass.visibility = getVisibility(limeContainer)
        javaClass.javaPackage = rootPackage
        javaClass.comment = limeContainer.comment

        javaClass.constants.addAll(getPreviousResults(JavaConstant::class.java))
        javaClass.methods.addAll(getPreviousResults(JavaMethod::class.java))
        javaClass.methods.forEach { it.qualifiers.add(MethodQualifier.NATIVE) }
        javaClass.enums.addAll(getPreviousResults(JavaEnum::class.java))
        javaClass.exceptions.addAll(getPreviousResults(JavaExceptionClass::class.java))

        addInnerClasses(javaClass)

        storeNamedResult(limeContainer, javaClass)
    }

    private fun finishBuildingInterface(limeContainer: LimeContainer) {
        val javaInterface = createJavaInterface(limeContainer)

        var extendedClass = nativeBase
        val parentContainer = limeContainer.parent?.type as? LimeContainer
        if (parentContainer != null) {
            javaInterface.parentInterfaces.add(typeMapper.mapCustomType(parentContainer))
            extendedClass = typeMapper.mapCustomType(
                parentContainer,
                JavaNameRules.getImplementationClassName(parentContainer.name)
            )
        }

        val javaImplementationClass =
            createJavaImplementationClass(limeContainer, javaInterface, extendedClass)

        storeNamedResult(limeContainer, javaInterface)
        storeResult(javaImplementationClass)
    }

    private fun addInnerClasses(javaTopLevelElement: JavaTopLevelElement) {
        val innerClasses = getPreviousResults(JavaClass::class.java)
            .filterNot { it.isImplClass }
        innerClasses.forEach { it.qualifiers.add(JavaTopLevelElement.Qualifier.STATIC) }
        javaTopLevelElement.innerClasses.addAll(innerClasses)
    }

    private fun getVisibility(limeElement: LimeNamedElement) =
        when {
            limeElement.visibility == LimeVisibility.INTERNAL -> JavaVisibility.PACKAGE
            else -> JavaVisibility.PUBLIC
        }
}
