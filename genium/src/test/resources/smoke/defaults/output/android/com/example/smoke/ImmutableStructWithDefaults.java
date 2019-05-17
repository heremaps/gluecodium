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
}
