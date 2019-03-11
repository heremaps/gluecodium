/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public class ImmutableStructWithDefaults {
    public final int intField;
    public final long uintField;
    public final float floatField;
    public final double doubleField;
    public final boolean boolField;
    public final String stringField;
    @NonNull
    public final SomeEnum enumField;
    @NonNull
    public final DefaultValues.ExternalEnum externalEnumField;
    public ImmutableStructWithDefaults() {
        this(42, 0L, 3.14f, -1.4142, false, "\\Jonny \"Magic\" Smith\n", SomeEnum.BAR_VALUE, DefaultValues.ExternalEnum.ANOTHER_VALUE);
    }
    public ImmutableStructWithDefaults(long uintField, boolean boolField) {
        this.intField = 42;
        this.uintField = uintField;
        this.floatField = 3.14f;
        this.doubleField = -1.4142;
        this.boolField = boolField;
        this.stringField = "\\Jonny \"Magic\" Smith\n";
        this.enumField = SomeEnum.BAR_VALUE;
        this.externalEnumField = DefaultValues.ExternalEnum.ANOTHER_VALUE;
    }
    public ImmutableStructWithDefaults(int intField, long uintField, float floatField, double doubleField, boolean boolField, String stringField, SomeEnum enumField, DefaultValues.ExternalEnum externalEnumField) {
        this.intField = intField;
        this.uintField = uintField;
        this.floatField = floatField;
        this.doubleField = doubleField;
        this.boolField = boolField;
        this.stringField = stringField;
        this.enumField = enumField;
        this.externalEnumField = externalEnumField;
    }
    public static class Builder {
        private int intField = 42;
        private long uintField = 0L;
        private float floatField = 3.14f;
        private double doubleField = -1.4142;
        private boolean boolField = false;
        private String stringField = "\\Jonny \"Magic\" Smith\n";
        private SomeEnum enumField = SomeEnum.BAR_VALUE;
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
        public Builder setDoubleField(double doubleField) {
            this.doubleField = doubleField;
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
        public Builder setEnumField(SomeEnum enumField) {
            this.enumField = enumField;
            return this;
        }
        public Builder setExternalEnumField(DefaultValues.ExternalEnum externalEnumField) {
            this.externalEnumField = externalEnumField;
            return this;
        }
        public ImmutableStructWithDefaults build() {
            return new ImmutableStructWithDefaults(intField, uintField, floatField, doubleField, boolField, stringField, enumField, externalEnumField);
        }
    }
}
