/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>SomeStruct</p>
 */
public final class FieldConstructorWithBothComments {
    @NonNull
    public String stringField;
    /**
     * <p>This comment takes precedence</p>
     * @param stringField
     */
    public FieldConstructorWithBothComments(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
