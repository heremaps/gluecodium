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

import com.here.gluecodium.generator.common.modelbuilder.LimeTreeWalker
import com.here.gluecodium.generator.java.JavaModelBuilder
import com.here.gluecodium.generator.java.JavaNameResolver
import com.here.gluecodium.generator.java.JavaNameRules
import com.here.gluecodium.generator.java.JavaTypeMapper
import com.here.gluecodium.generator.java.JavaValueMapper
import com.here.gluecodium.model.java.JavaCustomTypeRef
import com.here.gluecodium.model.java.JavaImport
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement

class JavaGenerator(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val basePackages: List<String>,
    private val internalPackageList: List<String>,
    private val enableAndroidFeatures: Boolean,
    private val nonNullAnnotation: JavaCustomTypeRef?,
    private val nullableAnnotation: JavaCustomTypeRef?,
    private val javaNameRules: JavaNameRules
) {
    private val javaNameResolver = JavaNameResolver(javaNameRules, limeReferenceMap)

    fun generateModel(rootElement: LimeNamedElement): JavaModel {
        val basePackage = JavaPackage(basePackages)
        val internalPackage = JavaPackage(basePackages + internalPackageList)
        val javaTypeMapper = JavaTypeMapper(
            limeReferenceMap = limeReferenceMap,
            basePackage = basePackage,
            internalPackage = internalPackage,
            serializationBase = if (enableAndroidFeatures) PARCELABLE else null,
            nonNullAnnotation = nonNullAnnotation,
            nullableAnnotation = nullableAnnotation,
            nameResolver = javaNameResolver
        )
        val javaBuilder = JavaModelBuilder(
            rootPackage = basePackage.createChildPackage(rootElement.path.head),
            typeMapper = javaTypeMapper,
            valueMapper = JavaValueMapper(limeReferenceMap, javaNameRules, javaTypeMapper),
            nameRules = javaNameRules,
            nameResolver = javaNameResolver,
            buildTransientModel = { generateModel(it).javaElements }
        )

        val treeWalker = LimeTreeWalker(listOf(javaBuilder))
        treeWalker.walkTree(rootElement)

        return JavaModel(
            javaBuilder.referenceMap,
            javaBuilder.reverseReferenceMap,
            javaBuilder.finalResults
        )
    }

    companion object {
        private val ANDROID_OS_PACKAGE = JavaPackage(listOf("android", "os"))
        private val PARCELABLE = JavaCustomTypeRef(
            fullName = "Parcelable",
            packageNames = ANDROID_OS_PACKAGE.packageNames,
            imports = LinkedHashSet(listOf(
                JavaImport("Parcelable", ANDROID_OS_PACKAGE),
                JavaImport("Parcel", ANDROID_OS_PACKAGE)
            ))
        )
    }
}
