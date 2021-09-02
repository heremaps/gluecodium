/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorsPartialDefaults {
    @NonNull
    public String stringField;
    public int intField;
    public boolean boolField;
    public FieldConstructorsPartialDefaults(final int intField, @NonNull final String stringField) {
        this.intField = intField;
        this.stringField = stringField;
        this.boolField = true;
    }
    public FieldConstructorsPartialDefaults(final boolean boolField, final int intField, @NonNull final String stringField) {
        this.boolField = boolField;
        this.intField = intField;
        this.stringField = stringField;
    }
}
