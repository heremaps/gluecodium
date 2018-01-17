/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.here.android.examples;

import com.here.android.NativeBase;

public class Errors extends NativeBase {
    public enum InternalErrors {
        NONE(0),
        CRASHED(1),
        EXPLODED(2);

        public final int value;

        InternalErrors(final int value) {
            this.value = value;
        }
    }
    /** For internal use only */
    protected Errors(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public static native void startSomethingOrFail() throws InternalErrorsException;
    public static native String getSomethingOrFail() throws InternalErrorsException;
}
