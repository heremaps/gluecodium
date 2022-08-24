/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
final class JavaSwiftInternalClass extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected JavaSwiftInternalClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
