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

package com.here.genium.test

import com.here.genium.generator.common.modelbuilder.ModelBuilderContext
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack

class MockContextStack<E> : ModelBuilderContextStack<E>() {
    override val currentContext = ModelBuilderContext<E>()
    override val parentContext = ModelBuilderContext<E>()

    override fun openContext() {
        // Do nothing
    }

    override fun closeContext() {
        // Do nothing
    }

    fun injectResult(element: E) {
        currentContext.previousResults.add(element)
    }

    fun injectParentResult(element: E) {
        parentContext.previousResults.add(element)
    }

    fun injectCurrentResult(element: E) {
        currentContext.currentResults.add(element)
    }

    fun injectParentCurrentResult(element: E) {
        parentContext.currentResults.add(element)
    }
}
