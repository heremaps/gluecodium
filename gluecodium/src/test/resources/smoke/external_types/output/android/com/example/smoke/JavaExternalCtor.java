/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
final class JavaExternalCtor {
    @NonNull
    public String field;
    JavaExternalCtor(@NonNull final String field) {
        JavaExternalCtor _other = make(field);
        this.field = _other.field;
    }
    private static native JavaExternalCtor make(@NonNull final String field);
}
