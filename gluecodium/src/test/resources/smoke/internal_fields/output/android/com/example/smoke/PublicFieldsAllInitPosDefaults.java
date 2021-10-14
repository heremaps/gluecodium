/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class PublicFieldsAllInitPosDefaults {
    @NonNull
    public String publicField;
    @NonNull
    String internalField;
    public PublicFieldsAllInitPosDefaults() {
        this.publicField = "bar";
        this.internalField = "foo";
    }
    public PublicFieldsAllInitPosDefaults(@NonNull final String publicField) {
        this.publicField = publicField;
        this.internalField = "foo";
    }
    public PublicFieldsAllInitPosDefaults(@NonNull final String publicField, @NonNull final String internalField) {
        this.publicField = publicField;
        this.internalField = internalField;
    }
}
