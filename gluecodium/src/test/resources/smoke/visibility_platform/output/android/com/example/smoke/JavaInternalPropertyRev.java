/*
 *
 */
package com.example.smoke;
import android.support.annotation.Nullable;
import com.example.NativeBase;
public final class JavaInternalPropertyRev extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected JavaInternalPropertyRev(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Nullable
    native String getAppContext();
    native void setAppContext(@Nullable final String value);
}
