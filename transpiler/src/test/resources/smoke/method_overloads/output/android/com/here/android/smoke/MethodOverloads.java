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

package com.here.android.smoke;

import com.here.android.NativeBase;

public class MethodOverloads extends NativeBase {
    public static class Point {
        public double x;
        public double y;
    }
    protected MethodOverloads(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native boolean isBoolean(final boolean input);
    public native boolean isBoolean(final byte input);
    public native boolean isBoolean(final String input);
    public native boolean isBoolean(final MethodOverloads.Point input);
    public native boolean isBoolean(final boolean input1, final byte input2, final String input3, final MethodOverloads.Point input4);
}
