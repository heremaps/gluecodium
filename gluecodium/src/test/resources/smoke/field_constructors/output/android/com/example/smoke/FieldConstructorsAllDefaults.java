/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorsAllDefaults {
    @NonNull
    public String stringField;
    public int intField;
    public boolean boolField;
    public FieldConstructorsAllDefaults() {
        this.stringField = "nonsense";
        this.intField = 42;
        this.boolField = true;
    }
    public FieldConstructorsAllDefaults(final int intField) {
        this.intField = intField;
        this.stringField = "nonsense";
        this.boolField = true;
    }
    public FieldConstructorsAllDefaults(final int intField, @NonNull final String stringField) {
        this.intField = intField;
        this.stringField = stringField;
        this.boolField = true;
    }
    public FieldConstructorsAllDefaults(final boolean boolField, final int intField, @NonNull final String stringField) {
        this.boolField = boolField;
        this.intField = intField;
        this.stringField = stringField;
    }
}
