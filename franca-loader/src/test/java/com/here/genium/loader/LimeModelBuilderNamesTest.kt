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

package com.here.genium.loader

import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.test.ArrayEList
import com.here.genium.test.AssertHelpers.assertAttributeEquals
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.franca.core.franca.FAnnotation
import org.franca.core.franca.FAnnotationBlock
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeModelBuilderNamesTest(
    private val francaElement: FModelElement,
    private val finishBuilding: LimeModelBuilder.(FModelElement) -> Unit,
    private val childElement: LimeElement?
) {
    @MockK private lateinit var parentContainer: FInterface
    @MockK private lateinit var francaAnnotation: FAnnotationBlock

    private val contextStack = MockContextStack<LimeElement>()
    @MockK private lateinit var deploymentModel: FrancaDeploymentModel
    private val referenceResolver = LimeReferenceResolver()
    @MockK private lateinit var companionHelper: FrancaCompanionHelper

    private lateinit var modelBuilder: LimeModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        modelBuilder = LimeModelBuilder(
            contextStack,
            deploymentModel,
            referenceResolver,
            companionHelper,
            emptySet()
        )

        every { parentContainer.name } returns "the.model"
        every { francaAnnotation.elements } returns ArrayEList<FAnnotation>()

        every { francaElement.name } returns "SomeElement"
        every { francaElement.eContainer() } returns parentContainer
        every { francaElement.comment } returns francaAnnotation

        every { deploymentModel.getCppName(francaElement) } returns "foo"
        every { deploymentModel.getJavaName(francaElement) } returns "bar"
        every { deploymentModel.getSwiftName(francaElement) } returns "baz"
    }

    @Test
    fun test() {
        childElement?.let { contextStack.injectResult(it) }

        modelBuilder.finishBuilding(francaElement)

        val result = modelBuilder.getFinalResult(LimeNamedElement::class.java)
        assertAttributeEquals("foo", LimeAttributeType.CPP_NAME, result)
        assertAttributeEquals("bar", LimeAttributeType.JAVA_NAME, result)
        assertAttributeEquals("baz", LimeAttributeType.SWIFT_NAME, result)
    }

    companion object {
        private fun <T : FModelElement> createTestData(
            francaElement: T,
            finishBuilding: LimeModelBuilder.(T) -> Unit,
            childElement: LimeElement? = null
        ) = arrayOf(francaElement, finishBuilding, childElement)

        @JvmStatic
        @Parameterized.Parameters
        fun data() = listOf(
            createTestData(mockk<FTypeCollection>(), LimeModelBuilder::finishBuilding),
            createTestData(mockk<FInterface>(), LimeModelBuilder::finishBuilding),
            createTestData(mockk<FStructType>(), LimeModelBuilder::finishBuilding),
            createTestData(
                mockk<FField>(relaxed = true),
                LimeModelBuilder::finishBuilding,
                LimeBasicTypeRef.DOUBLE
            ),
            createTestData(mockk<FEnumerationType>(), LimeModelBuilder::finishBuilding),
            createTestData(mockk<FEnumerator>(), LimeModelBuilder::finishBuilding),
            createTestData(
                mockk<FTypeDef>(relaxed = true),
                LimeModelBuilder::finishBuilding,
                LimeBasicTypeRef.DOUBLE
            ),
            createTestData(
                mockk<FArrayType>(),
                LimeModelBuilder::finishBuilding,
                LimeBasicTypeRef.DOUBLE
            ),
            createTestData(mockk<FMethod>(relaxed = true), LimeModelBuilder::finishBuilding),
            createTestData(
                mockk(relaxed = true),
                LimeModelBuilder::finishBuildingInputArgument,
                LimeBasicTypeRef.DOUBLE
            )
        )
    }
}
