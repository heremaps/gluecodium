/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
class InheritanceRootImpl extends NativeBase implements InheritanceRoot {
    protected InheritanceRootImpl(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void rootMethod();
    @NonNull
    public native String getRootAttribute();
    public native void setRootAttribute(@NonNull final String value);
}