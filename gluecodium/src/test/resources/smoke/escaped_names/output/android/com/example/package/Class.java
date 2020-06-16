/*
 *
 */
package com.example.package;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class Class extends NativeBase implements Interface {
    public Class() {
        this(constructor());
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Class(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private native void cacheThisInstance();
    private static native long constructor();
    @NonNull
    public native Struct fun(@NonNull final List<Struct> double) throws ExceptionException;
    @NonNull
    public native Enum getProperty();
    public native void setProperty(@NonNull final Enum value);
}
