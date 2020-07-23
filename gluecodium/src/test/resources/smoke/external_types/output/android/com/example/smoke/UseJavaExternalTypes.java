/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.lang.Integer;
import java.lang.String;
import java.time.Month;
import java.util.Currency;
import java.util.SimpleTimeZone;
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
    public static native Currency currencyRoundTrip(@NonNull final Currency input);
    @NonNull
    public static native SimpleTimeZone timeZoneRoundTrip(@NonNull final SimpleTimeZone input);
    @NonNull
    public static native Month monthRoundTrip(@NonNull final Month input);
    @NonNull
    public static native Integer colorRoundTrip(@NonNull final Integer input);
    @NonNull
    public static native String seasonRoundTrip(@NonNull final String input);
}
