/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
public class SpecialNames extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected SpecialNames(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void create();
    public native void release();
    public native void createProxy();
    public native void update();
    public native void Uppercase();
}
