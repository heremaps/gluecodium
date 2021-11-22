/*
 *

 */
package com.example.smokeoff;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class UnderscorePackage extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected UnderscorePackage(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native String basicMethod(@NonNull final String inputString);
}