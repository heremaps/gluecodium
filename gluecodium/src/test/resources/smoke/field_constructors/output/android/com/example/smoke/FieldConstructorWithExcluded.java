/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorWithExcluded {
    /**
     * <p>Some field
     */
    @NonNull
    public String stringField;
    /**
     * <p>Some field constructor
     * @hidden
     * @param stringField <p>Some field
     */
    public FieldConstructorWithExcluded(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
