/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class Calculator extends NativeBase {
    public Calculator() {
        this(create());
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Calculator(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private static native long create();
    public native void registerListener(@NonNull final CalculatorListener listener);
    public native void unregisterListener(@NonNull final CalculatorListener listener);
    public native void calculate();
}
