/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
class SimpleInterfaceImpl extends NativeBase implements SimpleInterface {
    protected SimpleInterfaceImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native String getStringValue();
    @NonNull
    public native SimpleInterface useSimpleInterface(@NonNull final SimpleInterface input);
}
