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

package com.here.genium.validator

import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeMethodsSignatureValidatorTest(
    private val limeMethod1: LimeMethod,
    private val limeMethod2: LimeMethod,
    private val expectedResult: Boolean
) {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeMethodsSignatureValidator(mockk(relaxed = true))

    @Test
    fun validateInContainer() {
        allElements[limeMethod1.path.toString()] = limeMethod1
        allElements[limeMethod2.path.toString()] = limeMethod2
        allElements[fooPath.toString()] = LimeContainer(
            fooPath,
            type = LimeContainer.ContainerType.CLASS,
            methods = listOf(limeMethod1, limeMethod2)
        )

        assertEquals(expectedResult, validator.validate(limeModel))
    }

    @Test
    fun validateInStruct() {
        allElements[limeMethod1.path.toString()] = limeMethod1
        allElements[limeMethod2.path.toString()] = limeMethod2
        allElements[fooPath.toString()] =
            LimeStruct(fooPath, methods = listOf(limeMethod1, limeMethod2))

        assertEquals(expectedResult, validator.validate(limeModel))
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
                LimeMethod(barPath.withSuffix("0")),
                LimeMethod(barPath.withSuffix("1"), parameters = listOf(limeParameter)),
                true
            ),
            arrayOf(
                LimeMethod(barPath.withSuffix("0"), parameters = listOf(limeParameter)),
                LimeMethod(barPath.withSuffix("1"), parameters = listOf(limeParameter)),
                false
            ),
            arrayOf(
                LimeMethod(barPath, isConstructor = true),
                LimeMethod(bazPath, isConstructor = true, parameters = listOf(limeParameter)),
                true
            ),
            arrayOf(
                LimeMethod(barPath, isConstructor = true, parameters = listOf(limeParameter)),
                LimeMethod(bazPath, isConstructor = true, parameters = listOf(limeParameter)),
                false
            )
        )
    }
}
