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
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class SpecialTypeRulesTest {
    @Mock
    private lateinit var francaTypeDef: FTypeDef
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var derivedType: FType
    @Mock
    private lateinit var typeCollection: FTypeCollection
    @Mock
    private lateinit var francaModel: FModel

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaTypeDef.actualType).thenReturn(francaTypeRef)
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.UNDEFINED)

        `when`(francaTypeDef.name).thenReturn("")
        `when`(derivedType.name).thenReturn("")
        `when`(typeCollection.name).thenReturn("MyClass")
        `when`(francaModel.name).thenReturn("")

        `when`(francaTypeDef.eContainer()).thenReturn(typeCollection)
        `when`(derivedType.eContainer()).thenReturn(typeCollection)
        `when`(typeCollection.eContainer()).thenReturn(francaModel)
    }

    @Test
    fun checkDerived() {
        `when`(francaTypeRef.derived).thenReturn(derivedType)

        assertFalse(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkUndefined() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.INT32)

        assertFalse(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkTypedefWithDifferentNameThanClass() {
        `when`(francaTypeDef.name).thenReturn("NotMyClass")

        assertFalse(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkTypedefWithSameNameAsClass() {
        `when`(francaTypeDef.name).thenReturn("MyClass")

        assertTrue(SpecialTypeRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkDateType() {
        `when`(francaTypeRef.derived).thenReturn(derivedType)
        `when`(derivedType.name).thenReturn("Date")
        `when`(typeCollection.name).thenReturn("Extensions")
        `when`(francaModel.name).thenReturn("genium")

        val result = SpecialTypeRules.isDateType(francaTypeRef)

        assertTrue(result)
    }
}
