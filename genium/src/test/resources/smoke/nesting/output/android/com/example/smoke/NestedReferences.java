/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class NestedReferences extends NativeBase {
    public final static class NestedReferences {
        @NonNull
        public String stringField;
        public NestedReferences(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected NestedReferences(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native NestedReferences insideOut(@NonNull final NestedReferences.NestedReferences struct1, @NonNull final NestedReferences.NestedReferences struct2);
}
