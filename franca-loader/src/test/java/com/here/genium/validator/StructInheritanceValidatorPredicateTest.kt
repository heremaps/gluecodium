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

import com.here.genium.franca.FrancaDeploymentModel
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class StructInheritanceValidatorPredicateTest {
    @MockK
    private lateinit var francaModel: FModel
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaStruct: FStructType
    @MockK
    private lateinit var parentStruct: FStructType

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = StructInheritanceValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns "Foo"
        every { francaTypeCollection.name } returns "Bar"
        every { francaStruct.name } returns "Baz"

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaStruct.eContainer() } returns francaTypeCollection
        every { parentStruct.eContainer() } returns parentStruct

        every { francaStruct.base } returns parentStruct
    }

    @Test
    fun validateWithNoParent() {
        every { francaStruct.base } returns null

        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNull(result)
    }

    @Test
    fun validateWithParent() {
        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNotNull(result)
    }
}
