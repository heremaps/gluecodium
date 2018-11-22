/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

public class NestedInstantiable extends NativeBase {
    /** For internal use only */
    protected NestedInstantiable(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native void setSameTypeInstances(final SimpleInstantiable instanceOne, final SimpleInstantiable instanceTwo);
    public native SimpleInstantiable getInstanceOne();
}
