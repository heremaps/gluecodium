/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorWithDeprecationOnly {
    @NonNull
    public String stringField;
    /**
     * @deprecated <p>Shouldn't really use it
     * @param stringField
     */
    @Deprecated
    public FieldConstructorWithDeprecationOnly(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
