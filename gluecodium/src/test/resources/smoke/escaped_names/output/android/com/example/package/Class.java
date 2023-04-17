/*
 *
 */
package com.example.package;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class Class extends NativeBase implements Interface {
    public Class() {
        this(constructor(), (Object)null);
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected Class(final long nativeHandle, final Object dummy) {
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
    public native Types.Struct fun(@NonNull final List<Types.Struct> double) throws Types.ExceptionException;
    @NonNull
    public native Types.Enum getProperty();
    public native void setProperty(@NonNull final Types.Enum value);
}
