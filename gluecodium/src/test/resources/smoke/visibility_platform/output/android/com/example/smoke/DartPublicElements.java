/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class DartPublicElements {
    @NonNull
    String stringField;
    DartPublicElements(@NonNull final String stringField) {
        this.stringField = stringField;
    }
    native void foo();
}
