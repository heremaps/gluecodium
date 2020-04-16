/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class SkipTypes extends NativeBase {
    public final static class NotInSwift {
        @NonNull
        public String fooField;
        public NotInSwift(@NonNull final String fooField) {
            this.fooField = fooField;
        }
    }
    public final static class NotInDart {
        @NonNull
        public String fooField;
        public NotInDart(@NonNull final String fooField) {
            this.fooField = fooField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected SkipTypes(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
