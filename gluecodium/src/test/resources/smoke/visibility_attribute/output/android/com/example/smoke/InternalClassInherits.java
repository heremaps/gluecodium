/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
final class InternalClassInherits extends NativeBase implements InternalInterfaceParent {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected InternalClassInherits(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Override
    public native void fooBar();
    @NonNull
    @Override
    public native String getProp();
    @Override
    public native void setProp(@NonNull final String value);
}
