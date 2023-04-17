/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class SkipTypes extends NativeBase {
    public static final class NotInSwift {
        @NonNull
        public String fooField;
        public NotInSwift(@NonNull final String fooField) {
            this.fooField = fooField;
        }
    }
    public static final class NotInDart {
        @NonNull
        public String fooField;
        public NotInDart(@NonNull final String fooField) {
            this.fooField = fooField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected SkipTypes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
