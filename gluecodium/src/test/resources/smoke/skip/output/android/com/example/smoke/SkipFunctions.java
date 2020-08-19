/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
public final class SkipFunctions extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected SkipFunctions(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native boolean notInSwift(final boolean input);
    public static native float notInDart(final float input);
}
