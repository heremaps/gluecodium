/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.Date;
public final class UseFreeTypes extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected UseFreeTypes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native Date doStuff(@NonNull final FreePoint point, @NonNull final FreeEnum mode) throws FreeException;
}
