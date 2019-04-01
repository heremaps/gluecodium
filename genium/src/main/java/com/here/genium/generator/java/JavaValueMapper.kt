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

package com.here.genium.generator.java

import com.here.genium.generator.common.StringValueMapper
import com.here.genium.model.java.JavaArrayType
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaEnumItem
import com.here.genium.model.java.JavaEnumType
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaReferenceType
import com.here.genium.model.java.JavaReferenceType.Type
import com.here.genium.model.java.JavaTemplateType
import com.here.genium.model.java.JavaType
import com.here.genium.model.java.JavaValue
import org.apache.commons.text.StringEscapeUtils
import org.franca.core.franca.FConstant
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FFloatConstant
import org.franca.core.franca.FInitializerExpression
import org.franca.core.franca.FIntegerConstant
import org.franca.core.franca.FInterface
import org.franca.core.franca.FQualifiedElementRef
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FUnaryOperation
import java.math.BigInteger

object JavaValueMapper {
    private val FLOAT_NAN = JavaValue("Float.NaN", true)
    private val FLOAT_INFINITY = JavaValue("Float.POSITIVE_INFINITY", true)
    private val FLOAT_NEGATIVE_INFINITY = JavaValue("Float.NEGATIVE_INFINITY", true)
    private val DOUBLE_NAN = JavaValue("Double.NaN", true)
    private val DOUBLE_INFINITY = JavaValue("Double.POSITIVE_INFINITY", true)
    private val DOUBLE_NEGATIVE_INFINITY = JavaValue("Double.NEGATIVE_INFINITY", true)

    fun completePartialEnumeratorValues(javaEnumItems: List<JavaEnumItem>) {
        var lastValue = 0
        for (e in javaEnumItems) {
            if (e.value == null) {
                e.value = JavaValue(lastValue.toString())
            } else {
                lastValue = Integer.parseInt(e.value.name)
            }
            lastValue++
        }
    }

    fun map(francaExpression: FInitializerExpression): JavaValue? {
        when (francaExpression) {
            is FConstant, is FUnaryOperation -> {
                val stringValue = StringValueMapper.map(francaExpression) ?: return null

                val suffix = when {
                    francaExpression is FFloatConstant -> "f"
                    francaExpression is FIntegerConstant &&
                            !fitsIntoInteger(francaExpression.getVal()) -> "L"
                    else -> ""
                }

                return JavaValue(stringValue + suffix)
            }
            is FQualifiedElementRef -> return map(francaExpression)
            else -> return null
        }
    }

    private fun map(francaElementRef: FQualifiedElementRef): JavaValue? {
        val value = francaElementRef.element as? FEnumerator ?: return null

        val names = mutableListOf(
            JavaNameRules.getClassName((value.eContainer() as FEnumerationType).name),
            JavaNameRules.getConstantName(value.name))
        val typeCollection = value.eContainer().eContainer() as FTypeCollection
        if (typeCollection is FInterface) {
            names.add(0, JavaNameRules.getClassName(typeCollection.getName()))
        }

        return JavaValue(names.joinToString("."))
    }

    fun mapDefaultValue(javaType: JavaType, deploymentDefaultValue: String) =
        when {
            javaType is JavaPrimitiveType -> mapPrimitiveTypeCustomDefaultValue(
                javaType, deploymentDefaultValue
            )
            javaType is JavaReferenceType && javaType.type == JavaReferenceType.Type.STRING ->
                JavaValue(
                    "\"" + StringEscapeUtils.escapeJava(deploymentDefaultValue) + "\"", true
                )
            javaType is JavaEnumType -> JavaValue(
                javaType.name + "." + JavaNameRules.getConstantName(deploymentDefaultValue),
                true
            )
            else -> JavaValue(deploymentDefaultValue, true)
        }

    fun mapDefaultValue(javaType: JavaType) =
        when {
            javaType is JavaTemplateType -> JavaValue(javaType.implementationType)
            javaType is JavaEnumType -> JavaValue(javaType.name + ".values()[0]")
            javaType is JavaCustomType && !javaType.isInterface -> JavaValue(javaType)
            javaType is JavaReferenceType && javaType.type == Type.STRING -> JavaValue("\"\"")
            javaType == JavaPrimitiveType.BOOL -> JavaValue("false")
            javaType is JavaPrimitiveType -> JavaValue(decorateLiteralValue(javaType, "0"))
            javaType is JavaArrayType -> JavaValue("new " + javaType.type.value + "[0]")
            else -> mapNullValue(javaType)
        }

    fun mapNullValue(javaType: JavaType) = JavaValue("(" + javaType.name + ")null")

    private fun fitsIntoInteger(bigInteger: BigInteger): Boolean {
        val longValue = bigInteger.toLong()
        return longValue <= Integer.MAX_VALUE && longValue >= Integer.MIN_VALUE
    }

    private fun decorateLiteralValue(javaType: JavaPrimitiveType, defaultValue: String): String {
        val literal = StringBuilder()

        when (javaType) {
            JavaPrimitiveType.BYTE -> literal.append("(byte)")
            JavaPrimitiveType.SHORT -> literal.append("(short)")
        }
        literal.append(defaultValue)
        when (javaType) {
            JavaPrimitiveType.FLOAT -> literal.append('f')
            JavaPrimitiveType.LONG -> literal.append('L')
        }

        return literal.toString()
    }

    private fun mapPrimitiveTypeCustomDefaultValue(
        javaType: JavaPrimitiveType,
        deploymentDefaultValue: String
    ): JavaValue {

        if (JavaPrimitiveType.FLOAT == javaType) {
            val parsedFloat = java.lang.Float.parseFloat(deploymentDefaultValue)
            when {
                parsedFloat.isNaN() -> return FLOAT_NAN
                parsedFloat.isInfinite() ->
                    return if (parsedFloat > 0) FLOAT_INFINITY else FLOAT_NEGATIVE_INFINITY
            }
        } else if (JavaPrimitiveType.DOUBLE == javaType) {
            val parsedDouble = java.lang.Double.parseDouble(deploymentDefaultValue)
            when {
                parsedDouble.isNaN() -> return DOUBLE_NAN
                parsedDouble.isInfinite() ->
                    return if (parsedDouble > 0) DOUBLE_INFINITY else DOUBLE_NEGATIVE_INFINITY
            }
        }

        return JavaValue(decorateLiteralValue(javaType, deploymentDefaultValue), true)
    }
}
