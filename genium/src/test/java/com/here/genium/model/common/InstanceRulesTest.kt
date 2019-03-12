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

package com.here.genium.model.common

import com.here.genium.model.franca.DefinedBy
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations
import org.powermock.api.mockito.PowerMockito
import org.powermock.api.mockito.PowerMockito.verifyStatic
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner

@RunWith(PowerMockRunner::class)
@PrepareForTest(DefinedBy::class)
class InstanceRulesTest {
    @Mock
    private lateinit var francaTypeDef: FTypeDef
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var derivedType: FType
    @Mock
    private lateinit var typeCollection: FTypeCollection

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        PowerMockito.mockStatic(DefinedBy::class.java)

        `when`(francaTypeDef.actualType).thenReturn(francaTypeRef)
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.UNDEFINED)

        `when`(DefinedBy.findDefiningTypeCollection(any(FModelElement::class.java))).thenReturn(
            typeCollection
        )
        `when`(typeCollection.name).thenReturn(CLASS_NAME)
    }

    @Test
    fun checkDerived() {
        `when`(francaTypeRef.derived).thenReturn(derivedType)

        assertFalse(InstanceRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkUndefined() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.INT32)

        assertFalse(InstanceRules.isInstanceId(francaTypeDef))
    }

    @Test
    fun checkTypedefWithDifferentNameThanClass() {
        `when`(francaTypeDef.name).thenReturn("Not$CLASS_NAME")

        assertFalse(InstanceRules.isInstanceId(francaTypeDef))

        verifyStatic()
        DefinedBy.findDefiningTypeCollection(francaTypeDef)
    }

    @Test
    fun checkTypedefWithSameNameAsClass() {
        `when`(francaTypeDef.name).thenReturn(CLASS_NAME)

        assertTrue(InstanceRules.isInstanceId(francaTypeDef))

        verifyStatic()
        DefinedBy.findDefiningTypeCollection(francaTypeDef)
    }

    companion object {
        private const val CLASS_NAME = "MyClass"
    }
}
