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

import com.here.gluecodium.cli.GluecodiumExecutionException

class JavaReferenceTypeRef(val type: Type) :
    JavaComplexTypeRef(type.value, type.imports, listOf(type.value), type.packageNames) {

    enum class Type(
        val value: String,
        val packageNames: List<String> = JAVA_LANG_PACKAGE,
        val imports: Set<JavaImport> = emptySet()
    ) {
        OBJECT("Object"), // All java objects
        CLASS("Class"), // java.lang.Class objects
        STRING("String"), // java.lang.String objects
        THROWABLE("Throwable"), // java.lang.Throwable objects
        BOOL("Boolean"),
        BYTE("Byte"),
        CHAR("Character"),
        SHORT("Short"),
        INT("Integer"),
        LONG("Long"),
        FLOAT("Float"),
        DOUBLE("Double"),
        DATE("Date", JAVA_UTIL_PACKAGE, setOf(JavaImport("Date", JavaPackage(JAVA_UTIL_PACKAGE)))),
        LOCALE("Locale", JAVA_UTIL_PACKAGE, setOf(JavaImport("Locale", JavaPackage(JAVA_UTIL_PACKAGE))))
    }

    companion object {
        private val JAVA_LANG_PACKAGE = listOf("java", "lang")
        private val JAVA_UTIL_PACKAGE = listOf("java", "util")

        /**
         * Wrap primitive types since generic templates don't apply to them
         *
         * @param primitiveType a primitive type
         * @return custom type wrapper of the primitive type
         */
        fun boxPrimitiveType(primitiveType: JavaPrimitiveTypeRef): JavaReferenceTypeRef {
            val boxedType = when (primitiveType) {
                JavaPrimitiveTypeRef.BOOL -> Type.BOOL
                JavaPrimitiveTypeRef.CHAR -> Type.CHAR
                JavaPrimitiveTypeRef.INT -> Type.INT
                JavaPrimitiveTypeRef.FLOAT -> Type.FLOAT
                JavaPrimitiveTypeRef.DOUBLE -> Type.DOUBLE
                JavaPrimitiveTypeRef.BYTE -> Type.BYTE
                JavaPrimitiveTypeRef.SHORT -> Type.SHORT
                JavaPrimitiveTypeRef.LONG -> Type.LONG
                else -> throw GluecodiumExecutionException(
                    "Cannot box primitive type ${primitiveType.name}"
                )
            }
            return JavaReferenceTypeRef(boxedType)
        }
    }
}
