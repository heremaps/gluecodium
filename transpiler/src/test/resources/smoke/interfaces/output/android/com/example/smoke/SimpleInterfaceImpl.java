/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

class SimpleInterfaceImpl extends NativeBase implements SimpleInterface {
    protected SimpleInterfaceImpl(final long nativeHandle) {
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
