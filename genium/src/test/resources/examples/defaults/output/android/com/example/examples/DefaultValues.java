/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class DefaultValues extends NativeBase {
    public enum SomeEnum {
        FOO_VALUE(0),
        BAR_VALUE(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static class StructWithDefaults {
        public int intField;
        public float floatField;
        public boolean boolField;
        public String stringField;
        @NonNull
        public DefaultValues.SomeEnum enumField;
        public StructWithDefaults() {
            this.intField = 42;
            this.floatField = 3.14f;
            this.boolField = true;
            this.stringField = "some string";
            this.enumField = DefaultValues.SomeEnum.BAR_VALUE;
        }
        public StructWithDefaults(int intField, float floatField, boolean boolField, String stringField, DefaultValues.SomeEnum enumField) {
            this.intField = intField;
            this.floatField = floatField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected DefaultValues(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
