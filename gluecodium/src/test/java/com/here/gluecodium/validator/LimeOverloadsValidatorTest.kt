/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeOverloadsValidatorTest(
    private val limeMethod1: LimeFunction,
    private val limeMethod2: LimeFunction,
    private val expectedResult: Boolean
) {
    private val allElements = mutableMapOf<String, LimeElement>()

    private val validator = LimeOverloadsValidator(LimeSignatureResolver(allElements), mockk(relaxed = true))

    @Test
    fun validateInContainer() {
        allElements[limeMethod1.path.toString()] = limeMethod1
        allElements[limeMethod2.path.toString()] = limeMethod2
        allElements[fooPath.toString()] =
            LimeClass(fooPath, functions = listOf(limeMethod1, limeMethod2))

        assertEquals(expectedResult, validator.validate(allElements.values))
    }

    @Test
    fun validateInStruct() {
        allElements[limeMethod1.path.toString()] = limeMethod1
        allElements[limeMethod2.path.toString()] = limeMethod2
        allElements[fooPath.toString()] =
            LimeStruct(fooPath, functions = listOf(limeMethod1, limeMethod2))

        assertEquals(expectedResult, validator.validate(allElements.values))
    }

    companion object {
        private val fooPath = LimePath(emptyList(), listOf("foo"))
        private val barPath = fooPath.child("bar")
        private val bazPath = fooPath.child("baz")
        private val limeParameter = LimeParameter(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)

        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf(
                LimeFunction(barPath.withSuffix("0")),
                LimeFunction(barPath.withSuffix("1"), parameters = listOf(limeParameter)),
                true
            ),
            arrayOf(
                LimeFunction(barPath.withSuffix("0"), parameters = listOf(limeParameter)),
                LimeFunction(barPath.withSuffix("1"), parameters = listOf(limeParameter)),
                false
            ),
            arrayOf(
                LimeFunction(barPath, isConstructor = true),
                LimeFunction(bazPath, isConstructor = true, parameters = listOf(limeParameter)),
                true
            ),
            arrayOf(
                LimeFunction(barPath, isConstructor = true, parameters = listOf(limeParameter)),
                LimeFunction(bazPath, isConstructor = true, parameters = listOf(limeParameter)),
                false
            )
        )
    }
}
