/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smokeoff;
import com.example.NativeBase;
public class UnderscorePackage extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected UnderscorePackage(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);

    public static native String basicMethod(final String inputString);
}