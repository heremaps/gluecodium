/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
class InternalParent extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected InternalParent(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
