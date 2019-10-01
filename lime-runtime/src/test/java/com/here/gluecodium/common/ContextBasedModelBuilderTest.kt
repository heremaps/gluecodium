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

package com.here.gluecodium.common

import com.here.gluecodium.test.AssertHelpers.assertContains
import com.here.gluecodium.test.MockContextStack
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class ContextBasedModelBuilderTest {

    private val resultObject = Any()

    private val contextStack = MockContextStack<Any>()
    private val modelBuilder = TestableModelBuilder(contextStack)

    private class TestableModelBuilder(contextStack: ModelBuilderContextStack<Any>) :
        ContextBasedModelBuilder<Any>(contextStack) {

        fun doCloseContext() {
            super.closeContext()
        }
    }

    @Test
    fun closeContextPropagatesResults() {
        contextStack.currentContext.currentResults.add(resultObject)

        modelBuilder.doCloseContext()

        assertContains(resultObject, contextStack.parentContext.previousResults)
    }

    @Test
    fun closeContextAppendsResults() {
        val anotherResultObject = Any()
        contextStack.currentContext.currentResults.add(anotherResultObject)
        contextStack.parentContext.previousResults.add(resultObject)

        modelBuilder.doCloseContext()

        assertContains(resultObject, contextStack.parentContext.previousResults)
        assertContains(anotherResultObject, contextStack.parentContext.previousResults)
    }
}
