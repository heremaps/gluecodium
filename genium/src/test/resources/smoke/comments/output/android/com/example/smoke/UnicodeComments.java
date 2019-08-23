/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class UnicodeComments extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected UnicodeComments(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>Süßölgefäß</p>
     * @param input <p>שלום</p>
     * @return <p>товарищ</p>
     * @throws Comments.SomeEnumException <p>ネコ</p>
     */
    public native boolean someMethodWithAllComments(@NonNull final String input) throws Comments.SomeEnumException;
}
