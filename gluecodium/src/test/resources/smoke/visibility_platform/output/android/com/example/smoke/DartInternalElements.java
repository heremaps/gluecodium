/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class DartInternalElements {
    @NonNull
    public String stringField;
    public DartInternalElements(@NonNull final String stringField) {
        this.stringField = stringField;
    }
    public native void foo();
}
