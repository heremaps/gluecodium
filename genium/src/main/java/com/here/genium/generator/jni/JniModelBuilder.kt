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

import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.generator.common.modelbuilder.AbstractLimeBasedModelBuilder
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.java.JavaModelBuilder
import com.here.genium.model.cpp.CppClass
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppEnumItem
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaEnumItem
import com.here.genium.model.java.JavaField
import com.here.genium.model.java.JavaMethod
import com.here.genium.model.java.JavaParameter
import com.here.genium.model.java.JavaPrimitiveType
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
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeRef

/**
 * This class builds a correspondence-tree containing correspondences between Java and C++ model
 * elements. Currently only corresponding classes and theirs corresponding methods are calculated.
 *
 * Preconditions:
 *
 * For correspondence calculation it is assumed to have one to one mapping, i.e. one LIME
 * element is mapped to at least one target model element.
 *
 * It is assumed that Java- and CppModelBuilder's finishBuilding methods are called in advance of
 * calling finishBuilding on JniModelBuilder (constructed Java and C++ elements need to be
 * accessible via getResults() ).
 */
class JniModelBuilder(
    contextStack: ModelBuilderContextStack<JniElement> = ModelBuilderContextStack(),
    private val javaBuilder: JavaModelBuilder,
    private val cppBuilder: CppModelBuilder,
    private val cppIncludeResolver: CppIncludeResolver,
    private val internalNamespace: List<String>
) : AbstractLimeBasedModelBuilder<JniElement>(contextStack) {

    override fun finishBuilding(limeContainer: LimeContainer) {
        val jniContainer = when {
            limeContainer.type == LimeContainer.ContainerType.TYPE_COLLECTION ->
                finishBuildingTypeCollection(limeContainer)
            else -> finishBuildingInterfaceOrClass(limeContainer)
        }

        storeResult(jniContainer)
        closeContext()
    }

    private fun finishBuildingTypeCollection(limeContainer: LimeContainer): JniContainer {
        val jniTopLevelElement = getPreviousResultOrNull(JniTopLevelElement::class.java)
        val packageNames = jniTopLevelElement?.javaPackage?.packageNames ?: emptyList()

        val cppNameSpace = limeContainer.path.head
        val jniContainer = JniContainer(
            javaPackages = packageNames,
            cppNameSpaces = cppNameSpace,
            containerType = getContainerType(limeContainer),
            internalNamespace = internalNamespace
        )
        getPreviousResults(JniStruct::class.java).forEach { jniContainer.add(it) }
        getPreviousResults(JniEnum::class.java).forEach { jniContainer.add(it) }

        val types = limeContainer.structs + limeContainer.enumerations + limeContainer.typeDefs
        jniContainer.includes += types.flatMap { cppIncludeResolver.resolveIncludes(it) }

        return jniContainer
    }

    private fun finishBuildingInterfaceOrClass(limeContainer: LimeContainer): JniContainer {
        val cppClass = cppBuilder.getFinalResult(CppClass::class.java)
        val javaTopLevelElement = javaBuilder.getFinalResult(JavaTopLevelElement::class.java)
        val javaClass = javaBuilder.getFinalResult(JavaClass::class.java)

        val jniContainer = JniContainer(
            javaPackages = javaTopLevelElement.javaPackage.packageNames,
            cppNameSpaces = limeContainer.path.head,
            javaName = javaClass.name,
            javaInterfaceName = javaTopLevelElement.name,
            cppName = cppClass.name,
            cppFullyQualifiedName = cppClass.fullyQualifiedName,
            containerType = getContainerType(limeContainer),
            internalNamespace = internalNamespace,
            isEquatable = limeContainer.attributes.have(LimeAttributeType.EQUATABLE),
            isPointerEquatable = limeContainer.attributes.have(LimeAttributeType.POINTER_EQUATABLE)
        )

        val parentContainer = getPreviousResultOrNull(JniContainer::class.java)
        if (parentContainer != null) {
            jniContainer.parentMethods += parentContainer.parentMethods
            jniContainer.parentMethods += parentContainer.methods
        }

        jniContainer.methods += getPreviousResults(JniMethod::class.java)
        getPreviousResults(JniStruct::class.java).forEach { jniContainer.add(it) }
        getPreviousResults(JniEnum::class.java).forEach { jniContainer.add(it) }

        val types = listOf(limeContainer) + limeContainer.structs + limeContainer.enumerations +
                limeContainer.typeDefs
        jniContainer.includes += types.flatMap { cppIncludeResolver.resolveIncludes(it) }

        return jniContainer
    }

    override fun finishBuilding(limeMethod: LimeMethod) {
        val javaMethod = javaBuilder.getFinalResult(JavaMethod::class.java)
        val cppMethod = cppBuilder.getFinalResult(CppMethod::class.java)

        val jniException = javaMethod.exception?.let {
            JniException(JniNameRules.getFullClassName(it), getPreviousResult(JniType::class.java))
        }

        val jniMethod = JniMethod(
            javaMethodName = javaMethod.name,
            cppMethodName = cppMethod.name,
            returnType = JniType(javaMethod.returnType, cppMethod.returnType),
            isStatic = cppMethod.specifiers.contains(CppMethod.Specifier.STATIC),
            isConst = cppMethod.qualifiers.contains(CppMethod.Qualifier.CONST),
            isOverloaded = limeMethod.path.disambiguationSuffix.isNotEmpty(),
            returnsOpaqueHandle =
                javaMethod.isConstructor && javaMethod.returnType == JavaPrimitiveType.LONG,
            exception = jniException
        )
        jniMethod.parameters.addAll(getPreviousResults(JniParameter::class.java))

        storeResult(jniMethod)
        closeContext()
    }

    override fun finishBuilding(limeParameter: LimeParameter) {
        val javaParameter = javaBuilder.getFinalResult(JavaParameter::class.java)
        val cppParameter = cppBuilder.getFinalResult(CppParameter::class.java)
        val jniType = JniType(javaParameter.type, cppParameter.type)

        storeResult(JniParameter(javaParameter.name, jniType))
        closeContext()
    }

    override fun finishBuilding(limeStruct: LimeStruct) {
        val javaClass = javaBuilder.getFinalResult(JavaClass::class.java)
        val cppStruct = cppBuilder.getFinalResult(CppStruct::class.java)
        val jniStruct = JniStruct(
            javaClass,
            cppStruct,
            getPreviousResults(JniField::class.java),
            getPreviousResults(JniMethod::class.java)
        )

        storeResult(jniStruct)
        closeContext()
    }

    override fun finishBuilding(limeField: LimeField) {
        val javaField = javaBuilder.getFinalResult(JavaField::class.java)
        val cppField = cppBuilder.getFinalResult(CppField::class.java)
        val jniField = JniField(
            javaField = javaField,
            cppField = cppField,
            cppGetterName = limeField.attributes.get(
                LimeAttributeType.EXTERNAL_GETTER,
                String::class.java
            ),
            cppSetterName = limeField.attributes.get(
                LimeAttributeType.EXTERNAL_SETTER,
                String::class.java
            )
        )

        storeResult(jniField)
        closeContext()
    }

    override fun finishBuilding(limeEnumeration: LimeEnumeration) {
        val javaEnum = javaBuilder.getFinalResult(JavaEnum::class.java)
        val cppEnum = cppBuilder.getFinalResult(CppEnum::class.java)
        val jniEnum = JniEnum(
            javaEnumName = javaEnum.name,
            cppEnumName = cppEnum.fullyQualifiedName,
            javaPackage = javaEnum.javaPackage,
            enumerators = getPreviousResults(JniEnumerator::class.java)
        )

        storeResult(jniEnum)
        closeContext()
    }

    override fun finishBuilding(limeEnumerator: LimeEnumerator) {
        val javaEnumItem = javaBuilder.getFinalResult(JavaEnumItem::class.java)
        val cppEnumItem = cppBuilder.getFinalResult(CppEnumItem::class.java)
        storeResult(JniEnumerator(javaEnumItem.name, cppEnumItem.name))
        closeContext()
    }

    override fun finishBuilding(limeProperty: LimeProperty) {
        val javaMethods = javaBuilder.finalResults.filterIsInstance<JavaMethod>()
        val cppMethods = cppBuilder.finalResults.filterIsInstance<CppMethod>()

        val javaGetter = javaMethods.first()
        val cppGetter = cppMethods.first()
        val jniType = JniType(javaGetter.returnType, cppGetter.returnType)
        storeResult(
            JniMethod(
                javaMethodName = javaGetter.name,
                cppMethodName = cppGetter.name,
                returnType = jniType,
                isConst = true,
                isStatic = limeProperty.isStatic
            )
        )
        if (!limeProperty.isReadonly) {
            val javaSetter = javaMethods.last()
            val cppSetter = cppMethods.last()
            val jniSetter = JniMethod(
                javaMethodName = javaSetter.name,
                cppMethodName = cppSetter.name,
                returnType = JniType.VOID,
                isStatic = limeProperty.isStatic
            )

            val javaParameter = javaSetter.parameters.first()
            val cppParameter = cppSetter.parameters.first()
            val parameterType = JniType(javaParameter.type, cppParameter.type)
            jniSetter.parameters.add(JniParameter(javaParameter.name, parameterType))

            storeResult(jniSetter)
        }

        closeContext()
    }

    override fun finishBuilding(limeTypeRef: LimeTypeRef) {
        val jniType = JniType(
            javaBuilder.getFinalResult(JavaType::class.java),
            cppBuilder.getFinalResult(CppTypeRef::class.java)
        )

        storeResult(jniType)
        closeContext()
    }

    private fun getContainerType(limeContainer: LimeContainer) =
        when (limeContainer.type) {
            LimeContainer.ContainerType.TYPE_COLLECTION ->
                JniContainer.ContainerType.TYPE_COLLECTION
            LimeContainer.ContainerType.INTERFACE -> JniContainer.ContainerType.INTERFACE
            LimeContainer.ContainerType.CLASS -> JniContainer.ContainerType.CLASS
        }
}
