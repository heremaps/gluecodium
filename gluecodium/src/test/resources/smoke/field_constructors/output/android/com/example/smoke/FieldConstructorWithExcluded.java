/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldConstructorWithExcluded {
    /**
     * <p>Some field</p>
     */
    @NonNull
    public String stringField;
    /**
     * <p>Some field constructor</p>
     * @exclude
     * @param stringField <p>Some field</p>
     */
    public FieldConstructorWithExcluded(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
