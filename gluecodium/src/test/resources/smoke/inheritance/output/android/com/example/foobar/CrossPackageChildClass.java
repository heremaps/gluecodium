/*
 *
 */
package com.example.foobar;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import com.example.smoke.ParentInterface;
public final class CrossPackageChildClass extends NativeBase implements ParentInterface {
    /**
     * For internal use only.
     * @exclude
     */
    protected CrossPackageChildClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Override
    public native void rootMethod();
    @NonNull
    @Override
    public native String getRootProperty();
    @Override
    public native void setRootProperty(@NonNull final String value);
}
