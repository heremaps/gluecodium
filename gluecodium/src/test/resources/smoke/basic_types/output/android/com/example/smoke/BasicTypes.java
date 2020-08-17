/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class BasicTypes extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected BasicTypes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native String stringFunction(@NonNull final String input);
    public static native boolean boolFunction(final boolean input);
    public static native float floatFunction(final float input);
    public static native double doubleFunction(final double input);
    public static native byte byteFunction(final byte input);
    public static native short shortFunction(final short input);
    public static native int intFunction(final int input);
    public static native long longFunction(final long input);
    public static native short ubyteFunction(final short input);
    public static native int ushortFunction(final int input);
    public static native long uintFunction(final long input);
    public static native long ulongFunction(final long input);
}
