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

import java.util.logging.Logger

open class GenericTreeWalker<MB> protected constructor(
    protected val builders: Collection<MB>,
    private val treeInfo: Map<Any, TreeNodeInfo<MB, *>>
) {
    protected class TreeNodeInfo<B, T> internal constructor(
        private val clazz: Class<T>,
        private val startMethod: B.(T) -> Unit,
        private val finishMethod: B.(T) -> Unit,
        private val walkChildNodes: GenericTreeWalker<B>.(T) -> Unit
    ) {
        fun walk(walker: GenericTreeWalker<B>, element: Any) {
            val francaElement = clazz.cast(element)
            walker.builders.forEach { it.startMethod(francaElement) }
            walker.walkChildNodes(francaElement)
            walker.builders.forEach { it.finishMethod(francaElement) }
        }
    }

    private fun walk(key: Any, element: Any?) {
        if (element != null) {
            treeInfo[key]?.walk(this, element)
        }
    }

    protected fun walk(element: Any?) {
        if (element == null) return
        val anInterface = findSupportedClass(element.javaClass)
        if (anInterface != null) {
            treeInfo[anInterface]?.walk(this, element)
        } else {
            val message = element.javaClass.name + " is not supported"
            LOGGER.warning(message)
        }
    }

    protected fun walkCollection(key: Any, collection: Iterable<*>?) {
        collection?.forEach { walk(key, it) }
    }

    protected fun walkCollection(collection: Iterable<*>?) {
        collection?.forEach { walk(it) }
    }

    private fun findSupportedClass(aClass: Class<*>?): Class<*>? {
        if (aClass == null) {
            return null
        }
        if (treeInfo.containsKey(aClass)) {
            return aClass
        }
        for (anInterface in aClass.interfaces) {
            val result = findSupportedClass(anInterface)
            if (result != null) {
                return result
            }
        }
        return findSupportedClass(aClass.superclass)
    }

    companion object {
        private val LOGGER = Logger.getLogger(GenericTreeWalker::class.java.name)
    }
}
