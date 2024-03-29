/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class UnicodeComments extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected UnicodeComments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>Süßölgefäß
     * @param input <p>שלום
     * @return <p>товарищ
     * @throws Comments.SomethingWrongException <p>ネコ
     */
    public native boolean someMethodWithAllComments(@NonNull final String input) throws Comments.SomethingWrongException;
}
