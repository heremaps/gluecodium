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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.java.JavaCustomType
import com.here.gluecodium.model.java.JavaTemplateType
import com.here.gluecodium.model.java.JavaType
import com.here.gluecodium.model.jni.JniContainer
import com.here.gluecodium.model.jni.JniMethod
import com.here.gluecodium.model.jni.JniStruct
import com.here.gluecodium.model.jni.JniTopLevelElement
import com.here.gluecodium.model.jni.JniType
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef

internal object JniIncludeResolver {

    fun getConversionIncludes(
        limeTypeRef: LimeTypeRef,
        javaType: JavaType
    ): List<Include> =
        when (val limeType = LimeTypeHelper.getActualType(limeTypeRef.type)) {
            is LimeStruct, is LimeEnumeration, is LimeContainerWithInheritance, is LimeLambda -> {
                listOfNotNull((javaType as? JavaCustomType)?.let {
                    createConversionInclude(it.packageNames, it.classNames)
                })
            }
            is LimeList -> {
                val templateType = javaType as JavaTemplateType
                getConversionIncludes(limeType.elementType, templateType.templateParameters.first())
            }
            is LimeSet -> {
                val templateType = javaType as JavaTemplateType
                getConversionIncludes(limeType.elementType, templateType.templateParameters.first())
            }
            is LimeMap -> {
                val templateType = javaType as JavaTemplateType
                getConversionIncludes(limeType.keyType, templateType.templateParameters.first()) +
                    getConversionIncludes(limeType.valueType, templateType.templateParameters.last())
            }
            else -> emptyList()
        }

    private fun createConversionInclude(
        packageNames: List<String>,
        classNames: List<String>
    ): Include {
        val fileName = JniNameRules.getConversionFileName(packageNames, classNames)
        return Include.createInternalInclude(fileName + JniNameRules.JNI_HEADER_FILE_SUFFIX)
    }

    private fun collectMethodTypes(jniMethod: JniMethod): List<JniType> {
        return jniMethod.parameters.map { it.type } + jniMethod.returnType +
            listOfNotNull(jniMethod.exception?.errorType)
    }

    fun createConversionSelfInclude(jniElement: JniTopLevelElement) =
        Include.createInternalInclude(
            JniNameRules.getConversionFileName(jniElement) + JniNameRules.JNI_HEADER_FILE_SUFFIX
        )

    fun createConversionSelfInclude(jniContainer: JniContainer) =
        Include.createInternalInclude(
            JniNameRules.getConversionFileName(jniContainer) + JniNameRules.JNI_HEADER_FILE_SUFFIX
        )

    fun collectImplementationIncludes(jniContainer: JniContainer): List<Include> {
        val methods = jniContainer.methods + jniContainer.parentMethods +
                jniContainer.structs.flatMap { it.methods }
        val types = jniContainer.structs.flatMap { it.fields }.map { it.type } +
                methods.flatMap { collectMethodTypes(it) }
        return types.flatMap { it.conversionIncludes } + createConversionSelfInclude(jniContainer)
    }

    fun collectMethodImplementationIncludes(jniStruct: JniStruct): List<Include> {
        val types = jniStruct.methods.flatMap { collectMethodTypes(it) }
        return types.flatMap { it.conversionIncludes } + createConversionSelfInclude(jniStruct)
    }

    fun collectConversionImplementationIncludes(jniStruct: JniStruct) =
        jniStruct.fields.map { it.type }.flatMap { it.conversionIncludes } +
                createConversionSelfInclude(jniStruct)
}
