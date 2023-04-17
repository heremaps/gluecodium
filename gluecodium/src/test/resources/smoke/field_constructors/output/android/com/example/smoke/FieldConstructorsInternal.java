/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorsInternal {
    @NonNull
    public String publicField;
    public double internalField;
    FieldConstructorsInternal() {
        this.publicField = "foo";
        this.internalField = 42;
    }
    FieldConstructorsInternal(@NonNull final String publicField) {
        this.publicField = publicField;
        this.internalField = 42;
    }
    FieldConstructorsInternal(final double internalField) {
        this.internalField = internalField;
        this.publicField = "foo";
    }
    FieldConstructorsInternal(final double internalField, @NonNull final String publicField) {
        this.internalField = internalField;
        this.publicField = publicField;
    }
}
