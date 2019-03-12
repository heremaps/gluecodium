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

import org.franca.core.franca.FConstant
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
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
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations
import org.franca.core.franca.FEvaluableElement

@RunWith(JUnit4::class)
class ExpressionValidatorPredicateTest {
    @Mock
    private lateinit var fModel: FModel

    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaEnumerationType: FEnumerationType
    @Mock
    private lateinit var francaEnumerator: FEnumerator
    @Mock
    private lateinit var francaConstantDef: FConstantDef
    @Mock
    private lateinit var francaConstantExpression: FConstant
    @Mock
    private lateinit var francaCompoundExpression: FOperation
    @Mock
    private lateinit var francaElementRef: FQualifiedElementRef
    @Mock
    private lateinit var francaUnaryOperation: FUnaryOperation
    @Mock
    private lateinit var francaEvaluableElement: FEvaluableElement

    private val validatorPredicate = ExpressionValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(fModel.name).thenReturn("")
        `when`(francaTypeCollection.name).thenReturn("")
        `when`(francaEnumerationType.name).thenReturn("")
        `when`(francaEnumerator.name).thenReturn("")
        `when`(francaConstantDef.name).thenReturn("")

        `when`(francaTypeCollection.eContainer()).thenReturn(fModel)
        `when`(francaEnumerationType.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaEnumerator.eContainer()).thenReturn(francaEnumerationType)
        `when`(francaConstantDef.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaElementRef.eContainer()).thenReturn(francaTypeCollection)
    }

    @Test
    fun validateWithConstantExpression() {
        assertNull(validatorPredicate.validate(null, francaConstantExpression))
    }

    @Test
    fun validateWithNonConstantExpressionInEnumerator() {
        `when`(francaCompoundExpression.eContainer()).thenReturn(francaEnumerator)

        assertNotNull(validatorPredicate.validate(null, francaCompoundExpression))
    }

    @Test
    fun validateWithNonConstantExpressionInConstant() {
        `when`(francaCompoundExpression.eContainer()).thenReturn(francaConstantDef)

        assertNotNull(validatorPredicate.validate(null, francaCompoundExpression))
    }

    @Test
    fun validateWithEnumeratorReferenceExpression() {
        `when`(francaElementRef.element).thenReturn(francaEnumerator)

        assertNull(validatorPredicate.validate(null, francaElementRef))
    }

    @Test
    fun validateWithNonEnumeratorReferenceExpression() {
        `when`(francaElementRef.element).thenReturn(francaEvaluableElement)

        assertNotNull(validatorPredicate.validate(null, francaElementRef))
    }

    @Test
    fun validateWithUnaryOperationExpression() {
        assertNull(validatorPredicate.validate(null, francaUnaryOperation))
    }
}
