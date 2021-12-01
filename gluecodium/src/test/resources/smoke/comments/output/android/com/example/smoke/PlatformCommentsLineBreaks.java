/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
/**
 * <p>Text middle
 * line break
 */
public final class PlatformCommentsLineBreaks extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected PlatformCommentsLineBreaks(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
