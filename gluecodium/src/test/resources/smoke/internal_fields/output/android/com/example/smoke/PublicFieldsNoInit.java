/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class PublicFieldsNoInit {
    @NonNull
    public String publicField;
    @NonNull
    String internalField;
    public PublicFieldsNoInit(@NonNull final String publicField) {
        this.publicField = publicField;
        this.internalField = "foo";
    }
    PublicFieldsNoInit(@NonNull final String publicField, @NonNull final String internalField) {
        this.publicField = publicField;
        this.internalField = internalField;
    }
}
