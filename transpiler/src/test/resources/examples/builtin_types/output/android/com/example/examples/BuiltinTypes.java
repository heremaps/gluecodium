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

package com.example.examples;

import com.example.NativeBase;
public class BuiltinTypes extends NativeBase {
    /** For internal use only */
    protected BuiltinTypes(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native byte methodWithInt8(final byte inputNumber);
    public static native long methodWithUInt8(final long inputNumber);
    public static native short methodWithInt16(final short inputNumber);
    public static native long methodWithUInt16(final long inputNumber);
    public static native int methodWithInt32(final int inputNumber);
    public static native long methodWithUInt32(final long inputNumber);
    public static native long methodWithInt64(final long inputNumber);
    public static native long methodWithUInt64(final long inputNumber);
    public static native boolean methodWithBoolean(final boolean inputCondition);
    public static native float methodWithFloat(final float inputNumber);
    public static native double methodWithDouble(final double inputNumber);
    public static native byte[] methodWithByteBuffer(final byte[] inputBuffer);
    public static native double methodWithFloatAndInteger(final float inputFloat, final int inputInteger);
}
