/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.Date;
public final class Dates extends NativeBase {
    public final static class DateStruct {
        @NonNull
        public Date dateField;
        public DateStruct(@NonNull final Date dateField) {
            this.dateField = dateField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Dates(final long nativeHandle) {
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
    @NonNull
    public native Date getDateProperty();
    public native void setDateProperty(@NonNull final Date value);
}