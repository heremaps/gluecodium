/*

 *
 */

package com.example.smoke;


public enum EnumWithAlias {
    ONE(2),
    TWO(3),
    THREE(4);

    public final static EnumWithAlias FIRST = EnumWithAlias.ONE;
    public final static EnumWithAlias THE_BEST = EnumWithAlias.FIRST;

    /**
     * @hidden
     */
    public final int value;

    EnumWithAlias(final int value) {
        this.value = value;
    }
}
