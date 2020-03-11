/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
class EquatableInterfaceImpl extends NativeBase implements EquatableInterface {
    protected EquatableInterfaceImpl(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Override
    public native boolean equals(Object rhs);
    @Override
    public native int hashCode();
}
