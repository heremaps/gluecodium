/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class barInterface extends NativeBase {
    public barInterface(@NonNull final String makeParameter) {
        this(make(makeParameter), (Object)null);
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected barInterface(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private native void cacheThisInstance();
    @NonNull
    public native barTypes.barStruct BarMethod(@NonNull final String BarParameter);
    private static native long make(@NonNull final String makeParameter);
    public native long GET_BAR_PROPERTY();
    public native void SET_BAR_PROPERTY(final long value);
}
