/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.example;

import com.example.NativeBase;
import com.example.smoke.InternalErrorException;
import com.example.smoke.SomeTypeCollectionErrorException;

public class FooBar extends NativeBase {
    /** For internal use only */
    protected FooBar(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public static native void methodWithInternalError() throws InternalErrorException;
    public static native void methodWithTypeCollectionError() throws SomeTypeCollectionErrorException;
}
