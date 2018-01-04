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
package com.here.android.smoke;
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
        public String stringField = "\\Jonny \"Magic\" Smith\n";
        public DefaultValues.SomeEnum enumField = DefaultValues.SomeEnum.BAR_VALUE;

        public StructWithDefaults() {}
        public StructWithDefaults(int intField, float floatField, boolean boolField, String stringField, DefaultValues.SomeEnum enumField) {
            this.intField = intField;
            this.floatField = floatField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
        }
        public static StructWithDefaultsBuilder builder() {
            return new StructWithDefaultsBuilder();
        }
        public static class StructWithDefaultsBuilder {
            public int intField = 42;
            public float floatField = 3.14f;
            public boolean boolField = true;
            public String stringField = "\\Jonny \"Magic\" Smith\n";
            public DefaultValues.SomeEnum enumField = DefaultValues.SomeEnum.BAR_VALUE;
            StructWithDefaultsBuilder() {
            }
            public StructWithDefaultsBuilder intField(int intField) {
                this.intField = intField;
                return this;
            }
            public StructWithDefaultsBuilder floatField(float floatField) {
                this.floatField = floatField;
                return this;
            }
            public StructWithDefaultsBuilder boolField(boolean boolField) {
                this.boolField = boolField;
                return this;
            }
            public StructWithDefaultsBuilder stringField(String stringField) {
                this.stringField = stringField;
                return this;
            }
            public StructWithDefaultsBuilder enumField(DefaultValues.SomeEnum enumField) {
                this.enumField = enumField;
                return this;
            }
            public StructWithDefaults build() {
                return new StructWithDefaults(intField, floatField, boolField, stringField, enumField);
            }
        }
    }
    protected DefaultValues(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native DefaultValues.StructWithDefaults processStructWithDefaults(final DefaultValues.StructWithDefaults input);
}
