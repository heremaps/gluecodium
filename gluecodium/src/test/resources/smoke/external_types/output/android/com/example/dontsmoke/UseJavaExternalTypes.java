/*
 *
 */
package com.example.dontsmoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import com.example.smoke.JavaExternalTypesStruct;
public final class UseJavaExternalTypes extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected UseJavaExternalTypes(final long nativeHandle, final Object dummy) {
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
    @NonNull
    public static native JavaExternalTypesStruct structRoundTrip(@NonNull final JavaExternalTypesStruct input);
}
