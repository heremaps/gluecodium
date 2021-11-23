/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>SomeStruct
 */
public final class FieldConstructorWithComment {
    /**
     * <p>Some field
     */
    @NonNull
    public String stringField;
    /**
     * <p>Some field constructor
     * @param stringField <p>Some field
     */
    public FieldConstructorWithComment(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
