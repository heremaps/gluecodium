/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorWithExcludedOnly {
    @NonNull
    public String stringField;
    /**
     * @hidden
     * @param stringField
     */
    public FieldConstructorWithExcludedOnly(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
