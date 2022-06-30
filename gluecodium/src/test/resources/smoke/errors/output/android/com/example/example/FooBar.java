/*
 *
 */
package com.example.example;
import com.example.NativeBase;
import com.example.smoke.Errors;
import com.example.smoke.SomeTypeCollection;
public final class FooBar extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected FooBar(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native void methodWithInternalError() throws Errors.InternalException;
    public static native void methodWithTypeCollectionError() throws SomeTypeCollection.SomeException;
}
