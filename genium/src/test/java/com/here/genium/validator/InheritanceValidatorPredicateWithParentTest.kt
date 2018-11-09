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

import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations
import java.util.Arrays

@RunWith(Parameterized::class)
class InheritanceValidatorPredicateWithParentTest(
    private val firstInterfaceIsInterface: Boolean,
    private val firstInterfaceIsObjc: Boolean,
    private val secondInterfaceIsInterface: Boolean,
    private val secondInterfaceIsObjc: Boolean,
    private val expectedNull: Boolean
) {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var francaInterface2: FInterface

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = InheritanceValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("")
        `when`(francaInterface.name).thenReturn("")
        `when`(francaInterface2.name).thenReturn("")

        `when`(francaInterface.eContainer()).thenReturn(francaModel)
        `when`(francaInterface2.eContainer()).thenReturn(francaModel)

        `when`(francaInterface.base).thenReturn(francaInterface2)
    }

    @Test
    fun test() {
        `when`(deploymentModel.isInterface(francaInterface)).thenReturn(firstInterfaceIsInterface)
        `when`(deploymentModel.isObjcInterface(francaInterface)).thenReturn(firstInterfaceIsObjc)
        `when`(deploymentModel.isInterface(francaInterface2)).thenReturn(secondInterfaceIsInterface)
        `when`(deploymentModel.isObjcInterface(francaInterface2)).thenReturn(secondInterfaceIsObjc)

        assertEquals(
            expectedNull, validatorPredicate.validate(deploymentModel, francaInterface) == null
        )
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun data() = Arrays.asList(
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
