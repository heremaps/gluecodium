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

import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.MockContextStack
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FInitializerExpression
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class AbstractModelBuilderTest {

    private val resultObject = Any()

    private val contextStack = MockContextStack<Any>()
    private val modelBuilder = TestableModelBuilder(contextStack)

    private class TestableModelBuilder(contextStack: ModelBuilderContextStack<Any>) :
        AbstractModelBuilder<Any>(contextStack) {

        override fun finishBuilding(francaInterface: FInterface) {}
        override fun finishBuilding(francaTypeCollection: FTypeCollection) {}
        override fun finishBuilding(francaMethod: FMethod) {}
        override fun finishBuildingInputArgument(francaArgument: FArgument) {}
        override fun finishBuildingOutputArgument(francaArgument: FArgument) {}
        override fun finishBuilding(francaTypeRef: FTypeRef) {}
        override fun finishBuilding(francaConstant: FConstantDef) {}
        override fun finishBuilding(francaField: FField) {}
        override fun finishBuilding(francaStructType: FStructType) {}
        override fun finishBuilding(francaTypeDef: FTypeDef) {}
        override fun finishBuilding(francaArrayType: FArrayType) {}
        override fun finishBuilding(francaMapType: FMapType) {}
        override fun finishBuilding(francaEnumerationType: FEnumerationType) {}
        override fun finishBuilding(francaEnumerator: FEnumerator) {}
        override fun finishBuilding(francaExpression: FInitializerExpression) {}
        override fun finishBuilding(francaAttribute: FAttribute) {}
    }

    @Test
    fun closeContextPropagatesResults() {
        contextStack.currentContext.currentResults.add(resultObject)

        modelBuilder.closeContext()

        assertContains(resultObject, contextStack.parentContext.previousResults)
    }

    @Test
    fun closeContextAppendsResults() {
        val anotherResultObject = Any()
        contextStack.currentContext.currentResults.add(anotherResultObject)
        contextStack.parentContext.previousResults.add(resultObject)

        modelBuilder.closeContext()

        assertContains(resultObject, contextStack.parentContext.previousResults)
        assertContains(anotherResultObject, contextStack.parentContext.previousResults)
    }
}
