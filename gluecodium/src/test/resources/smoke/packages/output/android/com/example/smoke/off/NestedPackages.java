/*
 *

 */
package com.example.smoke.off;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class NestedPackages extends NativeBase {
    public static final class SomeStruct {
        @NonNull
        public String someField;
        public SomeStruct(@NonNull final String someField) {
            this.someField = someField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected NestedPackages(final long nativeHandle, final Object dummy) {
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