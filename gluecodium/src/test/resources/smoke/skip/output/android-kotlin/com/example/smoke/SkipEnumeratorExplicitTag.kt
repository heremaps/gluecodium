/*

 *
 */

@file:JvmName("SkipEnumeratorExplicitTag")

package com.example.smoke


enum class SkipEnumeratorExplicitTag(@JvmField val value: Int) {
    ZERO(0),
    ONE(3),
    THREE(4);
}
