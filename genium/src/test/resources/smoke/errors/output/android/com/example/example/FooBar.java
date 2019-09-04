/*
 *
 */
package com.example.example;
import com.example.NativeBase;
import com.example.smoke.Errors;
import com.example.smoke.SomeException;
public final class FooBar extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected FooBar(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native void methodWithInternalError() throws Errors.InternalException;
    public static native void methodWithTypeCollectionError() throws SomeException;
}
