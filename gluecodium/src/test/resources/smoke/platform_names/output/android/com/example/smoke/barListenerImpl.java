/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
class barListenerImpl extends NativeBase implements barListener {
    protected barListenerImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void BarMethod(@NonNull final String BarParameter);
}