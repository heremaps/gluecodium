/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke.off;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class NestedPackages extends NativeBase {
    public static class SomeStruct {
        public String someField;
        public SomeStruct() {
            this((String)null);
        }
        public SomeStruct(String someField) {
            this.someField = someField;
        }
    }
    /** For internal use only */
    protected NestedPackages(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native NestedPackages.SomeStruct basicMethod(@NonNull final NestedPackages.SomeStruct input);
}
