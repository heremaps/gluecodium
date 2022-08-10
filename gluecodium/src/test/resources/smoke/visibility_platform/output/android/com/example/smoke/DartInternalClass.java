/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
public final class DartInternalClass extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected DartInternalClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
