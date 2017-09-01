/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api;

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
 */
public abstract class NativeBase {

  private static final Logger LOGGER = Logger.getLogger(NativeBase.class.getName());

  // The set is to keep DisposableReference itself from being garbage-collected.
  // The set is backed by ConcurrentHashMap to make it thread-safe.
  private static final Set<Reference<?>> REFERENCES =
      Collections.newSetFromMap(new ConcurrentHashMap<>());

  private static final ReferenceQueue<NativeBase> REFERENCE_QUEUE = new ReferenceQueue<>();

  private final long nativeHandle;

  private abstract static class DisposableReference extends PhantomReference<NativeBase> {

    private DisposableReference(final NativeBase disposable) {
      super(disposable, REFERENCE_QUEUE);
      cleanUpQueue();
    }

    abstract void dispose();
  }

  protected NativeBase(final long nativeHandle) {
    this.nativeHandle = nativeHandle;
    REFERENCES.add(
        new DisposableReference(this) {
          @Override
          public void dispose() {
            REFERENCES.remove(this);
            disposeNativeHandle(nativeHandle);
          }
        });
  }

  private static native void disposeNativeHandle(long nativeHandle);

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
