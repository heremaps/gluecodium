/*
 *

 */
package com.example.smoke;
import com.example.NativeBase;
class InternalListenerImpl extends NativeBase implements InternalListener {
    protected InternalListenerImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void onEvent();
}
