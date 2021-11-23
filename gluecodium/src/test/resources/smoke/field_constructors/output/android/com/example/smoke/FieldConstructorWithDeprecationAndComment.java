/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorWithDeprecationAndComment {
    @NonNull
    public String stringField;
    /**
     * <p>Some field constructor
     * @deprecated <p>Shouldn't really use it
     * @param stringField
     */
    @Deprecated
    public FieldConstructorWithDeprecationAndComment(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
