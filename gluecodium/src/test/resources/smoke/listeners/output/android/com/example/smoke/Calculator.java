/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class Calculator extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected Calculator(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native void registerListener(@NonNull final CalculatorListener listener);
    public static native void unregisterListener(@NonNull final CalculatorListener listener);
}
