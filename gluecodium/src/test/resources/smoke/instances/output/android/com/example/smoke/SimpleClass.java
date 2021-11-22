/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class SimpleClass extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected SimpleClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native String getStringValue();
    @NonNull
    public native SimpleClass useSimpleClass(@NonNull final SimpleClass input);
}
