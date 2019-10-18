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

class JavaPrimitiveType private constructor(val type: Type) : JavaType(type.value) {

    enum class Type(val value: String) {
        VOID("void"),
        BYTE("byte"),
        SHORT("short"),
        INT("int"),
        LONG("long"),
        FLOAT("float"),
        DOUBLE("double"),
        BOOL("boolean"),
        CHAR("char")
    }

    companion object {
        val VOID = JavaPrimitiveType(Type.VOID)
        val BYTE = JavaPrimitiveType(Type.BYTE)
        val SHORT = JavaPrimitiveType(Type.SHORT)
        val INT = JavaPrimitiveType(Type.INT)
        val LONG = JavaPrimitiveType(Type.LONG)
        val FLOAT = JavaPrimitiveType(Type.FLOAT)
        val DOUBLE = JavaPrimitiveType(Type.DOUBLE)
        val BOOL = JavaPrimitiveType(Type.BOOL)
        val CHAR = JavaPrimitiveType(Type.CHAR)
    }
}
