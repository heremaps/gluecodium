/*

 *
 */

@file:JvmName("SomeInternalEnumExtensions")


package com.example.smoke


internal enum class SomeInternalEnum(@JvmField @JvmSynthetic internal val value: Int) {
    ONE(1),
    TWO(2),
    THREE(3);

    companion object {
        @JvmField @JvmSynthetic internal val SINGLE = SomeInternalEnum.ONE
    }

}
