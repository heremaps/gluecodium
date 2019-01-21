/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
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
    public native void setSameTypeInstances(@Nullable final SimpleInstantiable instanceOne, @Nullable final SimpleInstantiable instanceTwo);
    @Nullable
    public native SimpleInstantiable getInstanceOne();
    @NonNull
    public native SimpleInstantiable instanceNotNullMethod(@NonNull final SimpleInstantiable input);
}
