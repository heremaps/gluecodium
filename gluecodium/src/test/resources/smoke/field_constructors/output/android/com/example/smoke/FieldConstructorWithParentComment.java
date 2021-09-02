/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>SomeStruct</p>
 */
public final class FieldConstructorWithParentComment {
    @NonNull
    public String stringField;
    /**
     * <p>There are constructors</p>
     * @param stringField
     */
    public FieldConstructorWithParentComment(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
