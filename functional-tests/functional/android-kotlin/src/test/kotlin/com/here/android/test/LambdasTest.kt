/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class LambdasTest {

    @org.junit.Test
    fun callCppLambdaInJava() {
        val result: String = Lambdas.getConcatenator(">.<").apply("foo", "bar")

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun callJavaLambdaInCpp() {
        val delimiter: String = ">.<"
        val result: String =
            Lambdas.concatenate("foo", "bar", { s1: String, s2: String -> s1 + delimiter + s2 })

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun capturingRoundtrip() {
        val concatenator: Lambdas.Concatenator = Lambdas.Concatenator { s1: String, s2: String -> s1 + s2 }
        val tricatenator: Lambdas.Tricatenator = Lambdas.composeConcatenators(concatenator, concatenator)
        val result: String = tricatenator.apply("foo", ">.<", "bar")

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun callConcatenateList() {
        val strings: List<String> = listOf<String>("foo", ">.<", "bar")
        val concatenator: Lambdas.Concatenator = Lambdas.Concatenator { s1: String, s2: String -> s1 + s2 }
        val concatenators = listOf(concatenator, concatenator)
        val result: String = Lambdas.concatenateList(strings, concatenators)

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun callCppLambdaInStructInJava() {
        val result: String = Lambdas.getConcatenatorInStruct(">.<").concatenator.apply("foo", "bar")

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun callJavaLambdaInStructInCpp() {
        val delimiter: String = ">.<"
        val holder: Lambdas.LambdaHolder =
            Lambdas.LambdaHolder({ s1: String, s2: String -> s1 + delimiter + s2 })
        val result: String = Lambdas.concatenateInStruct("foo", "bar", holder)

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun callNullableCppLambdaInJava() {
        val result: String? = Lambdas.getConcatenatorOrNull(">.<")?.apply("foo", "bar")

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun getNullCppLambdaInJava() {
        val result: Lambdas.Concatenator? = Lambdas.getConcatenatorOrNull(null)

        assertNull(result)
    }

    @org.junit.Test
    fun callNullableJavaLambdaInCpp() {
        val delimiter: String = ">.<"
        val result: String? =
            Lambdas.concatenateOrNot("foo", "bar", { s1: String, s2: String -> s1 + delimiter + s2 })

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun callNullableJavaLambdaInCppWithNull() {
        val result: String? = Lambdas.concatenateOrNot("foo", "bar", null)

        assertNull(result)
    }

    @org.junit.Test
    fun setGetLambdaProperty() {
        Lambdas.setRealConcatenator(Lambdas.getConcatenator(">.<"))
        val result: String = Lambdas.getRealConcatenator().apply("foo", "bar")

        assertEquals("foo>.<bar", result)
    }

    @org.junit.Test
    fun callCppNullableLambdaInJavaWithValue() {
        val result: StandaloneProducer? = Lambdas.getNullableConfuser().confuse("foo")

        assertEquals("foo", result?.apply())
    }

    @org.junit.Test
    fun callCppNullableLambdaInJavaWithNull() {
        val result: StandaloneProducer? = Lambdas.getNullableConfuser().confuse(null)

        assertNull(result)
    }

    @org.junit.Test
    fun callJavaNullableLambdaInCppWithValue() {
        val confuser: Lambdas.NullableConfounder = Lambdas.NullableConfounder { s1: String? ->
            if (s1 != null) {
                StandaloneProducer { s1 }
            } else null
        }
        val result: StandaloneProducer? = Lambdas.applyNullableConfuser(confuser, "foo")

        assertEquals("foo", result?.apply())
    }

    @org.junit.Test
    fun callJavaNullableLambdaInCppWithNull() {
        val confuser: Lambdas.NullableConfounder = Lambdas.NullableConfounder { s1: String? ->
            if (s1 != null) {
                StandaloneProducer { s1 }
            } else null
        }
        val result: StandaloneProducer? = Lambdas.applyNullableConfuser(confuser, null)

        assertNull(result)
    }

    @org.junit.Test
    fun callJavaOverloadedLambdaInCpp() {
        val lambda: OverloadedLambda = OverloadedLambda { value: Int -> value.toString() }
        val result: String = CallOverloadedLambda.invokeOverloadedLambda(lambda, 42)

        assertEquals("42", result)
    }

    @org.junit.Test
    fun callJavaLambdaFromCppForLambdaDefinedInStruct() {
        val callback: StructWithLambda.LambdaCallback = StructWithLambda.LambdaCallback { arg: String? -> arg }
        val result: String? = StructWithLambda.invokeCallback(callback)

        assertEquals("some callback argument", result)
    }

}