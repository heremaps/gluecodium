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

package com.here.genium.generator.jni

import com.google.common.annotations.VisibleForTesting
import com.here.genium.common.CollectionsHelper
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.java.JavaModelBuilder
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppClass
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppEnumItem
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.franca.DefinedBy
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaEnumItem
import com.here.genium.model.java.JavaField
import com.here.genium.model.java.JavaMethod
import com.here.genium.model.java.JavaParameter
import com.here.genium.model.java.JavaTopLevelElement
import com.here.genium.model.java.JavaType
import com.here.genium.model.jni.JniContainer
import com.here.genium.model.jni.JniElement
import com.here.genium.model.jni.JniEnum
import com.here.genium.model.jni.JniEnumerator
import com.here.genium.model.jni.JniException
import com.here.genium.model.jni.JniField
import com.here.genium.model.jni.JniMethod
import com.here.genium.model.jni.JniParameter
import com.here.genium.model.jni.JniStruct
import com.here.genium.model.jni.JniTopLevelElement
import com.here.genium.model.jni.JniType
import org.franca.core.franca.FArgument
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import java.util.function.Consumer
import kotlin.streams.toList

/**
 * This class builds a correspondence-tree containing correspondences between java and cpp model
 * elements. Currently only corresponding classes and theirs corresponding methods are calculated.
 *
 * Preconditions:
 *
 * For correspondence calculation it is assumed to have one to one mapping, i.e. one franca
 * element is mapped to at least one target model element.
 *
 * It is assumed that Java- and CppModelBuilder's finishBuilding methods are called in advance of
 * calling finishBuilding on JniModelBuilder (constructed java and cpp elements need to be
 * accessible via getResults(..) ).
 */
