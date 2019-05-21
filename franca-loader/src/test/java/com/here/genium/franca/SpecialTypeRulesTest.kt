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

package com.here.genium.franca

import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FModel
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SpecialTypeRulesTest {
    @MockK
    private lateinit var francaTypeDef: FTypeDef
    @MockK
    private lateinit var francaTypeRef: FTypeRef
    @MockK
    private lateinit var derivedType: FType
    @MockK
    private lateinit var typeCollection: FTypeCollection
    @MockK
    private lateinit var francaModel: FModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaTypeDef.actualType } returns francaTypeRef
        every { francaTypeRef.derived } returns null
        every { francaTypeRef.predefined } returns FBasicTypeId.UNDEFINED

        every { francaTypeDef.name } returns ""
        every { derivedType.name } returns ""
        every { typeCollection.name } returns "MyClass"
        every { francaModel.name } returns ""

        every { francaTypeDef.eContainer() } returns typeCollection
        every { derivedType.eContainer() } returns typeCollection
        every { typeCollection.eContainer() } returns francaModel
    }

    @Test
    fun checkDerived() {
        every { francaTypeRef.derived } returns derivedType

        assertFalse(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkUndefined() {
        every { francaTypeRef.predefined } returns FBasicTypeId.INT32

        assertFalse(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkTypedefWithDifferentNameThanClass() {
        every { francaTypeDef.name } returns "NotMyClass"

        assertFalse(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkTypedefWithSameNameAsClass() {
        every { francaTypeDef.name } returns "MyClass"

        assertTrue(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkDateType() {
        every { francaTypeRef.derived } returns derivedType
        every { derivedType.name } returns "Date"
        every { typeCollection.name } returns "Extensions"
        every { francaModel.name } returns "genium"

        val result = SpecialTypeRules.isDateType(francaTypeRef)

        assertTrue(result)
    }
}
