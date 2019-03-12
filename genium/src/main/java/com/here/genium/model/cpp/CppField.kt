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

package com.here.genium.model.cpp

import com.google.common.base.Strings
import java.util.stream.Stream

class CppField @JvmOverloads constructor(
    name: String,
    type: CppTypeRef,
    val initializer: CppValue? = null,
    val isNotNull: Boolean = false
) : CppTypedElement(name, type) {

    override fun stream() = Stream.of(type, initializer)

    @Suppress("unused")
    fun hasComment() = !Strings.isNullOrEmpty(comment) || isNotNull
}
