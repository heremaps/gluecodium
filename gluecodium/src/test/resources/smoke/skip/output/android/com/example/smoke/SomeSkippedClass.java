/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import com.example.dont.smoke.DontSmokeEnum;
public final class SomeSkippedClass extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected SomeSkippedClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native DontSmokeEnum doFoo();
}
