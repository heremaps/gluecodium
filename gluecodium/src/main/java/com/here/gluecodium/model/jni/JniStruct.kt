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
import com.here.gluecodium.model.java.JavaPackage

class JniStruct(
    javaName: String,
    cppFullyQualifiedName: String,
    javaPackage: JavaPackage,
    val fields: List<JniField> = emptyList(),
    val methods: List<JniMethod> = emptyList(),
    val hasImmutableFields: Boolean = false,
    externalConverter: String? = null,
    externalConvertedType: String? = null,
    val structs: List<JniStruct> = emptyList()
) : JniTopLevelElement(
    javaName,
    cppFullyQualifiedName,
    javaPackage,
    externalConverter,
    externalConvertedType
) {
    @Suppress("unused")
    override val mangledName
        get() = JniNameRules.getMangledName((javaPackage.packageNames + javaName).joinToString("/"))
}
