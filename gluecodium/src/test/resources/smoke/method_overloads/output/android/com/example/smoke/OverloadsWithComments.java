/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class OverloadsWithComments extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected OverloadsWithComments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public native void doStuff();
    /**
     * <p>{@code stuff}
     * @param stuff
     */
    public native void doStuff(@NonNull final String stuff);
}
