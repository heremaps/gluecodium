/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
import my.custom.annotations.NeverBeNull;
import my.other.annotations.Optional;
public class Annotations extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected Annotations(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Optional
    public native Boolean testOptional(@NeverBeNull final Annotations self);
}