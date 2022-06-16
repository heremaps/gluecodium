/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class PrivateFieldsMore {
    @NonNull
    public String publicField;
    @NonNull
    private String privateField;
    @NonNull
    private String anotherPrivateField;
    public PrivateFieldsMore(@NonNull final String publicField, @NonNull final String privateField) {
        this.publicField = publicField;
        this.privateField = privateField;
        this.anotherPrivateField = "more nonsense";
    }
}
