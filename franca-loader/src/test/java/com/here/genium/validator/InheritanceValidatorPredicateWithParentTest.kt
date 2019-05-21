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
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class InheritanceValidatorPredicateWithParentTest(
    private val firstInterfaceIsInterface: Boolean,
    private val firstInterfaceIsObjc: Boolean,
    private val secondInterfaceIsInterface: Boolean,
    private val secondInterfaceIsObjc: Boolean,
    private val expectedNull: Boolean
) {
    @MockK
    private lateinit var francaModel: FModel
    @MockK
    private lateinit var francaInterface: FInterface
    @MockK
    private lateinit var francaInterface2: FInterface

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = InheritanceValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns ""
        every { francaInterface.name } returns ""
        every { francaInterface2.name } returns ""

        every { francaInterface.eContainer() } returns francaModel
        every { francaInterface2.eContainer() } returns francaModel

        every { francaInterface.base } returns francaInterface2
    }

    @Test
    fun test() {
        every { deploymentModel.isInterface(francaInterface) } returns firstInterfaceIsInterface
        every { deploymentModel.isObjcInterface(francaInterface) } returns firstInterfaceIsObjc
        every { deploymentModel.isInterface(francaInterface2) } returns secondInterfaceIsInterface
        every { deploymentModel.isObjcInterface(francaInterface2) } returns secondInterfaceIsObjc

        assertEquals(
            expectedNull, validatorPredicate.validate(deploymentModel, francaInterface) == null
        )
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun data() = listOf(
            arrayOf(false, false, false, false, true),
            arrayOf(true, false, false, false, false),
            arrayOf(false, true, false, false, false),
            arrayOf(false, false, true, false, true),
            arrayOf(false, false, false, true, true),
            arrayOf(true, true, false, false, false),
            arrayOf(true, false, true, false, true),
            arrayOf(true, false, false, true, false),
            arrayOf(false, true, true, false, true),
            arrayOf(false, true, false, true, true),
            arrayOf(false, false, true, true, true),
            arrayOf(true, true, true, false, false),
            arrayOf(true, true, false, true, false),
            arrayOf(true, false, true, true, true),
            arrayOf(false, true, true, true, true),
            arrayOf(true, true, true, true, true)
        )
    }
}
