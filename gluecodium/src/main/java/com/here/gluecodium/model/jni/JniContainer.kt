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

package com.here.gluecodium.model.jni

import com.here.gluecodium.generator.jni.JniNameRules
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.java.JavaPackage

/**
 * JniContainer is a container for classes, fields and methods.
 *
 * It can be referring to a type collection or an interface. The Cpp/Java name attributes
 * represent the name of the owning container which is the name of the containing class in case of
 * interface or the name of the package in case of type collection.
 */
class JniContainer(
    val javaPackage: JavaPackage = JavaPackage(emptyList()),
    val cppNameSpaces: List<String> = emptyList(),
    val javaNames: List<String> = emptyList(),
    val javaInterfaceNames: List<String> = emptyList(),
    val cppName: String? = null,
    val cppFullyQualifiedName: String? = null,
    val containerType: ContainerType = ContainerType.TYPE_COLLECTION,
    var internalNamespace: List<String>? = null,
    val isEquatable: Boolean = false,
    val isPointerEquatable: Boolean = false,
    @Suppress("unused") val hasTypeRepository: Boolean = false,
    @Suppress("unused") val isFunctionalInterface: Boolean = false,
    @Suppress("unused") val hasConstructors: Boolean = false,
    @Suppress("unused") val hasInterfaceParent: Boolean = false
) : JniElement {
    val methods: MutableList<JniMethod> = mutableListOf()
    val parentMethods: MutableList<JniMethod> = mutableListOf()
    val structs: MutableList<JniStruct> = mutableListOf()
    val enums: MutableList<JniEnum> = mutableListOf()
    val includes: MutableSet<Include> = LinkedHashSet()
    @Suppress("unused")
    val hasNativeEquatable = isEquatable || isPointerEquatable
    @Suppress("unused")
    val fullJavaName = (javaPackage.packageNames + javaNames.joinToString("$")).joinToString("/")
    @Suppress("unused")
    val mangledName = JniNameRules.getMangledName(fullJavaName)

    enum class ContainerType {
        TYPE_COLLECTION,
        INTERFACE,
        CLASS
    }
}
