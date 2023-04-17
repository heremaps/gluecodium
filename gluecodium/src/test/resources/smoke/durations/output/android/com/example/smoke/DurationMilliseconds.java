/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import com.example.time.Duration;
public final class DurationMilliseconds extends NativeBase {
    public static final class DurationStruct {
        @NonNull
        public Duration durationField;
        public DurationStruct(@NonNull final Duration durationField) {
            this.durationField = durationField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected DurationMilliseconds(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native Duration durationFunction(@NonNull final Duration input);
    @Nullable
    public native Duration nullableDurationFunction(@Nullable final Duration input);
    @NonNull
    public native Duration getDurationProperty();
    public native void setDurationProperty(@NonNull final Duration value);
}
