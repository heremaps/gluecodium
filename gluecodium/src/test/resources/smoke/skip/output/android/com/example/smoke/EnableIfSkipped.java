/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
public final class EnableIfSkipped extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected EnableIfSkipped(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
