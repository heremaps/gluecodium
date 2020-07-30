/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class UseJavaExternalTypes extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected UseJavaExternalTypes(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native java.util.Currency currencyRoundTrip(@NonNull final java.util.Currency input);
    @NonNull
    public static native java.util.SimpleTimeZone timeZoneRoundTrip(@NonNull final java.util.SimpleTimeZone input);
    @NonNull
    public static native java.time.Month monthRoundTrip(@NonNull final java.time.Month input);
    @NonNull
    public static native java.lang.Integer colorRoundTrip(@NonNull final java.lang.Integer input);
    @NonNull
    public static native java.lang.String seasonRoundTrip(@NonNull final java.lang.String input);
}
