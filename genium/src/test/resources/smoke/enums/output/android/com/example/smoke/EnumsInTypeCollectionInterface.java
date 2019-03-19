/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.NativeBase;

public class EnumsInTypeCollectionInterface extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected EnumsInTypeCollectionInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native TCEnum flipEnumValue(@NonNull final TCEnum input);
}
