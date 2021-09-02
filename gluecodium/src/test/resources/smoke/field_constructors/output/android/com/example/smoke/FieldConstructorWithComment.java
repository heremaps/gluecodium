/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>SomeStruct</p>
 */
public final class FieldConstructorWithComment {
    /**
     * <p>Some field</p>
     */
    @NonNull
    public String stringField;
    /**
     * <p>Some field constructor</p>
     * @param stringField <p>Some field</p>
     */
    public FieldConstructorWithComment(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
