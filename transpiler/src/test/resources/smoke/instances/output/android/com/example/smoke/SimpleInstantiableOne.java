/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

public class SimpleInstantiableOne extends NativeBase {
    /** For internal use only */
    protected SimpleInstantiableOne(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native void setStringValue(final String stringValue);
    public native String getStringValue();
}
