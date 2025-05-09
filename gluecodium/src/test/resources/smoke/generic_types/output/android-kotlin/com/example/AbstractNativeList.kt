/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.example

/**
 * <p>Internal base abstract class for List implementations backed by a native object.
 *
 * @suppress
 */
abstract class AbstractNativeList<T> : NativeBase, MutableList<T> {

    private inner class NativeIterator : MutableListIterator<T> {
        private var index: Int = 0

        override public fun hasNext(): Boolean = (index < size)

        override public fun next(): T {
            if (!hasNext()) {
                throw NoSuchElementException()
            }

            val result: T = get(index)
            index += 1
            return result
        }

        override public fun hasPrevious(): Boolean = (index >= 0)

        override public fun previous(): T {
            if (!hasPrevious()) {
                throw NoSuchElementException()
            }

            val result: T = get(index)
            index -= 1
            return result
        }

        override public fun nextIndex(): Int = (index + 1)

        override public fun previousIndex(): Int = (index - 1)

        override public fun remove() { throw UnsupportedOperationException() }

        override public fun `set`(element: T) { throw UnsupportedOperationException() }

        override public fun add(element: T) { throw UnsupportedOperationException() }
    }

    private var _size: Int? = null

    protected constructor(nativeHandle: Long, disposer: (Long) -> Unit)
        : super(nativeHandle, disposer) {}

    protected abstract fun obtainSize(): Int

    private fun toArrayList(): MutableList<Any?> {
        var result = arrayListOf<Any?>()
        for (element in this) {
            result.add(element)
        }
        return result
    }

    override public val size: Int
        get() {
            if (_size == null) {
                _size = obtainSize()
            }
            return _size!!
        }

    override public fun isEmpty(): Boolean = (size == 0)

    override public fun contains(element: T): Boolean = (toArrayList().contains(element))

    override public fun iterator(): MutableIterator<T> = listIterator(0)

    override public fun add(element: T): Boolean { throw UnsupportedOperationException() }

    override public fun remove(element: T): Boolean { throw UnsupportedOperationException() }

    override public fun containsAll(elements: Collection<T>): Boolean { return toArrayList().containsAll(elements) }

    override public fun addAll(elements: Collection<T>): Boolean { throw UnsupportedOperationException() }

    override public fun addAll(index: Int, elements: Collection<T>): Boolean { throw UnsupportedOperationException() }

    override public fun removeAll(elements: Collection<T>): Boolean { throw UnsupportedOperationException() }

    override public fun retainAll(elements: Collection<T>): Boolean { throw UnsupportedOperationException() }

    override public fun clear() { throw UnsupportedOperationException() }

    override public fun set(index: Int, element: T): T { throw UnsupportedOperationException() }

    override public fun add(index: Int, element: T) { throw UnsupportedOperationException() }

    override public fun removeAt(index: Int): T { throw UnsupportedOperationException() }

    override public fun indexOf(element: T): Int { throw UnsupportedOperationException() }

    override public fun lastIndexOf(element: T): Int { throw UnsupportedOperationException() }

    override public fun listIterator(): MutableListIterator<T> { return NativeIterator() }

    override public fun listIterator(index: Int): MutableListIterator<T> {
        var result = listIterator()
        for (i in (0 until index)) {
            if (!result.hasNext()) {
                break
            }
            result.next()
        }
        return result
    }

    override public fun subList(fromIndex: Int, toIndex: Int): MutableList<T> {
        var arrayList = ArrayList<T>()
        for (i in (fromIndex until toIndex)) {
            arrayList.add(get(i))
        }
        return arrayList
    }
}
