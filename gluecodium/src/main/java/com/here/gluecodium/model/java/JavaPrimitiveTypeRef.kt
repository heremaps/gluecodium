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

class JavaPrimitiveTypeRef private constructor(val type: Type) : JavaTypeRef(type.value) {

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
        val VOID = JavaPrimitiveTypeRef(Type.VOID)
        val BYTE = JavaPrimitiveTypeRef(Type.BYTE)
        val SHORT = JavaPrimitiveTypeRef(Type.SHORT)
        val INT = JavaPrimitiveTypeRef(Type.INT)
        val LONG = JavaPrimitiveTypeRef(Type.LONG)
        val FLOAT = JavaPrimitiveTypeRef(Type.FLOAT)
        val DOUBLE = JavaPrimitiveTypeRef(Type.DOUBLE)
        val BOOL = JavaPrimitiveTypeRef(Type.BOOL)
        val CHAR = JavaPrimitiveTypeRef(Type.CHAR)
    }
}
