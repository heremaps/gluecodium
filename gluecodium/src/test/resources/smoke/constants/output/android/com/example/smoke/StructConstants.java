/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class StructConstants extends NativeBase {
    public static final StructConstants.SomeStruct STRUCT_CONSTANT = new StructConstants.SomeStruct("bar Buzz", 1.41f);
    public static final StructConstants.NestingStruct NESTING_STRUCT_CONSTANT = new StructConstants.NestingStruct(new StructConstants.SomeStruct("nonsense", -2.82f));
    public static final class SomeStruct {
        @NonNull
        public String stringField;
        public float floatField;
        public SomeStruct(@NonNull final String stringField, final float floatField) {
            this.stringField = stringField;
            this.floatField = floatField;
        }
    }
    public static final class NestingStruct {
        @NonNull
        public StructConstants.SomeStruct structField;
        public NestingStruct(@NonNull final StructConstants.SomeStruct structField) {
            this.structField = structField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected StructConstants(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}