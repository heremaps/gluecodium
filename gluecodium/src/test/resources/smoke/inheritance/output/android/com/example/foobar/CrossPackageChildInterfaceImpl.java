/*
 *
 */
package com.example.foobar;
import android.support.annotation.NonNull;
import com.example.NativeBase;
class CrossPackageChildInterfaceImpl extends NativeBase implements CrossPackageChildInterface {
    protected CrossPackageChildInterfaceImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Override
    public native void rootMethod();
    @NonNull
    @Override
    public native String getRootProperty();
    @Override
    public native void setRootProperty(@NonNull final String value);
}
