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

package com.here.genium.model.java

class JavaValue : JavaElementWithImports {
    val isNew: Boolean
    val isCustom: Boolean

    constructor(value: String, isCustom: Boolean = false) : super(value) {
        this.isNew = false
        this.isCustom = isCustom
    }

    constructor(type: JavaType) : super(type.name) {
        isNew = true
        isCustom = true
        imports.addAll(type.imports)
    }
}
