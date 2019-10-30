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

package com.here.gluecodium.model.java

import com.here.gluecodium.model.java.JavaPrimitiveTypeRef.Type

class JavaArrayTypeRef(val type: Type) : JavaTypeRef("${type.value}[]") {
    companion object {
        val BYTE_ARRAY = JavaArrayTypeRef(Type.BYTE)
        val SHORT_ARRAY = JavaArrayTypeRef(Type.SHORT)
        val INT_ARRAY = JavaArrayTypeRef(Type.INT)
        val LONG_ARRAY = JavaArrayTypeRef(Type.LONG)
        val FLOAT_ARRAY = JavaArrayTypeRef(Type.FLOAT)
        val DOUBLE_ARRAY = JavaArrayTypeRef(Type.DOUBLE)
        val BOOL_ARRAY = JavaArrayTypeRef(Type.BOOL)
        val CHAR_ARRAY = JavaArrayTypeRef(Type.CHAR)
    }
}
