/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class ChildClassFromInterface extends NativeBase implements ParentInterface {
    /**
     * For internal use only.
     * @exclude
     */
    protected ChildClassFromInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void childClassMethod();
    @Override
    public native void rootMethod();
    @NonNull
    @Override
    public native String getRootProperty();
    @Override
    public native void setRootProperty(@NonNull final String value);
}
