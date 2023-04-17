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
}
