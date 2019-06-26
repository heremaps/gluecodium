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
import org.franca.core.franca.FCompoundInitializer
import org.franca.core.franca.FConstant
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FEvaluableElement
import org.franca.core.franca.FModel
import org.franca.core.franca.FOperation
import org.franca.core.franca.FQualifiedElementRef
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FUnaryOperation
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class ExpressionValidatorPredicateTest {
    @MockK
    private lateinit var fModel: FModel

    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaEnumerationType: FEnumerationType
    @MockK
    private lateinit var francaEnumerator: FEnumerator
    @MockK
    private lateinit var francaConstantDef: FConstantDef
    @MockK
    private lateinit var francaConstantExpression: FConstant
    @MockK
    private lateinit var francaOperation: FOperation
    @MockK
    private lateinit var francaElementRef: FQualifiedElementRef
    @MockK
    private lateinit var francaUnaryOperation: FUnaryOperation
    @MockK
    private lateinit var francaEvaluableElement: FEvaluableElement
    @MockK
    private lateinit var francaCompoundInitializer: FCompoundInitializer

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = ExpressionValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { fModel.name } returns ""
        every { francaTypeCollection.name } returns ""
        every { francaEnumerationType.name } returns ""
        every { francaEnumerator.name } returns ""
        every { francaConstantDef.name } returns ""

        every { francaTypeCollection.eContainer() } returns fModel
        every { francaEnumerationType.eContainer() } returns francaTypeCollection
        every { francaEnumerator.eContainer() } returns francaEnumerationType
        every { francaConstantDef.eContainer() } returns francaTypeCollection
        every { francaElementRef.eContainer() } returns francaTypeCollection
    }

    @Test
    fun validateWithConstantExpression() {
        assertNull(validatorPredicate.validate(deploymentModel, francaConstantExpression))
    }

    @Test
    fun validateWithNonConstantExpressionInEnumerator() {
        every { francaOperation.eContainer() } returns francaEnumerator

        assertNotNull(validatorPredicate.validate(deploymentModel, francaOperation))
    }

    @Test
    fun validateWithNonConstantExpressionInConstant() {
        every { francaOperation.eContainer() } returns francaConstantDef
        assertNotNull(validatorPredicate.validate(deploymentModel, francaOperation))
    }

    @Test
    fun validateWithEnumeratorReferenceExpression() {
        every { francaElementRef.element } returns francaEnumerator

        assertNull(validatorPredicate.validate(deploymentModel, francaElementRef))
    }

    @Test
    fun validateWithNonEnumeratorReferenceExpression() {
        every { francaElementRef.element } returns francaEvaluableElement

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElementRef))
    }

    @Test
    fun validateWithUnaryOperationExpression() {
        assertNull(validatorPredicate.validate(deploymentModel, francaUnaryOperation))
    }

    @Test
    fun validateWithCompoundInitializer() {
        val result = validatorPredicate.validate(deploymentModel, francaCompoundInitializer)

        assertNull(result)
    }
}
