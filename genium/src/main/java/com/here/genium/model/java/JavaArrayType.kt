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

import com.here.genium.model.java.JavaPrimitiveType.Type

class JavaArrayType(val type: Type) : JavaType("${type.value}[]") {
    companion object {
        val BYTE_ARRAY = JavaArrayType(Type.BYTE)
        val SHORT_ARRAY = JavaArrayType(Type.SHORT)
        val INT_ARRAY = JavaArrayType(Type.INT)
        val LONG_ARRAY = JavaArrayType(Type.LONG)
        val FLOAT_ARRAY = JavaArrayType(Type.FLOAT)
        val DOUBLE_ARRAY = JavaArrayType(Type.DOUBLE)
        val BOOL_ARRAY = JavaArrayType(Type.BOOL)
        val CHAR_ARRAY = JavaArrayType(Type.CHAR)
    }
}
