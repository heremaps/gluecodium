/*

 *
 */

package com.example.smoke


enum class EnumWithAlias(private val value: Int) {
    ONE(2),
    TWO(3),
    THREE(4);

    companion object {
        val FIRST = EnumWithAlias.ONE
        val THE_BEST = EnumWithAlias.FIRST
    }

}
