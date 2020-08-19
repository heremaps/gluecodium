/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
class ExternalInterfaceImpl extends NativeBase implements ExternalInterface {
    protected ExternalInterfaceImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void someMethod(final byte someParameter);
    @NonNull
    public native String getSomeProperty();
}
