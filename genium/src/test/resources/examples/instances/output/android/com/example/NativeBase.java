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

package com.example;

import java.lang.ref.PhantomReference;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Base class for public API non-POD objects. While it's public for inheritance purposes, it is
 * considered *internal* and should not itself be a part of the API.
 *
 * Java classes which wrap C++ objects inherit from NativeBase to
 *  1) reference the C++ object
 *  2) manage the lifecycle of C++ object
 *
 * Cleanup of C++ objects is done automatically as long as there are new subclasses of NativeBase
 * created. Currently there is no explicit way to destroy the underlying C++ object of a Java
 * wrapper. This is intentional because normally no manual cleanup is necessary. Additionally the
 * client of the Java wrapper would need additional knowledge of the underlying implementation to
 * be able to decide whether or not cleanup is necessary. It is not clear for the client which
 * object needs cleanup and which doesn't if all objects have auto-generated cleanup functions.
 * So instead API designers should manually define methods if resource cleanup is necessary.
 */
public abstract class NativeBase {

  private static final Logger LOGGER = Logger.getLogger(NativeBase.class.getName());

  // The set is to keep DisposableReference itself from being garbage-collected.
  // The set is backed by ConcurrentHashMap to make it thread-safe.
  private static final Set<Reference<?>> REFERENCES =
      Collections.newSetFromMap(new ConcurrentHashMap<Reference<?>, Boolean>());

  private static final ReferenceQueue<NativeBase> REFERENCE_QUEUE = new ReferenceQueue<>();
  private final long nativeHandle;

  /**
   * This interface is used by subclasses to provide dispose functionality without
   * DisposableReference holding a reference to the instance of the subclass which would prevent
   * garbage collection.
   */
  protected interface Disposer {
    void disposeNative(long handle);
  };

  private static class DisposableReference extends PhantomReference<NativeBase> {
    private final long nativePointer;
    private final Disposer disposer;

    private DisposableReference(
        final NativeBase disposable, final long nativePointer, final Disposer disposer) {
      super(disposable, REFERENCE_QUEUE);
      this.nativePointer = nativePointer;
      this.disposer = disposer;
      cleanUpQueue();
    }

    public void dispose() {
      REFERENCES.remove(this);
      disposer.disposeNative(nativePointer);
    }
  }

  protected NativeBase(final long nativeHandle, final Disposer disposer) {
    this.nativeHandle = nativeHandle;
    REFERENCES.add(new DisposableReference(this, nativeHandle, disposer));
  }

  private static void cleanUpQueue() {
    Reference<?> reference;
    while ((reference = REFERENCE_QUEUE.poll()) != null) {
      reference.clear();
      try {
        ((DisposableReference) reference).dispose();
      } catch (Throwable t) {
        LOGGER.log(Level.SEVERE, "Error cleaning up after reference.", t);
      }
    }
  }
}
