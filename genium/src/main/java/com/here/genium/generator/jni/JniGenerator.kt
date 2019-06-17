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

import com.here.genium.generator.common.AbstractGenerator
import com.here.genium.generator.common.modelbuilder.LimeTreeWalker
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppNameRules
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.generator.java.JavaMethodNameResolver
import com.here.genium.generator.java.JavaModelBuilder
import com.here.genium.generator.java.JavaNameRules
import com.here.genium.generator.java.JavaTypeMapper
import com.here.genium.generator.java.JavaValueMapper
import com.here.genium.model.common.Include
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaImport
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.jni.JniContainer
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeMethod

class JniGenerator(
    private val limeReferenceMap: Map<String, LimeElement>,
    packageList: List<String>,
    private val internalPackageList: List<String>,
    private val additionalIncludes: List<String>,
    private val enableAndroidFeatures: Boolean,
    private val internalNamespace: List<String>,
    rootNamespace: List<String>,
    private val nonNullAnnotation: JavaCustomType?,
    private val nullableAnnotation: JavaCustomType?,
    private val cppNameRules: CppNameRules,
    private val javaNameRules: JavaNameRules
) : AbstractGenerator(packageList) {
    private val cppNameResolver = CppNameResolver(rootNamespace, limeReferenceMap, cppNameRules)
    private val errorEnums =
        limeReferenceMap.values
            .filterIsInstance<LimeMethod>()
            .mapNotNull { it.errorType?.elementFullName }
            .toSet()

    fun generateModel(limeContainer: LimeContainer): JavaModel {
        val basePackage = JavaPackage(basePackages)
        val internalPackage = JavaPackage(basePackages + internalPackageList)
        val javaTypeMapper = JavaTypeMapper(
            limeReferenceMap = limeReferenceMap,
            basePackage = basePackage,
            internalPackage = internalPackage,
            serializationBase = if (enableAndroidFeatures) PARCELABLE else null,
            notNullAnnotation = nonNullAnnotation,
            nullableAnnotation = nullableAnnotation,
            nameRules = javaNameRules
        )
        val javaBuilder = JavaModelBuilder(
            rootPackage = basePackage.createChildPackage(limeContainer.path.head),
            typeMapper = javaTypeMapper,
            valueMapper = JavaValueMapper(limeReferenceMap, javaNameRules),
            methodNameResolver = JavaMethodNameResolver(limeReferenceMap, javaNameRules),
            errorEnums = errorEnums,
            nameRules = javaNameRules
        )

        val includeResolver = CppIncludeResolver(limeReferenceMap, cppNameRules)
        val typeMapper = CppTypeMapper(cppNameResolver, includeResolver, internalNamespace)
        val cppBuilder = CppModelBuilder(typeMapper = typeMapper, nameResolver = cppNameResolver)

        val jniBuilder = JniModelBuilder(
            javaBuilder = javaBuilder,
            cppBuilder = cppBuilder,
            cppIncludeResolver = includeResolver,
            internalNamespace = internalNamespace
        )

        val treeWalker = LimeTreeWalker(listOf(javaBuilder, cppBuilder, jniBuilder))
        treeWalker.walkTree(limeContainer)

        val jniContainer = jniBuilder.getFinalResult(JniContainer::class.java)
        jniContainer.includes.addAll(getIncludes(jniContainer))

        return JavaModel(
            javaBuilder.referenceMap,
            javaBuilder.finalResults,
            listOf(jniContainer),
            jniBuilder.setsCollector.values.toSet()
        )
    }

    private fun getIncludes(jniContainer: JniContainer): Set<Include> {
        val includes = mutableListOf<String>()
        if (jniContainer.containerType != JniContainer.ContainerType.TYPE_COLLECTION) {
            includes +=
                JniNameRules.getHeaderFileName(JniNameRules.getJniClassFileName(jniContainer))
        }
        includes += jniContainer.structs
            .filterNot { it.methods.isEmpty() }
            .map {
                JniNameRules.getHeaderFileName(JniNameRules.getJniStructFileName(jniContainer, it))
            }
        includes += additionalIncludes

        val includeSet = includes.map { Include.createInternalInclude(it) }.toSet()
        CppLibraryIncludes.filterIncludes(includeSet, internalNamespace)
        return includeSet
    }

    companion object {
        private val ANDROID_OS_PACKAGE = JavaPackage(listOf("android", "os"))
        private val PARCELABLE = JavaCustomType(
            "Parcelable", null,
            ANDROID_OS_PACKAGE.packageNames,
            listOf(
                JavaImport("Parcelable", ANDROID_OS_PACKAGE),
                JavaImport("Parcel", ANDROID_OS_PACKAGE)
            )
        )
    }
}
