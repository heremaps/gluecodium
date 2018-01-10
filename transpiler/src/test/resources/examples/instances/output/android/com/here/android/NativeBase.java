/*
 * Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.here.android;

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
