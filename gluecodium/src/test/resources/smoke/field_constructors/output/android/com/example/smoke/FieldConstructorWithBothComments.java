/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>SomeStruct
 */
public final class FieldConstructorWithBothComments {
    @NonNull
    public String stringField;
    /**
     * <p>This comment takes precedence
     * @param stringField
     */
    public FieldConstructorWithBothComments(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
