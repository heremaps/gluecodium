/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

public interface ExternalInterface {
    public enum SomeEnum {
        SOME_VALUE(0);
        /**
         * @hidden
         */
        public final int value;

        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static final class SomeStruct {
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

