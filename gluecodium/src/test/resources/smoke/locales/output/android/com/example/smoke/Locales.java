/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.Locale;
public final class Locales extends NativeBase {
    public static final class LocaleStruct {
        @NonNull
        public Locale localeField;
        public LocaleStruct(@NonNull final Locale localeField) {
            this.localeField = localeField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected Locales(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native Locale localeMethod(@NonNull final Locale input);
    @NonNull
    public native Locale getLocaleProperty();
    public native void setLocaleProperty(@NonNull final Locale value);
}
