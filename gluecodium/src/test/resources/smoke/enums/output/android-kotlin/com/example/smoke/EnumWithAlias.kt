/*

 *
 */

@file:JvmName("EnumWithAlias")

package com.example.smoke


enum class EnumWithAlias(@JvmField val value: Int) {
    ONE(2),
    TWO(3),
    THREE(4);

    companion object {
        @JvmField val FIRST = EnumWithAlias.ONE
        @JvmField val THE_BEST = EnumWithAlias.FIRST
    }

}
