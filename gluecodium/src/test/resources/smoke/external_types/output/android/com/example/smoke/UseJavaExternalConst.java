/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class UseJavaExternalConst {
    static final com.example.Foo DEFAULT_TRUTH = new com.example.Foo("foo");
    @NonNull
    public String stringField;
    public UseJavaExternalConst(@NonNull final String stringField) {
        this.stringField = stringField;
    }
}
