/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import java.util.Date;
import java.util.Set;
public final class Dates extends NativeBase {
    public static final class DateStruct {
        @NonNull
        public Date dateField;
        @Nullable
        public Date nullableDateField;
        public DateStruct(@NonNull final Date dateField) {
            this.dateField = dateField;
            this.nullableDateField = null;
        }
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected Dates(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native Date dateMethod(@NonNull final Date input);
    @Nullable
    public native Date nullableDateMethod(@Nullable final Date input);
    @NonNull
    public native Date getDateProperty();
    public native void setDateProperty(@NonNull final Date value);
    @NonNull
    public native Set<Date> getDateSet();
    public native void setDateSet(@NonNull final Set<Date> value);
}
