/*

 *
 */

package com.example.smoke;


public enum FreeEnum {
    FOO(0),
    BAR(1);
    /**
     * @hidden
     */
    public final int value;

    FreeEnum(final int value) {
        this.value = value;
    }
}
