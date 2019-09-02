/*
 *

 */
package com.example.smoke;
public enum FreeEnum {
    FOO(0),
    BAR(1);
    public final int value;
    FreeEnum(final int value) {
        this.value = value;
    }
}
