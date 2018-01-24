/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.here.android.examples;
import com.here.android.NativeBase;
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
        public int intField = 42;
        public float floatField = 3.14f;
        public boolean boolField = true;
        public String stringField = "some string";
        public DefaultValues.SomeEnum enumField = DefaultValues.SomeEnum.BAR_VALUE;

        public StructWithDefaults() {}
        public StructWithDefaults(int intField, float floatField, boolean boolField, String stringField, DefaultValues.SomeEnum enumField) {
            this.intField = intField;
            this.floatField = floatField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
        }
        public static class Builder {
            private int intField = 42;
            private float floatField = 3.14f;
            private boolean boolField = true;
            private String stringField = "some string";
            private DefaultValues.SomeEnum enumField = DefaultValues.SomeEnum.BAR_VALUE;
            public Builder() {
            }
            public Builder setIntField(int intField) {
                this.intField = intField;
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
            public StructWithDefaults build() {
                return new StructWithDefaults(intField, floatField, boolField, stringField, enumField);
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
}
