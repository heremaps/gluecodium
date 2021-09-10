/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorWithDeprecationAndComment {
    @NonNull
    public String stringField;
    /**
     * <p>Some field constructor</p>
     * @deprecated <p>Shouldn't really use it</p>
     * @param stringField
     */
    @Deprecated
    public FieldConstructorWithDeprecationAndComment(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
