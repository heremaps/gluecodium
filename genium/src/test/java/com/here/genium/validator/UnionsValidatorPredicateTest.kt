/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

import org.franca.core.franca.FModel
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FUnionType
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class UnionsValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaUnionType: FUnionType

    private val validatorPredicate = UnionsValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("")
        `when`(francaTypeCollection.name).thenReturn("")
        `when`(francaUnionType.name).thenReturn("")

        `when`(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`(francaUnionType.eContainer()).thenReturn(francaTypeCollection)
    }

    @Test
    fun validateWithUnion() = assertNotNull(validatorPredicate.validate(null, francaUnionType))
}
