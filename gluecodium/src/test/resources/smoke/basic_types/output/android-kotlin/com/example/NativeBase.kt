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

package com.example;

import java.lang.ref.PhantomReference;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.Collections;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * <p>Internal base class for public non-POD objects to manage the lifecycle of underlying C++ objects.
 * While the class is public for technical reasons, but should be considered <b>internal</b> and not
 * part of the public API and thus not used directly.
 *
 * <p>Kotlin classes which wrap C++ objects inherit from NativeBase to
 * <ol>
 * <li>reference the C++ object</li>
 * <li>manage the lifecycle of C++ object</li>
 * </ol>
 *
 * <p>Cleanup of C++ objects is done automatically as long as there are new subclasses of NativeBase
 * created. Currently there is no explicit way to destroy the underlying C++ object of a Kotlin
 * wrapper. This is intentional because normally no manual cleanup is necessary. Additionally the
 * client of the Kotlin wrapper would need additional knowledge of the underlying implementation to
 * be able to decide whether or not cleanup is necessary. It is not clear for the client which
 * object needs cleanup and which doesn't if all objects have auto-generated cleanup functions.
 * So instead API designers should manually define methods if resource cleanup is necessary.
 */
public abstract class NativeBase {
    private val nativeHandle: Long

    constructor(nativeHandle: Long, disposer: (Long) -> Unit) {
        this.nativeHandle = nativeHandle
        REFERENCES.add(DisposableReference(this, nativeHandle, disposer));
    }

    private class DisposableReference: PhantomReference<NativeBase> {
        private val nativePointer: Long
        private val disposer: (Long) -> Unit

        constructor(disposable: NativeBase, nativePointer: Long, disposer: (Long) -> Unit) : super(disposable, REFERENCE_QUEUE) {
            this.nativePointer = nativePointer
            this.disposer = disposer

            cleanUpQueue();
        }

        fun dispose() {
            REFERENCES.remove(this);
            disposer(nativePointer);
        }
    }

    companion object {
        @JvmField public var propagateCleanupException: Boolean = false
        private val LOGGER = Logger.getLogger(NativeBase::class.java.name);

        // The set is to keep DisposableReference itself from being garbage-collected.
        // The set is backed by ConcurrentHashMap to make it thread-safe.
        private val REFERENCES: MutableSet<Reference<*>> =
            Collections.newSetFromMap(ConcurrentHashMap<Reference<*>, Boolean>());

        private val REFERENCE_QUEUE = ReferenceQueue<NativeBase>();

        @JvmStatic
        private fun cleanUpQueue() {
            var reference: Reference<*>? = REFERENCE_QUEUE.poll()

            while (reference != null) {
                reference.clear()

                try {
                    (reference as DisposableReference).dispose()
                } catch (t: Throwable) {
                    LOGGER.log(Level.SEVERE, "Error cleaning up after reference.", t);

                    if (propagateCleanupException) {
                        throw t
                    }
                }

                reference = REFERENCE_QUEUE.poll()
            }
        }
    }
}