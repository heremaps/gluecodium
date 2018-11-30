/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
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
    public enum ExternalEnum {
        ONE_VALUE(0),
        ANOTHER_VALUE(1);
        public final int value;
        ExternalEnum(final int value) {
            this.value = value;
        }
    }
    public static class StructWithDefaults {
        public int intField;
        public long uintField;
        public float floatField;
        public boolean boolField;
        public String stringField;
        @NonNull
        public DefaultValues.SomeEnum enumField;
        @NonNull
        public DefaultValues.ExternalEnum externalEnumField;
        public StructWithDefaults() {
            this(42, 4294967295L, 3.14f, true, "\\Jonny \"Magic\" Smith\n", DefaultValues.SomeEnum.BAR_VALUE, DefaultValues.ExternalEnum.ANOTHER_VALUE);
        }
        public StructWithDefaults(int intField, long uintField, float floatField, boolean boolField, String stringField, DefaultValues.SomeEnum enumField, DefaultValues.ExternalEnum externalEnumField) {
            this.intField = intField;
            this.uintField = uintField;
            this.floatField = floatField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
            this.externalEnumField = externalEnumField;
        }
        public static class Builder {
            private int intField = 42;
            private long uintField = 4294967295L;
            private float floatField = 3.14f;
            private boolean boolField = true;
            private String stringField = "\\Jonny \"Magic\" Smith\n";
            private DefaultValues.SomeEnum enumField = DefaultValues.SomeEnum.BAR_VALUE;
            private DefaultValues.ExternalEnum externalEnumField = DefaultValues.ExternalEnum.ANOTHER_VALUE;
            public Builder() {
            }
            public Builder setIntField(int intField) {
                this.intField = intField;
                return this;
            }
            public Builder setUintField(long uintField) {
                this.uintField = uintField;
                return this;
            }
            public Builder setFloatField(float floatField) {
                this.floatField = floatField;
                return this;
            }
            public Builder setBoolField(boolean boolField) {
                this.boolField = boolField;
                return this;
            }
            public Builder setStringField(String stringField) {
                this.stringField = stringField;
                return this;
            }
            public Builder setEnumField(DefaultValues.SomeEnum enumField) {
                this.enumField = enumField;
                return this;
            }
            public Builder setExternalEnumField(DefaultValues.ExternalEnum externalEnumField) {
                this.externalEnumField = externalEnumField;
                return this;
            }
            public StructWithDefaults build() {
                return new StructWithDefaults(intField, uintField, floatField, boolField, stringField, enumField, externalEnumField);
            }
        }
    }
    /** For internal use only */
    protected DefaultValues(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native DefaultValues.StructWithDefaults processStructWithDefaults(@NonNull final DefaultValues.StructWithDefaults input);
}
