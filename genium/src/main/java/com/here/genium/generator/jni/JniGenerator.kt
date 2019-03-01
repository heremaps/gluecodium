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

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.common.AbstractGenerator
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.generator.cpp.CppValueMapper
import com.here.genium.generator.java.JavaModelBuilder
import com.here.genium.generator.java.JavaTypeMapper
import com.here.genium.model.common.Include
import com.here.genium.model.common.ModelElement
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.franca.DefinedBy
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaImport
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.jni.JniContainer
import org.franca.core.franca.FTypeCollection

class JniGenerator(
    private val deploymentModel: FrancaDeploymentModel,
    packageList: List<String>,
    private val additionalIncludes: List<String>,
    private val errorEnumFilter: FrancaTypeHelper.ErrorEnumFilter,
    private val enableAndroidFeatures: Boolean,
    private val internalNamespace: String,
    rootNamespace: List<String>
) : AbstractGenerator(packageList) {
    private val cppIncludeResolver = CppIncludeResolver(deploymentModel, rootNamespace)
    private val cppNameResolver = CppNameResolver(deploymentModel, rootNamespace)

    fun generateModel(francaTypeCollection: FTypeCollection): Collection<ModelElement> {
        val basePackage = JavaPackage(basePackages)
        val javaBuilder = JavaModelBuilder(
            deploymentModel,
            basePackage.createChildPackage(DefinedBy.getPackages(francaTypeCollection)),
            JavaTypeMapper(
                basePackage,
                deploymentModel,
                if (enableAndroidFeatures) PARCELABLE else null,
                if (enableAndroidFeatures) NON_NULL else null,
                if (enableAndroidFeatures) NULLABLE else null
            ),
            errorEnumFilter
        )

        val typeMapper =
            CppTypeMapper(cppIncludeResolver, cppNameResolver, internalNamespace, deploymentModel)
        val valueMapper = CppValueMapper(deploymentModel, cppNameResolver)
        val cppBuilder = CppModelBuilder(deploymentModel, typeMapper, valueMapper, cppNameResolver)
        val jniBuilder =
            JniModelBuilder(
                deploymentModel,
                javaBuilder,
                cppBuilder,
                cppIncludeResolver,
                internalNamespace
            )

        val treeWalker = FrancaTreeWalker(listOf(javaBuilder, cppBuilder, jniBuilder))
        treeWalker.walkTree(francaTypeCollection)

        val jniContainer = jniBuilder.getFinalResult(JniContainer::class.java)
        jniContainer.includes.addAll(getIncludes(jniContainer))

        return javaBuilder.finalResults + jniContainer
    }

    private fun getIncludes(jniContainer: JniContainer): List<Include> {
        val includes = mutableListOf<String>()
        if (jniContainer.containerType != JniContainer.ContainerType.TYPE_COLLECTION) {
            includes +=
                    JniNameRules.getHeaderFileName(JniNameRules.getJniClassFileName(jniContainer))
        }
        includes += additionalIncludes

        return includes.map(Include.Companion::createInternalInclude)
    }

    companion object {
        private val ANDROID_OS_PACKAGE = JavaPackage(listOf("android", "os"))
        private val ANDROID_SUPPORT_ANNOTATION_PACKAGE =
            JavaPackage(listOf("android", "support", "annotation"))
        private val PARCELABLE = JavaCustomType(
            "Parcelable", null,
            ANDROID_OS_PACKAGE.packageNames,
            listOf(
                JavaImport("Parcelable", ANDROID_OS_PACKAGE),
                JavaImport("Parcel", ANDROID_OS_PACKAGE)
            )
        )
        private val NON_NULL = JavaCustomType("NonNull", ANDROID_SUPPORT_ANNOTATION_PACKAGE)
        private val NULLABLE = JavaCustomType("Nullable", ANDROID_SUPPORT_ANNOTATION_PACKAGE)
    }
}
