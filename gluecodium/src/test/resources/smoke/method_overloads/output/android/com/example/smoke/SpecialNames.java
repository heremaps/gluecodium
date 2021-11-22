/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class SpecialNames extends NativeBase {
    public SpecialNames(@NonNull final String result) {
        this(make(result), (Object)null);
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected SpecialNames(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private native void cacheThisInstance();
    public native void create();
    public native void release();
    public native void createProxy();
    public native void Uppercase();
    private static native long make(@NonNull final String result);
}
