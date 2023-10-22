/*

 *
 */

package com.example.smoke;


public enum SkipEnumeratorExplicitTag {
    ZERO(0),
    ONE(3),
    THREE(4);
    /**
     * @hidden
     */
    public final int value;

    SkipEnumeratorExplicitTag(final int value) {
        this.value = value;
    }
}
