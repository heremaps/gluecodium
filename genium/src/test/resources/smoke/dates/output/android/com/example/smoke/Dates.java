/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.Date;
public class Dates extends NativeBase {
    public static class DateStruct {
        @NonNull
        public Date dateField;
        public DateStruct() {
            this(new Date());
        }
        public DateStruct(Date dateField) {
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
    public native Date getDateAttribute();
    public native void setDateAttribute(@NonNull final Date value);
}
