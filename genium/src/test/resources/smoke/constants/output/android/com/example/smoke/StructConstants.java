/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class StructConstants extends NativeBase {
    public static final StructConstants.SomeStruct STRUCT_CONSTANT = new StructConstants.SomeStruct("bar Buzz", 1.41f);
    public static final StructConstants.NestingStruct NESTING_STRUCT_CONSTANT = new StructConstants.NestingStruct(new StructConstants.SomeStruct("nonsense", -2.82f));
    public static class SomeStruct {
        public String stringField;
        public float floatField;
        public SomeStruct(String stringField, float floatField) {
            this.stringField = stringField;
            this.floatField = floatField;
        }
    }
    public static class NestingStruct {
        @NonNull
        public StructConstants.SomeStruct structField;
        public NestingStruct(StructConstants.SomeStruct structField) {
            this.structField = structField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected StructConstants(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
