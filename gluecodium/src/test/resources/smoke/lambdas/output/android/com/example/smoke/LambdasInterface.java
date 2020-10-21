/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
public interface LambdasInterface {
    /**
     * @exclude
     */
    static class TakeScreenshotCallbackImpl extends NativeBase implements TakeScreenshotCallback {
        protected TakeScreenshotCallbackImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        public native void apply(@Nullable final byte[] p0);
    }
    @FunctionalInterface
    public interface TakeScreenshotCallback {
        void apply(@Nullable final byte[] p0);
    }
    void takeScreenshot(@NonNull final LambdasInterface.TakeScreenshotCallback callback);
}
