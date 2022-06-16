/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
class InternalClass extends NativeBase {
    protected InternalClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    native void fooBar();
}
