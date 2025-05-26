/*

 *
 */

@file:JvmName("FreeEnum")

package com.example.smoke


enum class FreeEnum(@JvmField val value: Int) {
    FOO(0),
    BAR(1);
}
