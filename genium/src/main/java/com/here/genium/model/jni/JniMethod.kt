/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

data class JniMethod @JvmOverloads constructor(
    var owningContainer: JniContainer? = null,
    val javaMethodName: String? = null,
    val cppMethodName: String? = null,
    val returnType: JniType? = null,
    val isStatic: Boolean = false,
    val isConst: Boolean = false,
    val isOverloaded: Boolean = false,
    val exception: JniException? = null,
    val parameters: MutableList<JniParameter> = mutableListOf()
) : JniElement
