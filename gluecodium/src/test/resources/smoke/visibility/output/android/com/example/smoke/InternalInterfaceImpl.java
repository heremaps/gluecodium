/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
class InternalInterfaceImpl extends NativeBase implements InternalInterface {
    protected InternalInterfaceImpl(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void fooBar();
}
