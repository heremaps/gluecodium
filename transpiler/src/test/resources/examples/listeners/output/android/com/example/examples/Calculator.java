/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import com.example.NativeBase;
public class Calculator extends NativeBase {
    /** For internal use only */
    protected Calculator(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native void registerListener(final CalculatorListener listener);
    public static native void unregisterListener(final CalculatorListener listener);
    public static native void calculate();
}
