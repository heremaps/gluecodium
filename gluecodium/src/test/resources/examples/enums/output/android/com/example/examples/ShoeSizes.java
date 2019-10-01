/*
 *

 */

package com.example.examples;

public enum ShoeSizes {
    SMALL(39),
    BIGGER_THAN_SMALL(40),
    NORMAL(43),
    BIG(46);

    public final int value;

    ShoeSizes(final int value) {
        this.value = value;
    }
}