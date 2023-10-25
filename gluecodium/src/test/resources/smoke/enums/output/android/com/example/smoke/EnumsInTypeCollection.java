/*

 *
 */

package com.example.smoke;


public final class EnumsInTypeCollection {
    public enum TCEnum {
        FIRST(0),
        SECOND(1);
        /**
         * @hidden
         */
        public final int value;

        TCEnum(final int value) {
            this.value = value;
        }
    }


}