class JniModelBuilder @VisibleForTesting
internal constructor(
    contextStack: ModelBuilderContextStack<JniElement>,
    private val deploymentModel: FrancaDeploymentModel,
    private val javaBuilder: JavaModelBuilder,
    private val cppBuilder: CppModelBuilder,
    private val cppIncludeResolver: CppIncludeResolver
) : AbstractModelBuilder<JniElement>(contextStack) {
    constructor(
        deploymentModel: FrancaDeploymentModel,
        javaBuilder: JavaModelBuilder,
        cppBuilder: CppModelBuilder,
        cppIncludeResolver: CppIncludeResolver
    ) : this(
        ModelBuilderContextStack<JniElement>(),
        deploymentModel,
        javaBuilder,
        cppBuilder,
        cppIncludeResolver
    )

    override fun finishBuilding(francaInterface: FInterface) {
        val cppClass = cppBuilder.getFinalResult(CppClass::class.java)
        val javaTopLevelElement = javaBuilder.getFinalResult(JavaTopLevelElement::class.java)
        val javaClass = javaBuilder.getFinalResult(JavaClass::class.java)

        val jniContainer = JniContainer(
            javaPackages = javaTopLevelElement!!.javaPackage.packageNames,
            cppNameSpaces = DefinedBy.getPackages(francaInterface),
            javaName = javaClass!!.name,
            javaInterfaceName = javaTopLevelElement.name,
            cppName = cppClass!!.name,
            cppFullyQualifiedName = cppClass.fullyQualifiedName,
            isFrancaInterface = true,
            isInterface = deploymentModel.isInterface(francaInterface)
        )

        val parentContainer = getPreviousResult(JniContainer::class.java)
        if (parentContainer != null) {
            parentContainer.parentMethods.forEach(Consumer<JniMethod> {
                jniContainer.addParentMethod(it)
            })
            parentContainer.methods.forEach(Consumer<JniMethod> { jniContainer.addParentMethod(it) })
        }

        getPreviousResults(JniMethod::class.java).forEach(Consumer<JniMethod> { jniContainer.add(it) })
        getPreviousResults(JniStruct::class.java).forEach(Consumer<JniStruct> { jniContainer.add(it) })
        getPreviousResults(JniEnum::class.java).forEach(Consumer<JniEnum> { jniContainer.add(it) })

        jniContainer.includes.add(cppIncludeResolver.resolveInclude(francaInterface))
        jniContainer.includes.addAll(getIncludes(francaInterface))

        storeResult(jniContainer)
        closeContext()
    }

    override fun finishBuilding(francaMethod: FMethod) {
        val javaMethod = javaBuilder.getFinalResult(JavaMethod::class.java)
        val cppMethod = cppBuilder.getFinalResult(CppMethod::class.java)

        var jniException: JniException? = null
        if (javaMethod?.exception != null) {
            jniException = JniException(
                JniNameRules.getFullClassName(javaMethod.exception),
                getPreviousResult(JniType::class.java)
            )
        }

        val jniMethod = JniMethod(
            javaMethodName = javaMethod.name,
            cppMethodName = cppMethod!!.name,
            returnType = JniType(javaMethod.returnType, cppMethod.returnType),
            isStatic = cppMethod.specifiers.contains(CppMethod.Specifier.STATIC),
            isConst = cppMethod.qualifiers.contains(CppMethod.Qualifier.CONST),
            isOverloaded = francaMethod.selector != null,
            isConstructor = javaMethod.isConstructor,
            exception = jniException
        )
        jniMethod.parameters.addAll(getPreviousResults(JniParameter::class.java))

        storeResult(jniMethod)
        closeContext()
    }

    override fun finishBuildingInputArgument(francaArgument: FArgument) {
        val javaParameter = javaBuilder.getFinalResult(JavaParameter::class.java)
        val cppParameter = cppBuilder.getFinalResult(CppParameter::class.java)
        val jniType = JniType(javaParameter!!.type, cppParameter!!.type)

        storeResult(JniParameter(javaParameter.name, jniType))
        closeContext()
    }

    override fun finishBuilding(francaStructType: FStructType) {
        val javaClass = javaBuilder.getFinalResult(JavaClass::class.java)
        val cppStruct = cppBuilder.getFinalResult(CppStruct::class.java)
        val jniStruct = JniStruct(javaClass, cppStruct, getPreviousResults(JniField::class.java))

        storeResult(jniStruct)
        closeContext()
    }

    override fun finishBuilding(francaEnumType: FEnumerationType) {
        // Type definition
        val javaEnum = javaBuilder.getFinalResult(JavaEnum::class.java)
        val cppEnum = cppBuilder.getFinalResult(CppEnum::class.java)
        storeResult(
            JniEnum(
                javaEnumName = javaEnum!!.name,
                cppEnumName = cppEnum!!.fullyQualifiedName,
                javaPackage = javaEnum.javaPackage,
                enumerators = getPreviousResults(JniEnumerator::class.java)
            )
        )

        // Type reference
        val javaType = javaBuilder.getFinalResult(JavaType::class.java)
        val cppTypeRef = cppBuilder.getFinalResult(CppTypeRef::class.java)
        storeResult(JniType(javaType, cppTypeRef))

        closeContext()
    }

    override fun finishBuilding(francaEnumerator: FEnumerator) {
        val javaEnumItem = javaBuilder.getFinalResult(JavaEnumItem::class.java)
        val cppEnumItem = cppBuilder.getFinalResult(CppEnumItem::class.java)
        storeResult(JniEnumerator(javaEnumItem!!.name, cppEnumItem!!.name))
        closeContext()
    }

    override fun finishBuilding(francaField: FField) {
        val javaField = javaBuilder.getFinalResult(JavaField::class.java)
        val cppField = cppBuilder.getFinalResult(CppField::class.java)
        val jniType = getPreviousResult(JniType::class.java)
        val jniField = JniField(
            javaField = javaField,
            cppField = cppField,
            type = jniType,
            isNullable = deploymentModel.isNullable(francaField),
            cppGetterName = deploymentModel.getExternalGetter(francaField),
            cppSetterName = deploymentModel.getExternalSetter(francaField)
        )

        storeResult(jniField)
        closeContext()
    }

    override fun finishBuilding(francaTypeCollection: FTypeCollection) {
        val jniTopLevelElement = getPreviousResult(JniTopLevelElement::class.java)
        val packageNames = if (jniTopLevelElement != null)
            jniTopLevelElement.javaPackage.packageNames
        else
            emptyList()

        val cppNameSpace = DefinedBy.getPackages(francaTypeCollection)
        val jniContainer = JniContainer(javaPackages = packageNames, cppNameSpaces = cppNameSpace)
        CollectionsHelper.getStreamOfType(currentContext.previousResults, JniStruct::class.java)
            .forEach { jniContainer.add(it) }
        CollectionsHelper.getStreamOfType(currentContext.previousResults, JniEnum::class.java)
            .forEach { jniContainer.add(it) }

        jniContainer.includes.addAll(getIncludes(francaTypeCollection))

        storeResult(jniContainer)
        closeContext()
    }

    override fun finishBuilding(francaAttribute: FAttribute) {
        val javaMethods =
            CollectionsHelper.getAllOfType(javaBuilder.finalResults, JavaMethod::class.java)
        val cppMethods =
            CollectionsHelper.getAllOfType(cppBuilder.finalResults, CppMethod::class.java)

        val javaGetter = javaMethods[0]
        val cppGetter = cppMethods[0]
        val isStatic = deploymentModel.isStatic(francaAttribute)
        val jniType = JniType(javaGetter.returnType, cppGetter.returnType)
        storeResult(
            JniMethod(
                javaMethodName = javaGetter.name,
                cppMethodName = cppGetter.name,
                returnType = jniType,
                isConst = true,
                isStatic = isStatic
            )
        )
        if (!francaAttribute.isReadonly) {
            val javaSetter = javaMethods[1]
            val cppSetter = cppMethods[1]
            val jniSetter = JniMethod(
                javaMethodName = javaSetter.name,
                cppMethodName = cppSetter.name,
                returnType = JniType.VOID,
                isStatic = isStatic
            )

            val javaParameter = javaSetter.parameters[0]
            val cppParameter = cppSetter.parameters[0]
            val parameterType = JniType(javaParameter.type, cppParameter.type)
            jniSetter.parameters.add(JniParameter(javaParameter.name, parameterType))

            storeResult(jniSetter)
        }

        closeContext()
    }

    private fun getIncludes(francaTypeCollection: FTypeCollection) =
        francaTypeCollection
            .types
            .stream()
            .map<Include> { cppIncludeResolver.resolveInclude(it) }
            .toList()
}
