/*

 *
 */

package com.example.smoke;


public final class Constants {
    public static final boolean BOOL_CONSTANT = true;
    public static final int INT_CONSTANT = -11;
    public static final long UINT_CONSTANT = 4294967295L;
    public static final float FLOAT_CONSTANT = 2.71f;
    public static final double DOUBLE_CONSTANT = -3.14;
    public static final String STRING_CONSTANT = "Foo bar";
    public static final Constants.StateEnum ENUM_CONSTANT = Constants.StateEnum.ON;
    public enum StateEnum {
        OFF(0),
        ON(1);
        /**
         * @hidden
         */
        public final int value;

        StateEnum(final int value) {
            this.value = value;
        }
    }


}

