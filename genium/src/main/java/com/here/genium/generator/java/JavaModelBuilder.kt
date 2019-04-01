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
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack
import com.here.genium.model.common.CommentsPreprocessor
import com.here.genium.model.franca.CommentHelper
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaConstant
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaEnumItem
import com.here.genium.model.java.JavaEnumType
import com.here.genium.model.java.JavaExceptionClass
import com.here.genium.model.java.JavaExceptionType
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
import org.franca.core.franca.FTypeRef
import java.util.EnumSet

open class JavaModelBuilder @VisibleForTesting
internal constructor(
    contextStack: ModelBuilderContextStack<JavaElement>,
    private val methodNameResolver: JavaMethodNameResolver,
    private val deploymentModel: FrancaDeploymentModel,
    private val rootPackage: JavaPackage,
    private val typeMapper: JavaTypeMapper,
    private val errorEnums: FrancaTypeHelper.ErrorEnumFilter
) : AbstractModelBuilder<JavaElement>(contextStack) {
    private val nativeBase: JavaType

    init {
        this.nativeBase = typeMapper.nativeBase
    }

    constructor(
        deploymentModel: FrancaDeploymentModel,
        rootPackage: JavaPackage,
        typeMapper: JavaTypeMapper,
        errorEnums: FrancaTypeHelper.ErrorEnumFilter
    ) : this(
        ModelBuilderContextStack<JavaElement>(),
        JavaMethodNameResolver(),
        deploymentModel,
        rootPackage,
        typeMapper,
        errorEnums
    )

    override fun finishBuilding(francaInterface: FInterface) {
        when {
            deploymentModel.isInterface(francaInterface) ->
                finishBuildingFrancaInterface(francaInterface)
            else -> finishBuildingFrancaClass(francaInterface)
        }

        closeContext()
    }

    override fun finishBuilding(francaTypeCollection: FTypeCollection) {
        getPreviousResults(JavaTopLevelElement::class.java).forEach { this.storeResult(it) }

        val constants = getPreviousResults(JavaConstant::class.java)
        if (!constants.isEmpty()) {
            val name = JavaNameRules.getClassName(francaTypeCollection.name)
            val javaClass = JavaClass(name)
            javaClass.visibility = getVisibility(francaTypeCollection)
            javaClass.qualifiers.add(JavaTopLevelElement.Qualifier.FINAL)
            javaClass.javaPackage = rootPackage
            javaClass.comment = CommentHelper.getDescription(francaTypeCollection)
            javaClass.constants.addAll(constants)

            storeResult(javaClass)
        }

        closeContext()
    }

    override fun finishBuilding(francaMethod: FMethod) {
        // Map return type
        val outputParameter = currentContext.previousResults
            .filterIsInstance<JavaParameter>()
            .firstOrNull { it.isOutput }

        val returnType: JavaType
        val returnComment: String?
        val annotations: Set<JavaType>
        if (outputParameter == null) { // Void return type
            returnType = JavaPrimitiveType.VOID
            returnComment = null
            annotations = emptySet()
        } else {
            returnType = outputParameter.type
            returnComment = outputParameter.comment
            annotations = outputParameter.annotations
        }

        val inputParameters = currentContext.previousResults
            .filterIsInstance<JavaParameter>()
            .filterNot { it.isOutput }

        val isConstructor = deploymentModel.isConstructor(francaMethod)
        val qualifiers = if (isConstructor || deploymentModel.isStatic(francaMethod))
            setOf(MethodQualifier.STATIC)
        else
            emptySet()
        val javaMethod = JavaMethod(
            methodNameResolver.getName(francaMethod),
            CommentHelper.getDescription(francaMethod),
            getVisibility(francaMethod),
            if (isConstructor) JavaPrimitiveType.LONG else returnType,
            returnComment,
            getPreviousResult(JavaExceptionType::class.java),
            inputParameters,
            isConstructor,
            qualifiers,
            annotations
        )

        storeResult(javaMethod)
        closeContext()
    }

    override fun finishBuildingInputArgument(francaArgument: FArgument) {
        finishBuildingFrancaArgument(francaArgument, false)
    }

    override fun finishBuildingOutputArgument(francaArgument: FArgument) {
        finishBuildingFrancaArgument(francaArgument, true)
    }

    private fun finishBuildingFrancaArgument(francaArgument: FArgument, isOutput: Boolean) {
        val javaType = getPreviousResult(JavaType::class.java)

        val javaParameter = JavaParameter(
            JavaNameRules.getArgumentName(francaArgument.name), javaType, isOutput
        )
        javaParameter.comment = CommentHelper.getDescription(francaArgument)

        storeResult(javaParameter)
        closeContext()
    }

    override fun finishBuilding(francaConstant: FConstantDef) {
        val javaType = getPreviousResult(JavaType::class.java)
        val name = JavaNameRules.getConstantName(francaConstant.name)
        val value = getPreviousResult(JavaValue::class.java)

        val javaConstant = JavaConstant(name, javaType, value)
        javaConstant.visibility = getVisibility(francaConstant)
        javaConstant.comment = CommentHelper.getDescription(francaConstant)

        storeResult(javaConstant)
        closeContext()
    }

    override fun finishBuilding(francaField: FField) {
        val fieldName = JavaNameRules.getFieldName(francaField.name)
        val javaType = getPreviousResult(JavaType::class.java)

        val defaultValue = deploymentModel.getDefaultValue(francaField)
        val initialValue = when {
            defaultValue != null -> JavaValueMapper.mapDefaultValue(javaType, defaultValue)
            deploymentModel.isNullable(francaField) -> JavaValueMapper.mapNullValue(javaType)
            else -> JavaValueMapper.mapDefaultValue(javaType)
        }

        val javaField = JavaField(fieldName, javaType, initialValue)
        javaField.visibility = getVisibility(francaField)
        javaField.comment = CommentHelper.getDescription(francaField)

        storeResult(javaField)
        closeContext()
    }

    override fun finishBuilding(francaStructType: FStructType) {
        val serializationBase = typeMapper.serializationBase
        val isSerializable =
            serializationBase != null && deploymentModel.isSerializable(francaStructType)

        val javaClass = JavaClass(
            JavaNameRules.getClassName(francaStructType.name), null,
            getPreviousResults(JavaField::class.java),
            false,
            false,
            isSerializable,
            deploymentModel.isEquatable(francaStructType),
            deploymentModel.isImmutable(francaStructType)
        )
        javaClass.visibility = getVisibility(francaStructType)
        javaClass.javaPackage = rootPackage
        javaClass.comment = CommentHelper.getDescription(francaStructType)

        if (isSerializable) {
            javaClass.parentInterfaces.add(serializationBase)
        }

        storeResult(javaClass)
        closeContext()
    }

    override fun finishBuilding(francaTypeRef: FTypeRef) {
        storeResult(typeMapper.map(francaTypeRef))
        closeContext()
    }

    override fun finishBuilding(francaEnumType: FEnumerationType) {
        // Type definition
        val javaEnum = JavaEnum(JavaNameRules.getClassName(francaEnumType.name))
        javaEnum.visibility = getVisibility(francaEnumType)
        javaEnum.javaPackage = rootPackage

        javaEnum.comment = CommentHelper.getDescription(francaEnumType)
        javaEnum.items.addAll(getPreviousResults(JavaEnumItem::class.java))
        JavaValueMapper.completePartialEnumeratorValues(javaEnum.items)
        storeResult(javaEnum)

        // Type reference
        val javaEnumType = typeMapper.mapCustomType(francaEnumType) as JavaEnumType
        storeResult(javaEnumType)

        if (errorEnums.isErrorEnum(francaEnumType)) {
            // Exception definition & reference
            val javaException =
                JavaExceptionClass(JavaNameRules.getExceptionName(javaEnum.name), javaEnumType)
            javaException.visibility = getVisibility(francaEnumType)

            storeResult(javaException)
            storeResult(typeMapper.mapExceptionType(francaEnumType))
        }
        closeContext()
    }

    override fun finishBuilding(francaExpression: FInitializerExpression) {
        storeResult(JavaValueMapper.map(francaExpression))
        closeContext()
    }

    override fun finishBuilding(francaEnumerator: FEnumerator) {
        val enumItemName = JavaNameRules.getConstantName(francaEnumerator.name)
        val javaValue = getPreviousResult(JavaValue::class.java)
        val javaEnumItem = JavaEnumItem(enumItemName, javaValue)

        javaEnumItem.comment = CommentHelper.getDescription(francaEnumerator)

        storeResult(javaEnumItem)
        closeContext()
    }

    override fun finishBuilding(francaArrayType: FArrayType) {
        storeResult(typeMapper.mapArray(francaArrayType))
        closeContext()
    }

    override fun finishBuilding(francaMapType: FMapType) {
        storeResult(typeMapper.mapMap(francaMapType))
        closeContext()
    }

    override fun finishBuilding(francaAttribute: FAttribute) {
        val javaType = getPreviousResult(JavaType::class.java)
        val comment = CommentHelper.getDescription(francaAttribute)
        val visibility = getVisibility(francaAttribute)

        val qualifiers = if (deploymentModel.isStatic(francaAttribute))
            EnumSet.of(MethodQualifier.STATIC)
        else
            EnumSet.noneOf(MethodQualifier::class.java)

        val getterMethod = JavaMethod(
            JavaNameRules.getGetterName(francaAttribute.name, javaType),
            CommentsPreprocessor.preprocessGetterComment(comment),
            visibility,
            javaType, null, null,
            emptyList(),
            false,
            qualifiers
        )

        storeResult(getterMethod)

        if (!francaAttribute.isReadonly) {
            val setterParameter = JavaParameter("value", javaType)
            val setterVisibility = if (deploymentModel.hasInternalSetter(francaAttribute))
                JavaVisibility.PACKAGE
            else
                visibility
            val setterMethod = JavaMethod(
                JavaNameRules.getSetterName(francaAttribute.name),
                CommentsPreprocessor.preprocessSetterComment(comment),
                setterVisibility,
                JavaPrimitiveType.VOID, null, null,
                listOf(setterParameter),
                false,
                qualifiers
            )

            storeResult(setterMethod)
        }

        closeContext()
    }

    private fun createJavaClass(
        francaInterface: FInterface,
        methods: List<JavaMethod>,
        extendedClass: JavaType
    ): JavaClass {

        val javaClass = JavaClass(
            JavaNameRules.getClassName(francaInterface.name),
            extendedClass,
            getPreviousResults(JavaField::class.java),
            true,
            nativeBase == extendedClass
        )
        javaClass.visibility = getVisibility(francaInterface)
        javaClass.javaPackage = rootPackage

        javaClass.comment = CommentHelper.getDescription(francaInterface)
        javaClass.constants.addAll(getPreviousResults(JavaConstant::class.java))
        javaClass.methods.addAll(methods)
        javaClass.methods.forEach { it.qualifiers.add(MethodQualifier.NATIVE) }
        javaClass.enums.addAll(getPreviousResults(JavaEnum::class.java))
        javaClass.exceptions.addAll(getPreviousResults(JavaExceptionClass::class.java))

        addInnerClasses(javaClass)

        return javaClass
    }

    private fun createJavaInterface(francaInterface: FInterface): JavaInterface {
        val javaInterface = JavaInterface(JavaNameRules.getClassName(francaInterface.name))
        javaInterface.visibility = getVisibility(francaInterface)
        javaInterface.javaPackage = rootPackage

        javaInterface.comment = CommentHelper.getDescription(francaInterface)
        javaInterface.constants.addAll(getPreviousResults(JavaConstant::class.java))
        javaInterface.enums.addAll(getPreviousResults(JavaEnum::class.java))
        javaInterface.exceptions.addAll(getPreviousResults(JavaExceptionClass::class.java))
        javaInterface.methods.addAll(getPreviousResults(JavaMethod::class.java))

        addInnerClasses(javaInterface)

        return javaInterface
    }

    private fun createJavaImplementationClass(
        francaInterface: FInterface,
        javaInterface: JavaInterface,
        extendedClass: JavaType
    ): JavaClass {

        val javaClass = JavaClass(
            JavaNameRules.getImplementationClassName(francaInterface.name),
            extendedClass,
            getPreviousResults(JavaField::class.java),
            true,
            nativeBase == extendedClass
        )
        javaClass.visibility = JavaVisibility.PACKAGE
        javaClass.javaPackage = rootPackage

        val classMethods = getPreviousResults(JavaMethod::class.java).map { it.shallowCopy() }
        classMethods.forEach { it.qualifiers.add(MethodQualifier.NATIVE) }
        javaClass.methods.addAll(classMethods)

        val interfaceTypeReference = JavaCustomType(javaInterface.name, javaInterface.javaPackage)
        javaClass.parentInterfaces.add(interfaceTypeReference)

        return javaClass
    }

    private fun addInnerClasses(javaTopLevelElement: JavaTopLevelElement) {
        val innerClasses = getPreviousResults(JavaClass::class.java).filterNot { it.isImplClass }
        innerClasses.forEach { it.qualifiers.add(JavaTopLevelElement.Qualifier.STATIC) }
        javaTopLevelElement.innerClasses.addAll(innerClasses)
    }

    private fun finishBuildingFrancaClass(francaInterface: FInterface) {
        var extendedClass = nativeBase

        val parentInterface = francaInterface.base
        if (parentInterface != null) {
            extendedClass = if (deploymentModel.isInterface(parentInterface)) {
                val parentImplementationClassName =
                    JavaNameRules.getImplementationClassName(parentInterface.name)
                typeMapper.mapCustomType(parentInterface, parentImplementationClassName)
            } else {
                typeMapper.mapCustomType(parentInterface)
            }
        }

        val methods = getPreviousResults(JavaMethod::class.java)
        val javaClass = createJavaClass(francaInterface, methods, extendedClass)

        storeResult(javaClass)
    }

    private fun finishBuildingFrancaInterface(francaInterface: FInterface) {
        val javaInterface = createJavaInterface(francaInterface)

        var extendedClass = nativeBase
        val parentInterface = francaInterface.base
        if (parentInterface != null) {
            javaInterface.parentInterfaces.add(typeMapper.mapCustomType(parentInterface))
            val parentImplementationClassName =
                JavaNameRules.getImplementationClassName(parentInterface.name)
            extendedClass = typeMapper.mapCustomType(parentInterface, parentImplementationClassName)
        }

        val javaImplementationClass =
            createJavaImplementationClass(francaInterface, javaInterface, extendedClass)

        storeResult(javaInterface)
        storeResult(javaImplementationClass)
    }

    private fun getVisibility(francaElement: FModelElement) =
        if (deploymentModel.isInternal(francaElement))
            JavaVisibility.PACKAGE
        else
            JavaVisibility.PUBLIC
}
