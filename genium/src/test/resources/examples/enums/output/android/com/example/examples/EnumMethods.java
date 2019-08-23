/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;

import android.support.annotation.NonNull;
import com.example.NativeBase;

public final class EnumMethods extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected EnumMethods(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native ShoeSizes methodWithEnumeration(@NonNull final ShoeSizes input);
}
