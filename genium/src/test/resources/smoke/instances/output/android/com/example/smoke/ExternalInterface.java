/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface ExternalInterface {
    public enum SomeEnum {
        SOME_VALUE(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public final static class SomeStruct {
        @NonNull
        public String someField;
        public SomeStruct(@NonNull final String someField) {
            this.someField = someField;
        }
    }
    void someMethod(final byte someParameter);
    @NonNull
    String getSomeProperty();
}
