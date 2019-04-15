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

package com.here.genium.generator.common.modelbuilder

import com.here.genium.common.ModelBuilderContext
import com.here.genium.common.ModelBuilderContextStack
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeValue

abstract class AbstractLimeBasedModelBuilder<E> protected constructor(
    private val contextStack: ModelBuilderContextStack<E>
) : LimeBasedModelBuilder {

    private var resultContext: ModelBuilderContext<E>? = null

    /**
     * Get final results of the model builder execution. Intended to be called by clients of the
     * model builder but not within the model builder itself.
     *
     * @return A list of results
     */
    val finalResults: List<E>
        get() = resultContext?.currentResults ?: emptyList()

    private val previousResults: List<E>
        get() = currentContext.previousResults

    protected val currentContext: ModelBuilderContext<E>
        get() = contextStack.currentContext

    protected val parentContext: ModelBuilderContext<E>?
        get() = contextStack.parentContext

    override fun startBuilding(limeElement: LimeElement) = openContext()
    override fun startBuilding(limeContainer: LimeContainer) = openContext()

    override fun finishBuilding(limeTypeDef: LimeTypeDef) = closeContext()
    override fun finishBuilding(limeEnumerator: LimeEnumerator) = closeContext()
    override fun finishBuilding(limeConstant: LimeConstant) = closeContext()
    override fun finishBuilding(limeValue: LimeValue) = closeContext()

    /**
     * Get the first item of the given type from the list of final results of the model builder
     * execution. Intended to be called by clients of the model builder but not within the model
     * builder itself.
     *
     * @param clazz Class object representing the type of the result to get
     * @return A result item
     */
    fun <T : E> getFinalResult(clazz: Class<T>) = finalResults.filterIsInstance(clazz).first()

    /**
     * Get the first item of the given type from the list of results of the previous ("child") step
     * of model builder execution.
     *
     * @param clazz Class object representing the type of the result to get
     * @return A result item
     */
    protected fun <T : E> getPreviousResult(clazz: Class<T>) =
        previousResults.filterIsInstance(clazz).first()

    /**
     * Get the first item of the given type from the list of results of the previous ("child") step
     * of model builder execution.
     *
     * @param clazz Class object representing the type of the result to get
     * @return A result item or `null` if there are none
     */
    protected fun <T : E> getPreviousResultOrNull(clazz: Class<T>) =
        previousResults.filterIsInstance(clazz).firstOrNull()

    /**
     * Get the all items of the given type from the list of results of the previous ("child") step
     * of model builder execution.
     *
     * @param clazz Class object representing the type of the result to get
     * @return A list of items
     */
    protected fun <T : E> getPreviousResults(clazz: Class<T>) =
        previousResults.filterIsInstance(clazz)

    protected fun openContext() = contextStack.openContext()

    protected fun closeContext() {
        resultContext = contextStack.currentContext
        contextStack.parentContext?.previousResults?.addAll(finalResults)
        contextStack.closeContext()
    }

    protected fun storeResult(element: E) =
        contextStack.currentContext.currentResults.add(element)
}
