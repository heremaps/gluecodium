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

package com.here.gluecodium.model.lime

import com.here.gluecodium.common.StringHelper
import com.here.gluecodium.model.lime.LimeBasicType.TypeId

/**
 * Represents a constant value on the right-hand side of an assignment (used in constants, field
 * default values, and enumerator values).
 */
sealed class LimeValue(open val typeRef: LimeTypeRef) : LimeElement() {
    /**
     * Represents a literal value, i.e. a value that should be interpreted "literally", without any
     * additional processing or resolution.
     */
    class Literal(type: LimeTypeRef, val value: String) : LimeValue(type) {
        override fun toString(): String {
            val limeType = typeRef.type.actualType
            if (limeType !is LimeBasicType) return value
            return when (limeType.typeId) {
                TypeId.STRING, TypeId.DATE, TypeId.LOCALE -> StringHelper.escapeStringLiteral(value)
                else -> value
            }
        }
    }

    /**
     * Represents a value that is a reference to a specific enumerator element (i.e. an single item
     * from an enumeration).
     */
    class Enumerator(type: LimeTypeRef, val valueRef: LimeEnumeratorRef) : LimeValue(type) {
        override val typeRef
            get() = valueRef.enumRef

        override fun toString() = valueRef.enumerator.path.let { "${it.parent.name}.${it.name}" }

        override val escapedValue: String
            get() {
                val enumeratorPath = valueRef.enumerator.path
                return LimeTypeHelper.escapeIdentifier(enumeratorPath.parent.name) + "." +
                    LimeTypeHelper.escapeIdentifier(enumeratorPath.name)
            }
    }

    /**
     * Represents a special numerical value: either a "not a number" (NaN) value or an infinite
     * value (positive or negative).
     */
    class Special(type: LimeTypeRef, val value: ValueId) : LimeValue(type) {
        enum class ValueId(private val tag: String) {
            NAN("NaN"),
            INFINITY("Infinity"),
            NEGATIVE_INFINITY("-Infinity");

            override fun toString() = tag
        }

        override fun toString() = value.toString()
    }

    class Null(type: LimeTypeRef) : LimeValue(type) {
        override fun toString() = "null"
    }

    class InitializerList(type: LimeTypeRef, val values: List<LimeValue>) : LimeValue(type) {
        override fun toString() = values.joinToString(separator = ", ", prefix = "[", postfix = "]")
    }

    class StructInitializer(type: LimeTypeRef, val values: List<LimeValue>) : LimeValue(type) {
        override fun toString() = values.joinToString(separator = ", ", prefix = "{", postfix = "}")
    }

    class KeyValuePair(val key: LimeValue, val value: LimeValue) : LimeValue(LimeBasicTypeRef(TypeId.VOID)) {
        override fun toString() = "$key: $value"
    }

    class Duration(typeRef: LimeTypeRef, val value: String, val timeUnit: TimeUnit) : LimeValue(typeRef) {
        enum class TimeUnit(private val suffix: String) {
            DAY("d"),
            HOUR("h"),
            MINUTE("min"),
            SECOND("s"),
            MILLISECOND("ms"),
            MICROSECOND("us"),
            NANOSECOND("ns");

            override fun toString() = suffix

            companion object {
                val fromString = values().associateBy { it.suffix }
            }
        }

        override fun toString() = value + timeUnit
    }

    open val escapedValue
        get() = toString()

    companion object {
        val ZERO = Literal(LimeBasicTypeRef.INT, "0")
    }
}
