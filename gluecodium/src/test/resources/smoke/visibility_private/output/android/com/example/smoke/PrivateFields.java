/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class PrivateFields {
    @NonNull
    public String publicField;
    @NonNull
    private String privateField;
    public PrivateFields(@NonNull final String publicField) {
        this.publicField = publicField;
        this.privateField = "nonsense";
    }
    public PrivateFields(@NonNull final String publicField, @NonNull final String privateField) {
        this.publicField = publicField;
        this.privateField = privateField;
    }
}