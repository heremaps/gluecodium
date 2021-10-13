/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class PublicFieldsAllInit {
    @NonNull
    public String publicField;
    @NonNull
    String internalField;
    public PublicFieldsAllInit() {
        this.publicField = "bar";
        this.internalField = "foo";
    }
    public PublicFieldsAllInit(@NonNull final String publicField) {
        this.publicField = publicField;
        this.internalField = "foo";
    }
    PublicFieldsAllInit(@NonNull final String publicField, @NonNull final String internalField) {
        this.publicField = publicField;
        this.internalField = internalField;
    }
}
