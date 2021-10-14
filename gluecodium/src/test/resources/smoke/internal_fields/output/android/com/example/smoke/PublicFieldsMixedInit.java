/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class PublicFieldsMixedInit {
    @NonNull
    public String publicField1;
    @NonNull
    public String publicField2;
    @NonNull
    String internalField;
    public PublicFieldsMixedInit(@NonNull final String publicField2) {
        this.publicField1 = "bar";
        this.publicField2 = publicField2;
        this.internalField = "foo";
    }
    public PublicFieldsMixedInit(@NonNull final String publicField1, @NonNull final String publicField2) {
        this.publicField1 = publicField1;
        this.publicField2 = publicField2;
        this.internalField = "foo";
    }
    PublicFieldsMixedInit(@NonNull final String publicField1, @NonNull final String publicField2, @NonNull final String internalField) {
        this.publicField1 = publicField1;
        this.publicField2 = publicField2;
        this.internalField = internalField;
    }
}
