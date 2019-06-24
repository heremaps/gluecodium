/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class barInterface extends NativeBase {
    public barInterface(final String makeParameter) {
        this(make(makeParameter));
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected barInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native barStruct BarMethod(final String BarParameter);
    private static native long make(final String makeParameter);
    public native long GET_BAR_ATTRIBUTE();
    public native void SET_BAR_ATTRIBUTE(final long value);
}
