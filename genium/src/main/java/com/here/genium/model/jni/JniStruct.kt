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

package com.here.genium.model.jni

import com.here.genium.generator.jni.JniNameRules
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.java.JavaPackage

class JniStruct(
    val javaStructName: String,
    javaPackage: JavaPackage,
    val cppStruct: CppStruct,
    val fields: List<JniField> = emptyList(),
    val methods: List<JniMethod> = emptyList()
) : JniTopLevelElement(javaPackage) {

    val includes get() = owningContainer.includes
    val javaPackages get() = owningContainer.javaPackages
    val mangledName get() = JniNameRules.getMangledName(getContainerPrefix() + javaStructName)
    val cppFullyQualifiedName = cppStruct.fullyQualifiedName

    private fun getContainerPrefix() =
        when (owningContainer.containerType) {
            JniContainer.ContainerType.TYPE_COLLECTION -> ""
            else -> owningContainer.javaName + "$"
        }
}
