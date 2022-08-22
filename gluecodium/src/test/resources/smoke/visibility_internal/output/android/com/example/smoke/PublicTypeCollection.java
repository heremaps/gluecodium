/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class PublicTypeCollection {
    static final class InternalStruct {
        @NonNull
        String stringField;
        InternalStruct(@NonNull final String stringField) {
            this.stringField = stringField;
        }
        public native void fooBar();
    }
}
