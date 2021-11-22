/*
 *

 */
package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.NativeBase;

public final class EnumsInTypeCollectionInterface extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected EnumsInTypeCollectionInterface(final long nativeHandle, final Object dummy) {
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
